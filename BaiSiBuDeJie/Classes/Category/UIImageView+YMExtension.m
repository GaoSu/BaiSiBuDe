//
//  UIImageView+YMExtension.m
//  Baisibudejie
//
//  Created by 杨蒙 on 16/5/7.
//  Copyright © 2016年 hrscy. All rights reserved.
//

#import "UIImageView+YMExtension.h"
#import "UIImageView+WebCache.h"
#import "UIImage+YJExtension.h"


@implementation UIImageView (YMExtension)

-(void)setCircleHeader:(NSString *)url {
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[[UIImage imageNamed:@"defaultUserIcon"] circleImage] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }]; 
}

@end
