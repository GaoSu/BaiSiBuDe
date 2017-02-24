//
//  GaoSuMineFooterView.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/22.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuMineFooterView.h"
#import "AFNetworking.h"
#import "GaoSuSquare.h"
#import "MJExtension.h"
#import "GaoSuSquareButton.h"
#import "GaoSuWebViewController.h"
@implementation GaoSuMineFooterView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        // 发送请求
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSArray *squares = [GaoSuSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            
            // 创建方块
            [self createSquares:squares];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        }];

    }
    return self;
}

- (void)createSquares:(NSArray *)squares{
    int maxCols = 4;
    
    CGFloat buttonW = SCREENW / maxCols;
    CGFloat buttonH = buttonW;
    
    for (int i = 0; i < squares.count; i ++) {
        GaoSuSquareButton *button = [GaoSuSquareButton buttonWithType:UIButtonTypeCustom];
        button.model = squares[i];
        [self addSubview:button];
       
        [button addTarget:self action:@selector(squareClick:) forControlEvents:UIControlEventTouchUpInside];
        int col = i % maxCols;
        int row = i / maxCols;
        button.x = col * buttonW;
        button.y = row * buttonH;
        button.width = buttonW;
        button.height = buttonH;
    }
    NSInteger rows = (squares.count + maxCols - 1) / maxCols;
    self.height = rows * buttonH;
    self.setFootHeight(self.height);
    //重绘
//    [self]
    [self setNeedsDisplay];

}

- (void)squareClick:(GaoSuSquareButton *)button{
    if (![button.model.url hasPrefix:@"http"]) {
        return;
    }
    GaoSuWebViewController *webVC = [[GaoSuWebViewController alloc]init];
    webVC.title = button.model.name;
   //取出当前控制器的导航栏
    UITabBarController *tabBarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nav = (UINavigationController *)tabBarVC.selectedViewController;
    [nav pushViewController:webVC animated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
