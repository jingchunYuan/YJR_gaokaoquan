//
//  JYSchoolFriendTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYSchoolFriendTableViewCell.h"
#import "JYSchoolFriendModel.h"
@interface JYSchoolFriendTableViewCell()

@property (weak, nonatomic) IBOutlet UIButton *name;

@property (weak, nonatomic) IBOutlet UILabel *pid;

@property (weak, nonatomic) IBOutlet UILabel *score;

@property (weak, nonatomic) IBOutlet UILabel *city;

@property (weak, nonatomic) IBOutlet UILabel *type;

@end
@implementation JYSchoolFriendTableViewCell

- (void)setModel:(JYSchoolFriendModel *)model
{
    _model = model;
    [self.name setTitle:model.name forState:UIControlStateNormal];
    self.pid.text = model.pid;
    self.score.text = model.total_score;
    self.city.text = model.city;
    self.type.text = model.type;
    
}
- (IBAction)nameClick:(UIButton *)sender
{
    NSLog(@"大学点击了");
}

@end
