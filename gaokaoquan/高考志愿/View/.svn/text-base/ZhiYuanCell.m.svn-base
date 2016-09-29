//
//  ZhiYuanCell.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ZhiYuanCell.h"
#import "UIImageView+WebCache.h"
@implementation ZhiYuanCell

- (void)awakeFromNib {
    // Initialization code
    _serviceIcon.layer.masksToBounds = YES;
    _serviceIcon.layer.cornerRadius = _serviceIcon.width/2;
    _serviceName.textColor = UIColorRGBA(64, 64, 64, 1);
}
-(void)setModel:(WishBtnModel *)model{
    
    [_serviceIcon sd_setImageWithURL:[NSURL URLWithString:model.img]];
    _serviceName.text = model.title;
    CGSize size = [_serviceName sizeThatFits:CGSizeMake(_serviceName.width, SCREEN_HEIGHT)];
    _serviceName.height = size.height;
    
}
@end
