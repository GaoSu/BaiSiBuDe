//
//  GaoSuConst.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    YMTopicTypeAll = 1,
    YMTopicTypePicture = 10,
    YMTopicTypeWord = 29,
    YMTopicTypeVoice = 31,
    YMTopicTypeVideo = 41,
}YMTopicType;

// 这里做一些统一的配置

/** 精华-所有顶部标题的高度*/
UIKIT_EXTERN CGFloat const YMTitlesViewH;
/** 精华-所有顶部标题的y*/
UIKIT_EXTERN CGFloat const YMTitlesViewY;

/** 精华-cell的间距*/
UIKIT_EXTERN CGFloat const YMTopicCellMargin;
/** 精华-cell文字的y*/
UIKIT_EXTERN CGFloat const YMTopicCellTextY;
/** 精华-cell底部工具条的高度*/
UIKIT_EXTERN CGFloat const YMTopicCellBottomBarH;
/** 精华-cell-图片帖子的最大高度*/
UIKIT_EXTERN CGFloat const YMTopicCellPictureMaxH;
/** 精华-cell-图片帖子的一旦超过最大高度，就用Break*/
UIKIT_EXTERN CGFloat const YMTopicCellPictureBreakH;
/** 用户模型性别属性值-男*/
UIKIT_EXTERN NSString *const YMUserSexMale;
/** 用户模型性别属性值-女*/
UIKIT_EXTERN NSString *const YMUserSexFamale;
/** 最热评论标题的高度*/
UIKIT_EXTERN CGFloat const YMTopicCellCmtTitleH;
/** tabBar 被点击的通知*/
UIKIT_EXTERN NSString *const YMTabBarDidSelectedNotification;
/** tabBar 被点击的通知 - 被点击的控制器的 index key*/
UIKIT_EXTERN NSString *const YMSelectedControllerIndexKey;
/** tabBar 被点击的通知 - 被点击的控制器 key*/
UIKIT_EXTERN NSString *const YMSelectedControllerKey;
