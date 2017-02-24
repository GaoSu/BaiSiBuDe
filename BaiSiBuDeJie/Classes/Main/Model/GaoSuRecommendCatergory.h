//
//  GaoSuRecommendCatergory.h
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/22.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GaoSuRecommendCatergory : NSObject

/**
id
*/

@property (nonatomic,strong)NSString *ID;
/**
 *  总数
 */
@property (nonatomic,assign)NSNumber *count;
@property (nonatomic,strong)NSString *name;

/**
 *  当前的页码
 */
@property (nonatomic,assign)NSInteger currentPage;

//这个类对应的数据
@property (nonatomic,strong)NSMutableArray *users;
//总数
@property (nonatomic,assign)NSNumber *total;
@end
