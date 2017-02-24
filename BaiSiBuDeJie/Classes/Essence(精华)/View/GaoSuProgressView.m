//
//  GaoSuProgressView.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuProgressView.h"

@implementation GaoSuProgressView


- (void)awakeFromNib{
    [super awakeFromNib];
    self.roundedCorners = 2;
    self.progressLabel.textColor = [UIColor whiteColor];
}

- (void)setProgress:(CGFloat)progress{
    [super setProgress:progress];
    NSString *text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    self.progressLabel.text = text;
}
@end
