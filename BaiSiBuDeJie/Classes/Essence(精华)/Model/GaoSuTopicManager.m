//
//  GaoSuTopicManager.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuTopicManager.h"
#import "URLConfig.h"
@implementation GaoSuTopicManager

+(GaoSuTopicManager *)shareInstanced{
    static GaoSuTopicManager *currentObj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        currentObj = [[GaoSuTopicManager alloc] init];
    });
    
    return currentObj;
}

- (void)getTopicWithlist:(NSString *)list withDate:(NSString *)data withTpye:(NSInteger )type withCompletion:(void (^)(Response *))completion{
    NSDictionary *paramDic = @{@"a":list, @"c":data, @"type":@(type)};
    [Service get:TOPIC params:paramDic completion:^(Response *response) {
        
            //这个地方你可自定义回调
        NSLog(@"-----%@",response.data);
        completion(response);
    }];
    

}

- (void)getTopicWithPrarms:(NSDictionary *)prarms :(void (^)(Response *))completion{

    [Service get:TOPIC params:prarms completion:^(Response *response) {
        NSLog(@"%@",response.data);
    }];
    
}

@end
