//
//  DetalHeaderCell.m
//  gaokaoquan
//
//  Created by admin on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "DetalHeaderCell.h"

@implementation DetalHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.guanzhuBtn.layer.masksToBounds = YES;
    self.guanzhuBtn.layer.cornerRadius = 5.0;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
