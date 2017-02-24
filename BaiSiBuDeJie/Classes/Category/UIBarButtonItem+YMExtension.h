//
//  UIBarButtonItem+YMExtension.h
//  ImitateBaisi
//
//  Created by 杨蒙 on 16/2/12.
//  Copyright © 2016年 hrscy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YMExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
