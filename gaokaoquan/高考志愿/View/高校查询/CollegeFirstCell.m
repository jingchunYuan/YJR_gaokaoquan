//
//  CollegeFirstCell.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeFirstCell.h"

@interface CollegeFirstCell ()

@property (weak, nonatomic) IBOutlet UIButton *liKeBtn;
@property (weak, nonatomic) IBOutlet UIButton *beiJingBtn;

@end

@implementation CollegeFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.liKeBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.liKeBtn.layer.borderWidth = 0.5;
    self.beiJingBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.beiJingBtn.layer.borderWidth = 0.5;
    self.liKeBtn.layer.cornerRadius = 5;
    self.liKeBtn.layer.masksToBounds = YES;
    self.beiJingBtn.layer.cornerRadius = 5;
    self.beiJingBtn.layer.masksToBounds = YES;
    
    [self.liKeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, self.liKeBtn.zj_width/2 - 10)];
    [self.beiJingBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, self.beiJingBtn.zj_width/2 - 10)];
    [self.liKeBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.liKeBtn.zj_width/2 + 10, 0, 0)];
    [self.beiJingBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.beiJingBtn.zj_width/2 + 10, 0, 0)];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
