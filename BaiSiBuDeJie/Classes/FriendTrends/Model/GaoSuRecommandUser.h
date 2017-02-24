//
//  GaoSuRecommandUser.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/22.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GaoSuRecommandUser : NSObject

/**
 *  头像
 */
@property (nonatomic, copy) NSString *header;
/**
 *  粉丝数
 */
@property (nonatomic, assign) NSInteger fans_count;
/**
 *  昵称
 */
@property (nonatomic, copy) NSString *screen_name;


@end
