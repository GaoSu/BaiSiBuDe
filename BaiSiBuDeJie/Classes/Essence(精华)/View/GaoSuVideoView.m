//
//  GaoSuVideoView.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuVideoView.h"
#import "UIImageView+WebCache.h"
#import "GaoSuTopic.h"
@interface GaoSuVideoView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *videotimeLabel;

@property (weak, nonatomic) IBOutlet UILabel *playcountLabel;

@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end


@implementation GaoSuVideoView

+(instancetype)videoView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)setTopic:(GaoSuTopic *)topic{
    _topic = topic;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    
    self.playcountLabel.text = [NSString stringWithFormat:@"%d播放",topic.playcount];
    
    NSInteger minute = topic.videotime / 60;
    NSInteger second = topic.videotime % 60;
    self.videotimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd",minute,second];

}
- (void)awakeFromNib{
    //如果发现控件的位置和尺寸不是自己设置的，那么有可能是自动伸缩属性导致
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled = YES;
}

@end
