//
//  GaoSuNavVc.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuNavigationController.h"

@interface GaoSuNavigationController ()

@end

@implementation GaoSuNavigationController


/**
   当第一次使用这个类的时候调用
 **/

+ (void)initialize{
    //不要这样
 //   UINavigationBar *navBar = [[UINavigationBar alloc]init];
    NSArray *arr = [NSArray arrayWithObject:[self class]];
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:arr];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        backButton.size =CGSizeMake(70, 30);
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
//        backButton.backgroundColor = [UIColor lightGrayColor];
        //让按钮全部左对齐
        backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
   //这句的super的push要放在后面，让viewController可以覆盖上面的leftbaritem
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}
@end
