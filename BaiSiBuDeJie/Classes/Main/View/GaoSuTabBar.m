//
//  GaoSuTabBar.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuTabBar.h"
#import "GaoSuPublishView.h"

@interface GaoSuTabBar ()
@property (nonatomic,weak)UIButton *pusblishBtn;
@end

@implementation GaoSuTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        //设置发布按钮
        UIButton *pushlisdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [pushlisdBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [pushlisdBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [pushlisdBtn addTarget:self action:@selector(publishBtnClick) forControlEvents:UIControlEventTouchUpInside];
        CGSize size = pushlisdBtn.currentBackgroundImage.size;
        pushlisdBtn.size = size;
        [self addSubview:pushlisdBtn];
        self.pusblishBtn = pushlisdBtn;
    }
    
    return self;
}

- (void)publishBtnClick{
    
    [GaoSuPublishView show];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //自定义tabbar的位置
    CGFloat width  = self.width;
    CGFloat height = self.height;
    //发布按钮
    self.pusblishBtn.center = CGPointMake(width/2, height/2);
    //其他的按钮
    CGFloat btnY = 0;
    CGFloat btnW = width/5;
    CGFloat btnH = height;
    NSInteger index = 0;
    
    for (UIView *btn in self.subviews) {
        if (![btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        //超过1就加一
        CGFloat btnX = btnW * ((index > 1) ? (index + 1) : index);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        index ++;
    }
}

@end
