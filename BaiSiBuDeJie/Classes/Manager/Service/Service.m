//
//  Myservice.m
//  MyFrameworkDemo
//
//  Created by suxx on 16/5/16.
//  Copyright © 2016年 suxx. All rights reserved.
//

#import "Service.h"
#import <AFNetworking/AFNetworking.h>

@implementation Request

@end
@implementation UploadRequest

@end
@implementation Response

@end

@implementation Service

static BOOL(^__responseCheck)(Response*) = nil;
+(void)setResponseCheck:(BOOL(^)(Response*))check{
    __responseCheck = check;
}
static  NSArray *__cookies = nil;
+(void)response:(Request*)req json:(NSDictionary*)json{
    Response *res = [[Response alloc] init];
    res.request = req;
    if (json){
        res.result = json;
        res.data = json[@"data"];
        res.message = json[@"desc"];
        if (!res.message) {
            res.message = @"出错了，并且没有错误信息";
        }
        if (json[@"result_code"]) {
            res.resultCode = [json[@"result_code"] integerValue];
            res.succeed = res.resultCode == 200;
        }else if(json[@"code"]){
            res.resultCode = [json[@"code"] integerValue];
            res.succeed = res.resultCode == 0;
        }else{
            res.resultCode = 9999;
            res.succeed = NO;
        }
    }else{
        res.result = nil;
        res.data = nil;
        res.resultCode = 9999;
//        res.message = @"没有返回正确的数据";
        res.message = @"网络异常！";
        res.succeed = NO;
    }
    if (__responseCheck) {
        if (__responseCheck(res)) {
            if (req.completion) {
                req.completion(res);
            }
        }
    }else{
        if (req.completion) {
            req.completion(res);
        }
    }
}
static NSMutableArray *__requestQueue;
///暂停接口的调用
+(void)pause:(Request*)request{
    [self request:request ignorePause:YES];
    if (__requestQueue == nil) {
        __requestQueue = [[NSMutableArray alloc] init];
    }
}
///继续调用
+(void)goon:(Request*)request{
    NSMutableArray *reqs = __requestQueue;
    __requestQueue = nil;
    if (request){
        [self request:request];
    }
    if (reqs) {
        for (Request *req in reqs) {
            [self request:req];
        }
    }
}
+(void)request:(Request *)request{
    [self request:request ignorePause:NO];
}
+(void)request:(Request *)request ignorePause:(BOOL)ignorePause{
    if (!ignorePause && __requestQueue) {
        [__requestQueue addObject:request];
        return;
    }
    static AFHTTPSessionManager *manamer;
    if (manamer == nil) {
        manamer = [AFHTTPSessionManager manager];
    }
    NSString *contentType = @"text/html";
    //参数编码
#if 0
    switch (request.encoding) {
        case LBRequestParameterEncodingURL:
        case LBRequestParameterEncodingURLEncodedInURL:
            if (![manamer.requestSerializer isKindOfClass:[AFHTTPRequestSerializer class]]) {
                manamer.requestSerializer = [AFHTTPRequestSerializer serializer];
                contentType = @"text/html";
            }
            break;
        case LBRequestParameterEncodingJSON:
            if (![manamer.requestSerializer isKindOfClass:[AFJSONRequestSerializer class]]) {
                manamer.requestSerializer = [AFJSONRequestSerializer serializer];
                contentType = @"application/json";
                //加上charset
                NSString *charset = (__bridge NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
                [manamer.requestSerializer setValue:[NSString stringWithFormat:@"%@; charset=%@", contentType,charset] forHTTPHeaderField:@"Content-Type"];
            }
            break;
        default:
            break;
    }
    manamer.requestSerializer.HTTPShouldHandleCookies = YES;
#endif
//    设置cookies
    if (__cookies) {
        NSDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:__cookies];
        for (NSString *key in headers.allKeys) {
            [manamer.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
        }
    }
    [manamer.requestSerializer setValue:contentType forHTTPHeaderField:@"Accept"];
    //HTTPS
    //    manamer.securityPolicy.allowInvalidCertificates = YES;
    
    AFJSONResponseSerializer *resSer = [AFJSONResponseSerializer serializer];
    resSer.readingOptions = NSJSONReadingMutableContainers;
    resSer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    manamer.responseSerializer = resSer;
    //请求成功
    void(^success)(NSURLSessionDataTask *,id) = ^(NSURLSessionDataTask *task, id responseObject){
        NSLog(@"\n收到响应：%zd\n%@\n%@",((NSHTTPURLResponse*)task.response).statusCode,request.path,responseObject);
        [self response:request json:responseObject];
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:task.currentRequest.URL];
        if (cookies && cookies.count > 0) {
            __cookies = cookies;
        }
    };
    //请求失败
    void(^failure)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"\n收到失败的响应：%@\n结果：%zd",error.localizedDescription,((NSHTTPURLResponse*)task.response).statusCode);
        [self response:request json:nil];
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:task.currentRequest.URL];
        if (cookies && cookies.count > 0) {
            __cookies = cookies;
        }
    };
    NSLog(@"\n开始请求：\nURL:\t%@\nMethod:\t%@\nParams:\t%@",request.path,request.method,request.params);
    
    manamer.requestSerializer.timeoutInterval = 30.0f;
    manamer.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", nil];
    if ([request isKindOfClass:[UploadRequest class]]) {
        UploadRequest *uploadReqeust = (UploadRequest*)request;
        [manamer POST:request.path parameters:request.params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            if (uploadReqeust.mimeType) {
                [formData appendPartWithFileData:uploadReqeust.file name:uploadReqeust.name fileName:uploadReqeust.fileName mimeType:uploadReqeust.mimeType];
            }else{
                [formData appendPartWithFormData:uploadReqeust.file name:uploadReqeust.name];
            }
        } progress:nil success:success failure:failure];
    }else{
        //根据POST,GET动态调用manager下对应的方法
        NSString *method = [request.method uppercaseString];
        if ([method isEqualToString:@"POST"]) {
            [manamer POST:request.path parameters:request.params progress:nil success:success failure:failure];
        }else if([method isEqualToString:@"PUT"]){
            [manamer PUT:request.path parameters:request.params success:success failure:failure];
        }else if([method isEqualToString:@"DELETE"]){
            [manamer DELETE:request.path parameters:request.params success:success failure:failure];
        }else{
            [manamer GET:request.path parameters:request.params progress:nil success:success failure:failure];
        }
        
    }
}
+(void)request:(NSString *)path method:(NSString *)method params:(NSDictionary<NSString *,id> *)params completion:(void (^)(Response *))completion{
    Request *request = [[Request alloc] init];
    request.path = path;
    request.method = method;
    request.encoding = LBRequestParameterEncodingJSON;
    request.params = params;
    request.completion = completion;
    [self request:request];
}
+(void)get:(NSString *)path params:(NSDictionary<NSString *,id> *)params completion:(void (^)(Response *))completion{
    Request *request = [[Request alloc] init];
    request.path = path;
    request.method = @"GET";
    request.encoding = LBRequestParameterEncodingJSON;
    request.params = params;
    
    request.completion = completion;
    [self request:request];
}
+(void)get:(NSString *)path dicParams:(NSDictionary<NSString *,id> *)params completion:(void (^)(Response *))completion{
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *urlStr = [NSString stringWithFormat:@"%@?requestJson=%@", path, jsonString];
    NSLog(@"requestUrl:%@", urlStr);
//    /Users/liu/Desktop/liuHang/BaiSiBuDeJie/BaiSiBuDeJie/Classes/Manager/Service/Service.m:213:22: 'stringByAddingPercentEscapesUsingEncoding:' is deprecated: first deprecated in iOS 9.0 - Use -stringByAddingPercentEncodingWithAllowedCharacters: instead, which always uses the recommended UTF-8 encoding, and which encodes for a specific URL component or subcomponent since each URL component or subcomponent has different rules for what characters are valid.
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    Request *request = [[Request alloc] init];
    request.path = urlStr;
    request.method = @"GET";
    request.encoding = LBRequestParameterEncodingJSON;
    request.params = nil;
    request.completion = completion;
    [self request:request];
}
+(void)post:(NSString *)path params:(NSDictionary<NSString *,id> *)params completion:(void (^)(Response *))completion{
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    Request *request = [[Request alloc] init];
    request.path = path;
    request.method = @"POST";
    request.encoding = LBRequestParameterEncodingURL;//LBRequestParameterEncodingJSON;
    request.params = @{@"requestJson":jsonString};
    request.completion = completion;
    [self request:request];
}
/// 上传请求
+(void)upload:(NSString*)path file:(NSData*)file name:(NSString*)name fileName:(NSString*)fileName mimeType:(NSString*)mimeType params:(NSDictionary<NSString*,id>*)params completion:(void(^)(Response* response))completion{
    UploadRequest *request = [[UploadRequest alloc] init];
    request.path = path;
    request.file = file;
    request.name = name;
    request.fileName = fileName;
    request.mimeType = mimeType;
    request.method = @"POST";
    request.encoding = LBRequestParameterEncodingJSON;
    request.params = params;
    request.completion = completion;
    [self request:request];
}
+(void)upload:(NSString *)path file:(NSData *)file name:(NSString *)name params:(NSDictionary<NSString *,id> *)params completion:(void (^)(Response *))completion{
    UploadRequest *request = [[UploadRequest alloc] init];
    request.path = path;
    request.file = file;
    request.name = name;
    request.fileName = nil;
    request.mimeType = nil;
    request.method = @"POST";
    request.encoding = LBRequestParameterEncodingJSON;
    request.params = params;
    request.completion = completion;
    [self request:request];
}
+(void)downImage:(NSString*)path params:(NSDictionary<NSString*,id>*)params completion:(void(^)(id   responseObject))completion failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    AFHTTPSessionManager *manage=[AFHTTPSessionManager manager];
    manage.responseSerializer = [AFHTTPResponseSerializer serializer];
    manage.requestSerializer = [AFJSONRequestSerializer serializer];
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"image/jpeg", nil];
    [manage.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manage POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
        NSLog(@"error==%@",[error description]);
    }];
}


@end
