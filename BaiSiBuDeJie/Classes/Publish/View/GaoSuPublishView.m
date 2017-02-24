//
//  GaoSuPublishView.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuPublishView.h"
#import "GaoSuVerticalButton.h"
#import "POP.h"
@implementation GaoSuPublishView

static UIWindow *window_;
static CGFloat const GaoSuAnimationSpringFactor = 8;
static CGFloat const GaoSuAnimationDelay = 0.1;


+ (instancetype)publishView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

+(void)show{

    window_ = [[UIWindow alloc]init];
    window_.frame = [UIScreen mainScreen].bounds;
    window_.backgroundColor = [UIColor whiteColor];
    window_.hidden = NO;
    GaoSuPublishView *publshView = [GaoSuPublishView publishView];
    publshView.frame = window_.bounds;
    [window_ addSubview:publshView];
    
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    //中间的六个按钮
    int maxCols = 3;
    CGFloat buttonW = 72;
    CGFloat buttonH = buttonW + 30;
    CGFloat buttonStartY = (SCREENH - 2 * buttonH) * 0.5;
    CGFloat buttonStartX = 25;
    CGFloat xMargin = (SCREENW - 2 * buttonStartX - maxCols * buttonW) / (maxCols - 1);

    for (int i = 0; i < 6; i++) {
        GaoSuVerticalButton *button = [[GaoSuVerticalButton alloc]init];
        [self addSubview:button];
        button.tag = i;
        //添加事件
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        //计算xy
        int row = i / maxCols;
        int col = i % maxCols;
        CGFloat buttonX = buttonStartX + col * (xMargin + buttonW);
        CGFloat buttonEndY = buttonStartY + row * buttonH;
        CGFloat buttonBeginY = buttonEndY - SCREENH;
        
        //添加动画
        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        animation.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonBeginY, buttonW, buttonH)];
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonEndY, buttonW, buttonH)];
        animation.springSpeed = GaoSuAnimationSpringFactor;
        animation.springBounciness = GaoSuAnimationSpringFactor;
        animation.beginTime = CACurrentMediaTime() + GaoSuAnimationDelay * i;
        [button pop_addAnimation:animation forKey:nil];
    }
    //添加标语
    UIImageView *sloganView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    [self addSubview:sloganView];
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    CGFloat centerX = SCREENW * 0.5;
    CGFloat centerEndY = SCREENH * 0.2;
    CGFloat centerBeginY = centerEndY - SCREENH;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerBeginY)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerEndY)];
    animation.beginTime = CACurrentMediaTime() + GaoSuAnimationDelay * images.count;
    [animation setCompletionBlock:^(POPAnimation *animation, BOOL finish) {
        self.userInteractionEnabled = YES;
    }];
    [sloganView pop_addAnimation:animation forKey:nil];
}

#pragma mark - 取消
- (void)cancel{
    self.userInteractionEnabled = NO;
    
    int beginIndex = 1;
    
    for (int i = beginIndex; i < self.subviews.count; i++){
        UIView *subview = self.subviews[i];
        POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        CGFloat centerY = subview.centerY + SCREENH;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        animation.toValue = [NSValue valueWithCGPoint:CGPointMake(subview.centerX, centerY)];
        animation.beginTime = CACurrentMediaTime() + GaoSuAnimationDelay * (i - beginIndex);
        [subview pop_addAnimation:animation forKey:nil];
        
        if (i == self.subviews.count - 1) {
            [animation setCompletionBlock:^(POPAnimation *anim, BOOL fish) {
                window_.hidden = YES;
                window_ = nil;
            }];
        }
    }
    

}
- (IBAction)dismissClick:(UIButton *)sender {
    [self cancel];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self cancel];
}
@end
