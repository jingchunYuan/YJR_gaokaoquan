//
//  OccupationCell.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "OccupationCell.h"

@implementation OccupationCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupWithTitle:(NSString *)title detailText:(NSString *)detailText level:(NSInteger)level additionButtonHidden:(BOOL)additionButtonHidden {
    
    //赋值
    self.textLB.text = title;
    
    //隐藏图片
    if (level == 1) {
        self.btnImageView.hidden = YES;
    }else {
        self.btnImageView.hidden = NO;
    }
    
    //顶头设置
    CGFloat left = 20 + 10 * level;
    if (level >= 1) {
        left = 30 + 10 * level;
    }
    CGRect titleFrame = self.textLB.frame;
    titleFrame.origin.x = left;
    self.textLB.frame = titleFrame;
    
}

@end
