//
//  YinxiangCell.m
//  gaokaoquan
//
//  Created by admin on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "YinxiangCell.h"
#import "UIImageView+WebCache.h"

@interface YinxiangCell ()

@end

@implementation YinxiangCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setDictModel:(NSDictionary *)dictModel {
    
    [_headImage sd_setImageWithURL:[NSURL URLWithString:dictModel[@"avatar"]] placeholderImage:[UIImage imageNamed:@"jr2"]];
    _true_name.text = dictModel[@"true_name"];
    _ctime.text = [NSString stringWithFormat:@"时间：%@", dictModel[@"ctime"]];
    _info.text = dictModel[@"info"];
    
    //字体颜色
    _true_name.textColor = [UIColor whiteColor];
    _ctime.textColor = [UIColor whiteColor];
    _info.textColor = [UIColor whiteColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
