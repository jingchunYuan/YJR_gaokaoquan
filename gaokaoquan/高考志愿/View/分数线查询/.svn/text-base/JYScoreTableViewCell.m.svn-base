//
//  JYScoreTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYScoreTableViewCell.h"
#import "JYScoreModel.h"
@interface JYScoreTableViewCell()

@property (weak, nonatomic) IBOutlet UIButton *SchoolBtn;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *Year;

@property (weak, nonatomic) IBOutlet UILabel *score;

@property (weak, nonatomic) IBOutlet UILabel *weici;

@property (weak, nonatomic) IBOutlet UILabel *num;

@end

@implementation JYScoreTableViewCell
- (IBAction)SchoolBtnClick:(UIButton *)sender
{
}

- (void)setModel:(JYScoreModel *)model
{
    _model = model;
    [self.SchoolBtn setTitle:model.college_name forState:UIControlStateNormal];
    self.name.text = model.major_name;
    self.Year.text = model.year;
    self.Year.text = model.year;
    self.score.text = model.score;
    self.weici.text = model.rank;
    self.num.text = model.number;

}


@end
