//
//  GaoSuTopicTableViewCell.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuTopicCell.h"
#import "GaoSuTopPictureView.h"
#import "GaoSuVideoView.h"
#import "GaoSuVoiceView.h"
#import "GaoSuTopic.h"
#import "UIImageView+YMExtension.h"
#import "GaoSuUser.h"
#import "GaoSuComment.h"
@interface GaoSuTopicCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIImageView *sina_VimageView;
@property (weak, nonatomic) IBOutlet UILabel *text_label;

@property (weak, nonatomic) IBOutlet UIView *topCmView;
@property (weak, nonatomic) IBOutlet UILabel *topCmcontentLabel;

@property (nonatomic,weak)GaoSuVideoView *videoView;
@property (nonatomic,weak)GaoSuTopPictureView *pictureView;
@property (nonatomic,weak)GaoSuVoiceView *voiceView;

@end

@implementation GaoSuTopicCell


+ (instancetype)cell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
  
    UIImageView *bgView = [[UIImageView alloc]init];
    bgView.image = [UIImage imageNamed:@"mainCellBackground"];
    self.backgroundView = bgView;
}

- (GaoSuVoiceView *)voiceView{
    if (_voiceView == nil) {
        GaoSuVoiceView *voiceView = [GaoSuVoiceView voiceView];
        [self.contentView addSubview:voiceView];
        _voiceView = voiceView;
    }
    return _voiceView;;
}

-(GaoSuVideoView *)videoView{
    if (_videoView  == nil) {
        GaoSuVideoView *videoView = [GaoSuVideoView videoView];
        [self.contentView addSubview:videoView];
        _videoView = videoView;
    }
    return _videoView;
}


-(GaoSuTopPictureView *)pictureView{
    if (_pictureView == nil) {
        GaoSuTopPictureView *pictureView = [GaoSuTopPictureView pictureView];
        [self.contentView addSubview:pictureView];
        _pictureView = pictureView;
    }
    return _pictureView;
}

- (void)setTopic:(GaoSuTopic *)topic{
    _topic = topic;
    self.sina_VimageView.hidden = ! topic.sina_v;
    [self.profileImageView setCircleHeader:topic.profile_image];
    
    self.nameLabel.text = topic.name;
    
    self.createTimeLabel.text = topic.create_time;
    self.text_label.text = topic.text;
    
    //设置按钮
    [self setupButtonTitle:self.dingBtn count:topic.ding placeholder:@"顶"];
    [self setupButtonTitle:self.caiBtn count:topic.cai placeholder:@"踩"];
    [self setupButtonTitle:self.shareBtn count:topic.repost placeholder:@"分享"];
    [self setupButtonTitle:self.commentBtn count:topic.comment placeholder:@"评论"];
    // 根据不同类型的帖子，，设置
    if (topic.type == YMTopicTypePicture) {
        self.pictureView.hidden = NO;
        self.voiceView.hidden = YES;
        self.videoView.hidden = YES;
        self.pictureView.topic = topic;
        self.pictureView.frame = topic.pictureF;
    } else if (topic.type == YMTopicTypeVoice) { // 声音帖子
        self.voiceView.hidden = NO;
        self.voiceView.topic = topic;
        self.voiceView.frame = topic.voiceF;
        
        self.pictureView.hidden = YES;
        self.videoView.hidden = YES;
    } else if (topic.type == YMTopicTypeVideo) { // 视频帖子
        self.videoView.hidden = NO;
        self.videoView.topic = topic;
        self.videoView.frame = topic.videoF;
        
        self.voiceView.hidden = YES;
        self.pictureView.hidden = YES;
    } else { // 段子帖子
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
        self.pictureView.hidden = YES;
    }
//处理最热评论
    if (topic.top_cmt) {
        self.topCmView.hidden = NO;
        self.topCmcontentLabel.text = [NSString stringWithFormat:@"%@:%@", topic.top_cmt.user.username, topic.top_cmt.content];
    }else{
        self.topCmView.hidden = YES;
    }
    
}

- (void)setFrame:(CGRect)frame{

    frame.origin.x = YMTopicCellMargin;
    frame.size.width -= 2 * YMTopicCellMargin;
    frame.size.height = self.topic.cellHeight;
    frame.origin.y += YMTopicCellMargin;
    [super setFrame:frame];
}
-(void)setupButtonTitle:(UIButton *)button count:(NSInteger)count placeholder:(NSString *)placeholder {
    if (count > 10000) {
        placeholder = [NSString stringWithFormat:@"%.1f万", count / 10000.0];
    } else if (count > 0) {
        placeholder = [NSString stringWithFormat:@"%zd", count];
    }
    [button setTitle:placeholder forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
