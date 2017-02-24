//
//  GaoSuRecommendCategoryCell.m
//  BaiSiBuDeJie
//
//  Created by 刘 on 16/12/21.
//  Copyright © 2016年 LiuH. All rights reserved.
//

#import "GaoSuRecommendCategoryCell.h"
#import "GaoSuRecommendCatergory.h"
@interface GaoSuRecommendCategoryCell ()
@property (weak, nonatomic) IBOutlet UIView *categoryIndictor;

@end

@implementation GaoSuRecommendCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = GaoSColor(244, 244, 244);
    self.categoryIndictor.backgroundColor = GaoSColor(219, 21, 26);
    // Initialization code
}
-(void)setModel:(GaoSuRecommendCatergory *)model{
    _model = model;
    self.textLabel.text = model.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.categoryIndictor.hidden = !selected;
    self.textLabel.textColor = selected ? self.categoryIndictor.backgroundColor : GaoSColor(78, 78, 78);
    
    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //从新调整内部的textLabel
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2 * self.textLabel.y;
}
@end
