//
//  UIBarButtonItem+YMExtension.m
//  ImitateBaisi
//
//  Created by 杨蒙 on 16/2/12.
//  Copyright © 2016年 hrscy. All rights reserved.
//

#import "UIBarButtonItem+YMExtension.h"

@implementation UIBarButtonItem (YMExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    //设置按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.size = button.currentBackgroundImage.size;
    return [[self alloc] initWithCustomView:button];
}

@end
