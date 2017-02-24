//
//  GaoSuRecommendCatergory.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/22.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuRecommendCatergory.h"
#import <MJExtension.h>
@implementation GaoSuRecommendCatergory


+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID":@"id"
             };
}
-(NSMutableArray *)users{
    if (_users == nil) {
        _users = [NSMutableArray array];
    }
    return _users;
}
@end
