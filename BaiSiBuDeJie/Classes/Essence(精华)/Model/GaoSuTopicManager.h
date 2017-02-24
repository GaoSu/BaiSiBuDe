//
//  GaoSuTopicManager.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"

@interface GaoSuTopicManager : NSObject

+(GaoSuTopicManager *)shareInstanced;

- (void)getTopicWithlist:(NSString *)list withDate:(NSString *)data withTpye:(NSInteger)type withCompletion:(void (^)(Response *response))completion;

- (void)getTopicWithPrarms:(NSDictionary *)prarms :(void (^)(Response *response))completion;

@end
