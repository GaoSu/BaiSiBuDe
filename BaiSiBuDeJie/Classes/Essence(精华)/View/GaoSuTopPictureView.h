//
//  GaoSuTopPictureView.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/11.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GaoSuTopic;
@interface GaoSuTopPictureView : UIView
@property (nonatomic,strong)GaoSuTopic *topic;
+(instancetype)pictureView;
@end
