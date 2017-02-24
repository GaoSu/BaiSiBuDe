//
//  GaoSuTopPictureView.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuTopPictureView.h"

#import "GaoSuTopic.h"

#import "GaoSuProgressView.h"

#import "UIImageView+WebCache.h"

#import "GaoSuShowPictureViewController.h"
@interface GaoSuTopPictureView ()
/** 图片*/
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** gif图片*/
@property (weak, nonatomic) IBOutlet UIImageView *gifView;
/** 查看大图*/
@property (weak, nonatomic) IBOutlet UIButton *seeBigButton;
///进度指示器
@property (weak, nonatomic) IBOutlet GaoSuProgressView *progressView;
@end

@implementation GaoSuTopPictureView

+(instancetype)pictureView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.autoresizingMask = UIViewAutoresizingNone;
    self.imageView.userInteractionEnabled = YES;
    ///添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPicture)];
    [self.imageView addGestureRecognizer:tap];
    
}

- (void)showPicture{
  //
    GaoSuShowPictureViewController *showPictureVC = [[GaoSuShowPictureViewController alloc]init];
    showPictureVC.topic = self.topic;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:showPictureVC animated:YES completion:nil];
}

- (void)setTopic:(GaoSuTopic *)topic{
    _topic = topic;
    
    [self.progressView setProgress:topic.pictureProgress animated:NO];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.large_image] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        self.progressView.hidden = YES;
        if (topic.isBigPicture == NO) {
            return ;
        }
        [self.imageView setNeedsDisplay];
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSString *extension = topic.large_image.pathExtension;
        self.gifView.hidden = ![extension.lowercaseString isEqualToString:@"gif"];
        if (topic.isBigPicture) {
            self.seeBigButton.hidden = NO;
        }else{
            self.seeBigButton.hidden = YES;
        }
        
    }];

}

@end
