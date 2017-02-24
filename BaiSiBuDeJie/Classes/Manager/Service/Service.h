//
//  Myservice.h
//  MyFrameworkDemo
//
//  Created by suxx on 16/5/16.
//  Copyright © 2016年 suxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Response;

/**
 *	@brief	请求参数编码
 */
typedef enum : NSUInteger{
    LBRequestParameterEncodingURL = 0,
    LBRequestParameterEncodingURLEncodedInURL,
    LBRequestParameterEncodingJSON,
} LBRequestParameterEncoding;
/**
 *	@brief	接口请求
 */
@interface Request : NSObject

@property (strong,nonatomic) NSString *path;
@property (strong,nonatomic) NSString *method;
@property (assign,nonatomic) LBRequestParameterEncoding encoding;
@property (strong,nonatomic) NSDictionary<NSString*,id> *params;
@property (strong,nonatomic) void(^completion)(Response*);

@end
/// 上传请求
@interface UploadRequest : Request

@property (strong,nonatomic) NSData *file;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *fileName;
@property (strong,nonatomic) NSString *mimeType;

@end

/**
 *	@brief	请求响应
 */
@interface Response : NSObject

@property (strong,nonatomic) Request *request;
@property (assign,nonatomic) NSInteger resultCode;
@property (strong,nonatomic) NSString *message;
@property (assign,nonatomic) BOOL succeed;
@property (strong,nonatomic) id data;
@property (strong,nonatomic) NSDictionary<NSString*,id> *result;

@end

@interface Service : NSObject
///检查返回的数据
+(void)setResponseCheck:(BOOL(^)(Response*))check;

///暂停接口的调用(可保证在调用goon之前的请求不会执行，但会执行下一个调用pause的请求)
+(void)pause:(Request*)request;
///继续调用(调用后先调用参数指定的请求，再继续调用之前被暂停的请求)
+(void)goon:(Request*)request;
///请求接口
+(void)request:(Request*)request;
///请求接口
+(void)request:(NSString *)path method:(NSString*)method params:(NSDictionary<NSString*,id>*)params completion:(void(^)(Response*))completion;
///GET请求
+(void)get:(NSString*)path params:(NSDictionary<NSString*,id>*)params completion:(void(^)(Response* response))completion;
///GET请求 参数里面带有字典
+(void)get:(NSString *)path dicParams:(NSDictionary<NSString *,id> *)params completion:(void (^)(Response *response))completion;
///POST请求
+(void)post:(NSString*)path params:(NSDictionary<NSString*,id>*)params completion:(void(^)(Response* response))completion;
///上传请求
+(void)upload:(NSString*)path file:(NSData*)file name:(NSString*)name fileName:(NSString*)fileName mimeType:(NSString*)mimeType params:(NSDictionary<NSString*,id>*)params completion:(void(^)(Response* response))completion;
+(void)upload:(NSString*)path file:(NSData*)file name:(NSString*)name params:(NSDictionary<NSString*,id>*)params completion:(void(^)(Response* response))completion;
// 图形验证码 图片
+(void)downImage:(NSString*)path params:(NSDictionary<NSString*,id>*)params completion:(void(^)(id   responseObject))completion failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;



@end
