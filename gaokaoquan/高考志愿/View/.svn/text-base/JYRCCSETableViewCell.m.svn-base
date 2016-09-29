//
//  JYRCCSETableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYRCCSETableViewCell.h"
#import "JYRCCSEModel.h"
@interface JYRCCSETableViewCell()
/// 序号
@property (weak, nonatomic) IBOutlet UILabel *pid;
/// 学校名称
@property (weak, nonatomic) IBOutlet UIButton *name;
/// 分数
@property (weak, nonatomic) IBOutlet UILabel *scroce;
/// 地区排名
@property (weak, nonatomic) IBOutlet UILabel *city;
/// 类型排名
@property (weak, nonatomic) IBOutlet UILabel *type;

@end
@implementation JYRCCSETableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(JYRCCSEModel *)model
{
    _model = model;
    self.pid.text = model.pid;
    [self.name setTitle:model.name forState:UIControlStateNormal];
    self.scroce.text = model.total_score;
    self.city.text = [NSString stringWithFormat:@"%@  %@",model.city,model.city_id];
    self.type.text = [NSString stringWithFormat:@"%@  %@",model.type,model.type_id];
}


- (IBAction)nameClick:(UIButton *)sender
{
    
    NSLog(@"大学点击了");
    
}

@end
