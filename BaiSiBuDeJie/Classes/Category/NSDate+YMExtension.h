//
//  NSDate+YMExtension.h
//  ImitateBaisi
//
//  Created by 杨蒙 on 16/2/16.
//  Copyright © 2016年 hrscy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YMExtension)
/**
 *  判断某个时间是否为今年
 */
-(BOOL)isThisYear;
/**
 *  判断是否为昨天
 */
-(BOOL)isYesterday;
/**
 *  判断是否为今天
 */
-(BOOL)isToday;

@end
