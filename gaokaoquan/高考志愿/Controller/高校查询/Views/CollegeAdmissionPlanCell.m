//
//  CollegeAdmissionPlanCell.m
//  gaokaoquan
//
//  Created by admin on 2016/10/12.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeAdmissionPlanCell.h"

@interface CollegeAdmissionPlanCell ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel1;
@property (weak, nonatomic) IBOutlet UILabel *myLabel2;
@property (weak, nonatomic) IBOutlet UILabel *myLabel3;
@property (weak, nonatomic) IBOutlet UILabel *myLabel4;
@property (weak, nonatomic) IBOutlet UILabel *myLabel5;

@end

@implementation CollegeAdmissionPlanCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(CollegeModel *)model {
    _model = model;
    
    self.myLabel1.text = model.major_name;
    self.myLabel2.text = model.plan_type;
    self.myLabel3.text = model.length;
    self.myLabel4.text = model.category;
    self.myLabel5.text = model.plan_number;
    
}

@end
