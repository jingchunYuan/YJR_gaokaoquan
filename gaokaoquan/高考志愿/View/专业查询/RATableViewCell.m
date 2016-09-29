//
//  RATableViewCell.m
//  gaokaoquan
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "RATableViewCell.h"

@implementation RATableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupWithTitle:(NSString *)title detailText:(NSString *)detailText level:(NSInteger)level additionButtonHidden:(BOOL)additionButtonHidden {
    
    //赋值
    self.myTitleLabel.text = title;
    
    //隐藏图片
    if (level == 2) {
        self.myImageView.hidden = YES;
    }else {
        self.myImageView.hidden = NO;
    }
    
    //顶头设置
    CGFloat left1 = 10 + 10 * level;
    CGFloat left = 45 + 10 * level;
    if (level >= 1) {
        left1 = 20 + 10 *level;
        left = 55 + 10 * level;
    }
    CGRect imageFrame = self.myImageView.frame;
    CGRect titleFrame = self.myTitleLabel.frame;
    imageFrame.origin.x = left1;
    titleFrame.origin.x = left;
    self.myImageView.frame = imageFrame;
    self.myTitleLabel.frame = titleFrame;
    
}


@end
