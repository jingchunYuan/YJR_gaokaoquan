//
//  JYJuniorCollegeTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYJuniorCollegeTableViewCell.h"
#import "JYJuniorCollegeModel.h"
@interface JYJuniorCollegeTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *pid;
@property (weak, nonatomic) IBOutlet UIButton *name;
@property (weak, nonatomic) IBOutlet UILabel *city;
@end
@implementation JYJuniorCollegeTableViewCell


- (void)setModel:(JYJuniorCollegeModel *)model
{
    _model = model;
    self.pid.text = model.pid;
    [self.name setTitle:model.name forState:UIControlStateNormal];
    self.city.text = [NSString stringWithFormat:@"%@  %@",model.city,model.city_id];

}
- (IBAction)nameCLick:(UIButton *)sender
{
    
}

@end
