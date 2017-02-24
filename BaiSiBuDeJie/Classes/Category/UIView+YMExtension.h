//
//  UIView+YMExtension.h
//  ImitateBaisi
//
//  Created by hrscy on 16/2/12.
//  Copyright © 2016年 hrscy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YMExtension)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

/**
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

@end
