//
//  GaoSuTopic.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuTopic.h"
#import "GaoSuComment.h"
#import "GaoSuUser.h"
#import "NSDate+YMExtension.h"
#import <MJExtension.h>
@implementation GaoSuTopic{
    CGFloat _cellHeight;//用来储存高度
}


+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID" : @"id",
             @"small_image" : @"image0",
             @"large_image" : @"image1",
             @"middle_image" : @"image2",
             @"top_cmt" : @"top_cmt[0]",
             @"qzone_uid" : @"top_cmt[0].user.qzone_uid"
             };
}

+(NSDictionary *)mj_objectClassInArray {
    return @{@"top_cmt" : @"GaoSuComment"};
}

//这种可以直接拿来用
-(NSString *)create_time{

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    //创建时间
    NSDate  *createDate = [fmt dateFromString:_create_time];
    //当前时间
    NSDate *now = [NSDate date];
    
    //日历
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *comps = [calender components:unit fromDate:createDate toDate:now options:0];
    
    if ([createDate isThisYear]) { //今年
        if ([createDate isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else if ([createDate isToday]) {
            if (comps.hour >= 1) {
                return [NSString stringWithFormat:@"%d小时前", (int)comps.hour];
            } else if (comps.minute >= 1) {
                return [NSString stringWithFormat:@"%d分钟前", (int)comps.minute];
            } else {
                return @"刚刚";
            }
        } else {
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else { //不是今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        return [fmt stringFromDate:createDate];
    }

}

- (CGFloat)cellHeight{
    if (!_cellHeight) {
        // 文字的最大尺寸
        CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 4 *YMTopicCellMargin, MAXFLOAT);
        //计算文字的高度
        CGFloat textH = [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:14]} context:nil].size.height;
        _cellHeight = YMTopicCellTextY + textH + YMTopicCellMargin;
        //根据段子类型来计算cell的高度
        if (self.type == YMTopicTypePicture) {//图片帖子
            //图片显示的宽度
            CGFloat pictureW = maxSize.width;
            //图片显示的高度
            CGFloat pictureH = self.height  / self.width  * pictureW ;
            if (pictureH >= YMTopicCellPictureBreakH) {
                pictureH = YMTopicCellPictureBreakH;//如果图片过长
                self.isBigPicture = YES;
            }
            //计算图片空间的frame
            CGFloat pictureX = YMTopicCellMargin;
            CGFloat pictureY = YMTopicCellTextY + textH + YMTopicCellMargin * 2;
            _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
            _cellHeight += pictureH + YMTopicCellMargin;
        }else if (self.type == YMTopicTypeVoice){//声音帖子
            CGFloat voiceX = YMTopicCellMargin;
            CGFloat voiceY = YMTopicCellTextY + textH + YMTopicCellMargin;
            CGFloat voiceW = maxSize.width;
            CGFloat voiceH = self.height  / self.width  * voiceW;
            _voiceF = CGRectMake(voiceX, voiceY, voiceW, voiceH);
            _cellHeight += voiceH + YMTopicCellMargin;
        }else if (self.type == YMTopicTypeVideo){//视频帖子
            CGFloat videoX = YMTopicCellMargin;
            CGFloat videoY = YMTopicCellTextY + textH + YMTopicCellMargin;
            CGFloat videoW = maxSize.width;
            CGFloat videoH = self.height / self.width  * videoW;
            _videoF = CGRectMake(videoX, videoY, videoW, videoH);
            _cellHeight += videoH + YMTopicCellMargin;
        }

        if (self.top_cmt) {
            NSString *content = [NSString stringWithFormat:@"%@:%@",self.top_cmt.user.username,self.top_cmt];
            CGFloat contentH = [content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
            _cellHeight += YMTopicCellCmtTitleH + contentH + YMTopicCellMargin;
        }
        //底部的高度
        _cellHeight += YMTopicCellBottomBarH + YMTopicCellMargin;
    }
//    NSLog(@"----%f",_cellHeight);
    return _cellHeight;
}
@end
