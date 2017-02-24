//
//  GaoSuConst.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <UIKit/UIKit.h>

CGFloat const YMTitlesViewH = 35;
CGFloat const YMTitlesViewY = 64;

CGFloat const YMTopicCellMargin = 10;
CGFloat const YMTopicCellTextY = 70;
CGFloat const YMTopicCellBottomBarH = 44;

/** 精华-cell-图片帖子的最大高度*/
CGFloat const YMTopicCellPictureMaxH = 1000;
/** 精华-cell-图片帖子的一旦超过最大高度，就用Break*/
CGFloat const YMTopicCellPictureBreakH = 250;

/** 用户模型性别属性值-男*/
NSString *const YMUserSexMale = @"m";
/** 用户模型性别属性值-女*/
NSString *const YMUserSexFamale = @"f";
/** 最热评论标题的高度*/
CGFloat const YMTopicCellCmtTitleH = 20;
/** tabBar 被点击的通知*/
NSString *const YMTabBarDidSelectedNotification = @"YMTabBarDidSelectedNotification";
/** tabBar 被点击的通知 - 被点击的控制器的 index key*/
NSString *const YMSelectedControllerIndexKey = @"YMSelectedControllerIndexKey";
/** tabBar 被点击的通知 - 被点击的控制器 key*/
NSString *const YMSelectedControllerKey = @"YMSelectedControllerKey";

