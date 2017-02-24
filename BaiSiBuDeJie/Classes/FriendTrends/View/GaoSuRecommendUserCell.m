//
//  GaoSuRecommendUserCell.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/21.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuRecommendUserCell.h"
#import "GaoSuRecommandUser.h"
#import "UIImageView+YMExtension.h"
@interface GaoSuRecommendUserCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *fansCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation GaoSuRecommendUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(GaoSuRecommandUser *)model{
    _model = model;
    self.nameLabel.text = model.screen_name;
    if (model.fans_count < 10000) {
        self.fansCountLabel.text = [NSString stringWithFormat:@"%ld人关注",model.fans_count];
    }else{
        self.fansCountLabel.text = [NSString stringWithFormat:@"%.1f万人关注",model.fans_count / 10000.0];
    }
    [self.headerImageView setCircleHeader:model.header];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
