//
//  CollegeAdmissionPlanFirstCell.m
//  gaokaoquan
//
//  Created by admin on 2016/10/12.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeAdmissionPlanFirstCell.h"

@interface CollegeAdmissionPlanFirstCell ()

@property (weak, nonatomic) IBOutlet UIButton *beiJingBtn;
@property (weak, nonatomic) IBOutlet UIButton *liKeBtn;
@property (weak, nonatomic) IBOutlet UIButton *yearBtn;

@end

@implementation CollegeAdmissionPlanFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.liKeBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.liKeBtn.layer.borderWidth = 0.5;
    self.beiJingBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.beiJingBtn.layer.borderWidth = 0.5;
    self.yearBtn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.yearBtn.layer.borderWidth = 0.5;
    self.liKeBtn.layer.cornerRadius = 5;
    self.liKeBtn.layer.masksToBounds = YES;
    self.beiJingBtn.layer.cornerRadius = 5;
    self.beiJingBtn.layer.masksToBounds = YES;
    self.yearBtn.layer.cornerRadius = 5;
    self.yearBtn.layer.masksToBounds = YES;
    
    [self.beiJingBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, self.beiJingBtn.zj_width/2 - 10)];
    [self.beiJingBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.beiJingBtn.zj_width/2 + 20, 0, 0)];
    [self.liKeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, self.liKeBtn.zj_width/2 - 10)];
    [self.liKeBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.liKeBtn.zj_width/2 + 20, 0, 0)];
    [self.yearBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, self.yearBtn.zj_width/2 - 10)];
    [self.yearBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.yearBtn.zj_width/2 + 20, 0, 0)];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
