//
//  GaoSuVideoView.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GaoSuTopic;
@interface GaoSuVideoView : UIView
@property (nonatomic,strong)GaoSuTopic *topic;
+(instancetype)videoView;


@end
