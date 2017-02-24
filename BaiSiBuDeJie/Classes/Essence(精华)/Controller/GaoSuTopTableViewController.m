//
//  GaoSuTopTableViewController.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuTopTableViewController.h"
#import "GaoSuTopicCell.h"
#import "MJRefresh.h"
#import "GaoSuTopicManager.h"
#import "NSDictionary+Propery.h"
#import "AFNetworking.h"
#import "URLConfig.h"
#import "GaoSuTopic.h"
#import "MJExtension.h"
#import "UIView+YMExtension.h"
@interface GaoSuTopTableViewController ()

@property (nonatomic,strong)NSDictionary *params;//上次请求的参数

@property (nonatomic,strong)NSString *maxTime;//下次请求需要的

@property (nonatomic,strong)NSMutableArray *topics;
//上次点击tarbar的索引
@property (nonatomic,assign)NSInteger lastSelectedIndex;
@end

@implementation GaoSuTopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化表格
    [self setupTableView];
    //添加刷新控件
    [self setupRefresh];
}

static NSString *const GaoSuTopicCellID = @"topic";
- (void)setupTableView{
//设置缩进
    CGFloat bottom = self.tabBarController.tabBar.height;
    CGFloat top = YMTitlesViewH + YMTitlesViewY;
    self.tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0);
  //设置滚动的内边距
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GaoSuTopicCell class]) bundle:nil] forCellReuseIdentifier:GaoSuTopicCellID];
    //监听tabbar的点击通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarSelected) name:YMTabBarDidSelectedNotification object:nil];
    
}

- (void)setupRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

- (void)tabBarSelected{
    if (self.lastSelectedIndex != self.tabBarController.selectedIndex && [self.view isShowingOnKeyWindow]) {
        [self.tableView.mj_header beginRefreshing];
    }
    
    self.lastSelectedIndex = self.tabBarController.selectedIndex;
}
#pragma mark 加载数据
- (void)loadNewTopics{
    //结束下拉
    [self.tableView.mj_header endRefreshing];
    //请求数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @(self.type);
    self.params = params;
    
    //这里如果是自己做的用封装的请求
    
  
    [[GaoSuTopicManager shareInstanced] getTopicWithPrarms:params :^(Response *response) {
        
    }];
    
    [[AFHTTPSessionManager manager] GET:TOPIC parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (self.params != params) {
            return ;
        }
        self.maxTime  = responseObject[@"info"][@"maxtime"];
//        NSDictionary *dict = responseObject[@"list"][0];
//        [dict createPropery];
        NSArray *newTopics = [GaoSuTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:newTopics];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.tableView.mj_footer endRefreshing];
    }];
    
    
    
}
- (void)loadMoreTopics{

}
#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    GaoSuTopic *topic = self.topics[indexPath.row];
//    NSLog(@"%f",topic.cellHeight);
    return topic.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    self.tableView.mj_footer.hidden = (self.topics.count == 0);
    return self.topics.count;
}

-(NSMutableArray *)topics{
    if (_topics == nil) {
        _topics = [NSMutableArray array];
    }
    return _topics;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GaoSuTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:GaoSuTopicCellID    forIndexPath:indexPath];
    cell.topic = self.topics[indexPath.row];
      return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
