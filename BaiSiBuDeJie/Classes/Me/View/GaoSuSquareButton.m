//
//  GaoSuSquareButton.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/22.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuSquareButton.h"
#import "GaoSuSquare.h"
#import "UIButton+WebCache.h"
@implementation GaoSuSquareButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}


- (void)setup{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setBackgroundImage:[UIImage imageNamed:@"mainCellBackground"] forState:UIControlStateNormal];
//    self.backgroundColor = [UIColor cyanColor];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //调整图片
    self.imageView.y = self.height * 0.15;
    self.imageView.width = self.width *0.5;
    self.imageView.height = self.imageView.width;
    self.imageView.centerX = self.width * 0.5;
    //调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

- (void)setModel:(GaoSuSquare *)model{
    _model = model;
    
    [self setTitle:model.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
