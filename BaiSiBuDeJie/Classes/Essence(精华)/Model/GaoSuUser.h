//
//  GaoSuUser.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GaoSuUser : NSObject

/** 用户名*/
@property (nonatomic, copy) NSString *username;
/** 性别*/
@property (nonatomic, copy) NSString *sex;
/** 头像*/
@property (nonatomic, copy) NSString *profile_image;

@end
