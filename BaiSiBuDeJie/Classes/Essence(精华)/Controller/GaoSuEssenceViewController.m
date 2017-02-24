//
//  GaoSuEssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/10.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuEssenceViewController.h"

#import "GaoSuTopTableViewController.h"

@interface GaoSuEssenceViewController ()<UIScrollViewDelegate>
//指示器
@property (nonatomic,strong)UIView *indicatorView;
// 点前选中的按钮
@property (nonatomic,strong)UIButton *selectedBtn;
// 顶部的标签
@property (nonatomic,strong)UIView *titleView;
//scrollView
@property (nonatomic,strong)UIScrollView *contentView;

@end

@implementation GaoSuEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化自控制器
    [self setupChildViewController];
    //设置导航栏
    [self setupNav];
    //设置标签栏
    [self setupTitlesView];
       //底部的 scrollview
    [self setupContentView];
}

- (void)setupNav{
    self.view.backgroundColor = GaoSuGlobalBg;
    //中间
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagButtonClick)];

}

- (void)setupTitlesView{
//标签栏
    UIView *titlesView = [[UIView alloc]init];
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    titlesView.frame = CGRectMake(0, YMTitlesViewY, self.view.width, YMTitlesViewH);
    [self.view addSubview:titlesView];
    self.titleView = titlesView;
    //底部红色的指示器
    UIView *indicatorView = [[UIView alloc]init];
    indicatorView.backgroundColor = [UIColor redColor];
    indicatorView.height = 2;
    indicatorView.tag = -1;
    indicatorView.y = titlesView.height - indicatorView.height;
    self.indicatorView = indicatorView;
    //内部的子标签
    NSInteger count = self.childViewControllers.count;
    CGFloat width = titlesView.width / count;
    CGFloat height = titlesView.height;
    for (int i = 0; i < count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.height = height;
        btn.width = width;
        btn.x = i * width;
        btn.tag = i;
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:btn];
        //默认选中第一个
        if (i == 0) {
            btn.enabled = NO;
            self.selectedBtn = btn;
            [btn.titleLabel sizeToFit];
            self.indicatorView.width = btn.titleLabel.width;
            self.indicatorView.centerX = btn.centerX;
        }
        [titlesView addSubview:indicatorView];
    }

}

- (void)setupChildViewController{

    GaoSuTopTableViewController *allVC = [[GaoSuTopTableViewController alloc]init];
    allVC.title = @"全部";
    allVC.type = YMTopicTypeAll;
    [self addChildViewController:allVC];
    
    GaoSuTopTableViewController *videoVC = [[GaoSuTopTableViewController alloc]init];
    videoVC.title = @"搞笑视频";
    videoVC.type = YMTopicTypeVideo;
    [self addChildViewController:videoVC];
    
    GaoSuTopTableViewController *voiceVC = [[GaoSuTopTableViewController alloc]init];
    voiceVC.title = @"声音";
    voiceVC.type = YMTopicTypeVoice;
    [self addChildViewController:voiceVC];
    
    GaoSuTopTableViewController *pictureVC = [[GaoSuTopTableViewController alloc]init];
    pictureVC.title = @"图片";
    pictureVC.type = YMTopicTypePicture;
    [self addChildViewController:pictureVC];
    
    GaoSuTopTableViewController *wordVC = [[GaoSuTopTableViewController alloc]init];
    wordVC.title = @"段子";
    wordVC.type = YMTopicTypeWord;
    [self addChildViewController:wordVC];

}

- (void)setupContentView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc]init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    contentView.pagingEnabled = YES;
    [self.view insertSubview:contentView atIndex:0];
    self.contentView = contentView;
    //设置完contentView后的调用的方法,着这里默认设置第一个view
    [self scrollViewDidEndScrollingAnimation:contentView];

}

#pragma mark scrollViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    // 添加控制器的View
    //当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0;
    vc.view.height = scrollView.height;
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self titleClick:self.titleView.subviews[index]];
}
#pragma mark 标题的点击事件
- (void)titleClick:(UIButton *)sender{
    self.selectedBtn.enabled = YES;
    sender.enabled  = NO;
    self.selectedBtn = sender;
    //执行动画
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorView.width = self.selectedBtn.titleLabel.width;
        self.indicatorView.centerX = self.selectedBtn.centerX;
    }];
    //切换子控制器
    CGPoint offset = self.contentView.contentOffset;
    offset.x = sender.tag * self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}

#pragma mark 导航左边的点击事件

- (void)tagButtonClick{


}

#pragma mark - 异步下载图片
-(void)downloadImageWithUrl:(NSURL *)imageDownloadUrl imageView:(UIImageView *)imageView placeholderImage:(NSString *)placeholderImage{
    //以便在block中使用
    __block UIImage *image = [[UIImage alloc] init];
    
    
    //将图片下载在异步线程进行
    //创建异步线程执行队列
    dispatch_queue_t asynchronousQueue = dispatch_queue_create("imageDownloadQueue", NULL);
    //创建异步线程
    dispatch_async(asynchronousQueue, ^{
        //网络下载图片  NSData格式
        NSError *error;
        NSData *imageData = [NSData dataWithContentsOfURL:imageDownloadUrl options:NSDataReadingMappedIfSafe error:&error];
        if (imageData) {
            image = [UIImage imageWithData:imageData];
        }
        //回到主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (image) {
                [imageView setImage:image];
            }else{
                if (placeholderImage) {
                    [imageView setImage:[UIImage imageNamed:placeholderImage]];
                }
            }
            
        });
    });
}



@end
