//
//  JYGaoXiaoTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYGaoXiaoTableViewCell.h"
#import "JYGaoXiaoModel.h"
@interface JYGaoXiaoTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *Year;
@property (weak, nonatomic) IBOutlet UIButton *SchoolBtn;
@property (weak, nonatomic) IBOutlet UILabel *MinScore;
@property (weak, nonatomic) IBOutlet UILabel *MaxScore;
@property (weak, nonatomic) IBOutlet UILabel *ProviceScore;

@end
@implementation JYGaoXiaoTableViewCell

- (IBAction)SchoolBtnClick:(UIButton *)sender
{
    
    
}

- (void)setModel:(JYGaoXiaoModel *)model
{
    _model = model;
    self.Year.text = model.year;
    [self.SchoolBtn setTitle:model.college_name forState:UIControlStateNormal];
    self.MaxScore.text = model.max_score;
    self.MinScore.text = model.min_score;
    self.ProviceScore.text = model.control_line;

}
@end
