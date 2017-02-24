//
//  GaoSuMeViewController.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuMeViewController.h"
#import "GaoSuMineCell.h"
#import "GaoSuMineFooterView.h"
@interface GaoSuMeViewController ()

@end
@implementation GaoSuMeViewController
static NSString *mineID = @"mine";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    
    [self setupTableView];
    // Do any additional setup after loading the view.
}
- (void)setupNav{
    self.view.backgroundColor = GaoSuGlobalBg;
    self.navigationItem.title = @"我的";
    // 导航左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"nav_coin_icon" highImage:@"nav_coin_icon_click" target:self action:@selector(coinButtonClick)];
    //右边的导航栏
    self.navigationItem.rightBarButtonItems = @[[UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingButtonClick)],[UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonButtonClick)]];
}

- (void)setupTableView{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[GaoSuMineCell class] forCellReuseIdentifier:mineID];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = YMTopicCellMargin;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //设置footerView
    GaoSuMineFooterView *footerView = [[GaoSuMineFooterView alloc]init];
    self.tableView.tableFooterView = footerView;
    footerView.setFootHeight = ^(CGFloat footHeight){
        self.tableView.tableFooterView.height = footHeight;
        [self.tableView reloadData];
    };

}

- (void)coinButtonClick{

}

- (void)settingButtonClick{

}

- (void)moonButtonClick{

}
#pragma mark - tableView相关
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mineID];
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
        cell.textLabel.text = @"登录";
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"离线下载";
    }
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
