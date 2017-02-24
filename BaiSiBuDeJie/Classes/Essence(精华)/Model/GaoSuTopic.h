//
//  GaoSuTopic.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GaoSuComment;
@interface GaoSuTopic : NSObject

/** id*/
@property (nonatomic, copy) NSString *ID;
/** 名称*/
@property (nonatomic, copy) NSString *name;
/** 头像*/
@property (nonatomic, copy) NSString *profile_image;
/** 发帖时间*/
@property (nonatomic, copy) NSString *create_time;
/** 文字时间*/
@property (nonatomic, copy) NSString *text;
/** 踩的数量*/
@property (nonatomic, assign) NSInteger ding;
/** 踩的数量*/
@property (nonatomic, assign) NSInteger cai;
/** 转发的数量*/
@property (nonatomic, assign) NSInteger repost;
/** 评论的数量*/
@property (nonatomic, assign) NSInteger comment;
/** 是否是新浪加v用户*/
@property (nonatomic, assign, getter=isSina_v) BOOL sina_v;
/** 图片的宽度*/
@property (nonatomic, assign) CGFloat width;
/** 图片的高度*/
@property (nonatomic, assign) CGFloat height;
/** 小图片路径*/
@property (nonatomic, copy) NSString *small_image;
/** 大图片路径*/
@property (nonatomic, copy) NSString *large_image;
/** 中图片路径*/
@property (nonatomic, copy) NSString *middle_image;
/** 音频时长*/
@property (nonatomic, assign) NSInteger voicetime;
/** 视频时长*/
@property (nonatomic, assign) NSInteger videotime;
/** 播放次数*/
@property (nonatomic, assign) int playcount;
/** 视频路径*/
@property (nonatomic, copy) NSString *videouri;
/** 最热评论(存放YMComment数据)*/
@property (nonatomic, strong) GaoSuComment *top_cmt;
/** ctime*/
@property (nonatomic, copy) NSString *qzone_uid;




//额外的属性
@property (nonatomic,assign,readonly)CGFloat cellHeight;
@property (nonatomic,assign)YMTopicType type;
@property (nonatomic,assign)BOOL isBigPicture;//图片是否是大图
@property (nonatomic,assign)CGRect pictureF;//图片的位置
@property (nonatomic,assign)CGRect voiceF; //声音的位置
@property (nonatomic,assign)CGRect videoF; //视频的位置
@property (nonatomic,assign)CGFloat pictureProgress;//图片的进度

@end
