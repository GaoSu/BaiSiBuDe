//
//  UIImage+YJExtension.m
//  Baisibudejie
//
//  Created by 杨蒙 on 16/4/24.
//  Copyright © 2016年 hrscy. All rights reserved.
//

#import "UIImage+YJExtension.h"

@implementation UIImage (YJExtension)

-(UIImage *)circleImage {
    //NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    //裁剪
    CGContextClip(ctx);
    //将图片画上去
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
