//
//  GaoSuVerticalButton.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/12.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuVerticalButton.h"

@implementation GaoSuVerticalButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    //这里可以自定义很多东西
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //调整图片
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.height;
    //调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;

}
@end
