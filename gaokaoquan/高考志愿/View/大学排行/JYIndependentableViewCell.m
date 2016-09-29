//
//  JYIndependentableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYIndependentableViewCell.h"
#import "JYIndependentSchoolModel.h"
@interface JYIndependentableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *pid;
@property (weak, nonatomic) IBOutlet UIButton *name;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *score;
@end
@implementation JYIndependentableViewCell


- (IBAction)nameClick:(UIButton *)sender
{
    
}

- (void)setModel:(JYIndependentSchoolModel *)model
{
    _model = model;
    self.pid.text = model.pid;
    [self.name setTitle:model.name forState:UIControlStateNormal];
    self.score.text = model.total_score;
    self.city.text = [NSString stringWithFormat:@"%@  %@",model.city,model.city_id];
    
}

@end
