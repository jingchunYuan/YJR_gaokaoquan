//
//  JYKongFuTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYKongFuTableViewCell.h"
#import "JYKongFuModel.h"
@interface JYKongFuTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *pid;
@property (weak, nonatomic) IBOutlet UIButton *name;
@property (weak, nonatomic) IBOutlet UILabel *scroe;
@property (weak, nonatomic) IBOutlet UILabel *culture;
@property (weak, nonatomic) IBOutlet UILabel *study;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *province;
@end
@implementation JYKongFuTableViewCell


- (void)setModel:(JYKongFuModel *)model
{
    _model = model;
    self.pid.text = model.pid;
    [self.name setTitle:model.name forState:UIControlStateNormal];
    self.scroe.text = model.total_score;
    self.culture.text = model.culture;
    self.study.text = model.study;
    self.type.text = model.type;
    self.province.text = model.province;

}
- (IBAction)collegeClick:(UIButton *)sender
{
    NSLog(@"点击大学了");
}
@end
