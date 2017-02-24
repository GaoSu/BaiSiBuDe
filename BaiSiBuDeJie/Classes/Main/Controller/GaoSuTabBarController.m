//
//  GaoSuViewController.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuTabBarController.h"
//这里需要四个子控制器
#import "GaoSuEssenceViewController.h"
#import "GaoSuNewViewController.h"
#import "GaoSuFirendTrendsViewController.h"
#import "GaoSuMeViewController.h"

//自定义的nav
#import "GaoSuNavigationController.h"

#import "GaoSuTabBar.h"
@interface GaoSuTabBarController ()

@end

@implementation GaoSuTabBarController

+ (void)initialize{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];//设置为灰色
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];//黑色
    
    //通过appearance 统一设置tabbar的样式
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置自控制器
    [self setChildController:[[GaoSuEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setChildController:[[GaoSuNewViewController alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setChildController:[[GaoSuFirendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setChildController:[[GaoSuMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    //设置自定义的tarbar
    [self setValue:[[GaoSuTabBar alloc] init] forKey:@"tabBar"];
    // Do any additional setup after loading the view.
}

/**
 初始化自控制器
 
 */
- (void)setChildController:(UIViewController *)controller title:(NSString *)title image:(NSString  *)image selectedImage:(NSString *)selectedImage{
    //设置
    controller.navigationItem.title = title;
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    GaoSuNavigationController *nav = [[GaoSuNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];

}
@end
