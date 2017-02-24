//
//  GaoSuRecommandViewController.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/21.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuRecommandViewController.h"
#import "AFNetworking.h"
#import "GaoSuRecommendCategoryCell.h"
#import "GaoSuRecommendUserCell.h"
#import "MJRefresh.h"
#import "GaoSuRecommendCatergory.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "GaoSuRecommandUser.h"
#define GaoSuSelectCategory  self.categories[self.categoryTableView.indexPathForSelectedRow.row]
@interface GaoSuRecommandViewController ()<UITableViewDelegate,UITableViewDataSource>
/**
 *  左边类别数据
 */
@property (nonatomic, strong) NSArray *categories;
/**
 *  请求参数
 */
@property (nonatomic, strong) NSMutableDictionary *params;

@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
@property (nonatomic,strong)AFHTTPSessionManager *manager;
@end

@implementation GaoSuRecommandViewController
static NSString * const categoryID = @"category";
static NSString * const userID = @"user";

- (void)viewDidLoad {
    [super viewDidLoad];

    //指示器
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    [self setupTableView];
    
    [self setupRefresh];
    
    [self loadCatetgoryData];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)loadCatetgoryData{

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        self.categories =
        self.categories = [GaoSuRecommendCatergory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        //刷新tableview
        [self.categoryTableView reloadData];
        //隐藏指示器
//        [SVProgressHUD dismiss];
        
        //默认选中第一行
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        //让用户列表进入刷新
        [self.userTableView.mj_header beginRefreshing];
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        NSLog(@"%@",error);
    }];
    
}

- (void)setupTableView{
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = GaoSuGlobalBg;
    
    //注册
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([GaoSuRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:categoryID];
    self.categoryTableView.delegate = self;
    self.categoryTableView.dataSource = self;
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([GaoSuRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:userID];
    self.userTableView.delegate = self;
    self.userTableView.dataSource = self;
    //设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.userTableView.contentInset = self.categoryTableView.contentInset;
    //
    self.categoryTableView.tableFooterView = [UIView new];
    self.userTableView.rowHeight = 70;
    self.userTableView.tableFooterView = [UIView new];
    //去掉分割线
    self.categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.userTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)setupRefresh{
//顶部
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    //底部
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];

}
//加载用户数据
- (void)loadNewUsers{
    GaoSuRecommendCatergory *category = GaoSuSelectCategory;
    //设置当前的页面为1
    category.currentPage = 1;
    //设置参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = [GaoSuSelectCategory ID];
    params[@"page"] = @(category.currentPage);
    self.params = params;
    //加载右侧的数据
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *userArr = [GaoSuRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
     //先删除老的数据
        [category.users removeAllObjects];
        [category.users addObjectsFromArray:userArr];
        //总数
        category.total = responseObject[@"total"];
        //不是最后一次请求
        if (self.params != params) {
            return ;
        }
        [self.userTableView reloadData];
        [self.userTableView.mj_header endRefreshing];
        //让底部也结束刷新
        [self checkFooterState];
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (self.params != params) {
            return ;
        }
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        [self.userTableView.mj_header endRefreshing];
    }];
    
}
#pragma mark - 加载更多用户数据
- (void)loadMoreUsers{
    GaoSuRecommendCatergory *category = GaoSuSelectCategory;
    //设置参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = category.ID;
    params[@"page"] = @(++category.currentPage);
    self.params = params;
    
    //加载右侧的数据
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *userArr = [GaoSuRecommandUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
       
        [category.users addObjectsFromArray:userArr];
        //总数
        category.total = responseObject[@"total"];
        //不是最后一次请求
        if (self.params != params) {
            return ;
        }
        [self.userTableView reloadData];
        [self.userTableView.mj_header endRefreshing];
        //让底部也结束刷新
        [self checkFooterState];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (self.params != params) {
            return ;
        }
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        [self.userTableView.mj_header endRefreshing];
    }];

    
}
- (void)checkFooterState{
    GaoSuRecommendCatergory *category = GaoSuSelectCategory;
    NSInteger count = category.users.count;
    self.userTableView.mj_footer.hidden = (count == 0);
    if (count == [category.total integerValue]) {
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.userTableView.mj_footer endRefreshing];
    }
}
#pragma mark - UITableViewDataSource and UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTableView) {
        return self.categories.count;
    }
    [self checkFooterState];

    return [GaoSuSelectCategory users].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categoryTableView) {
        GaoSuRecommendCategoryCell *catergoryCell = [tableView dequeueReusableCellWithIdentifier:categoryID forIndexPath:indexPath];
        catergoryCell.model = self.categories[indexPath.row];
        return catergoryCell;
    }else{
        GaoSuRecommendUserCell *userCell = [tableView dequeueReusableCellWithIdentifier:userID];
        userCell.model = [GaoSuSelectCategory users][indexPath.row];
        return userCell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.userTableView.mj_header endRefreshing];
    [self.userTableView.mj_footer endRefreshing];
    GaoSuRecommendCatergory *recommendCatergory = self.categories[indexPath.row];
    if (recommendCatergory.users.count) {
        [self.userTableView reloadData];
    }else{
        [self.userTableView reloadData];
        [self.userTableView.mj_header beginRefreshing];
    }
    
}
#pragma mark - 视图销毁

- (void)dealloc{
    //停止所有的网络请求
    [self.manager.operationQueue cancelAllOperations];
}

-(AFHTTPSessionManager *)manager{
    if (_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
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
