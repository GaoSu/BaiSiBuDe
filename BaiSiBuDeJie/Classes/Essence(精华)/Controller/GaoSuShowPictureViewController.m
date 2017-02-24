//
//  GaoSuShowPictureViewController.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/27.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuShowPictureViewController.h"
#import "GaoSuTopic.h"
#import "UIImageView+WebCache.h"
@interface GaoSuShowPictureViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation GaoSuShowPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// 添加图片
    [self addImageView];
    // Do any additional setup after loading the view from its nib.
}

- (void)addImageView{

    UIImageView *imageView = [[UIImageView alloc]init];
    self.imageView = imageView;
    [self.scrollView addSubview:imageView];
    //图片的尺寸
    CGFloat pictureW = SCREENW;
    CGFloat pictureH = SCREENW * self.topic.height / self.topic.width;
    
    if (pictureH > SCREENH) {
        self.imageView.frame = CGRectMake(0, 0, pictureW, pictureH);
        self.scrollView.contentSize = CGSizeMake(pictureW, pictureH);
    }else{
        self.imageView.size = CGSizeMake(pictureW, pictureH);
        self.imageView.centerY = SCREENH * 0.5;
    }
    //下载图片
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.topic.large_image]];
    
}
//返回
- (IBAction)backAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//保存

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
