//
//  GaoSuTopicTableViewCell.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GaoSuTopic;

@interface GaoSuTopicCell : UITableViewCell

@property (nonatomic,strong)GaoSuTopic *topic;

+(instancetype)cell;
@end
