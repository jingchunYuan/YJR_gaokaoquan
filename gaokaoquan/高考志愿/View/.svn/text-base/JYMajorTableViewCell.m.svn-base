//
//  JYMajorTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/23.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMajorTableViewCell.h"
#import "JYMajorModel.h"
#import "JYJobModel.h"
@interface JYMajorTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *Detaillabel;
@property (weak, nonatomic) IBOutlet UIButton *name;
@end
@implementation JYMajorTableViewCell

- (IBAction)Btnclick:(UIButton *)sender
{
    
    
}

- (void)setModel:(JYMajorModel *)model
{
    _model = model;
    [self.name setTitle:model.name forState:UIControlStateNormal];
    self.Detaillabel.text = model.content;

}

- (void)setModel1:(JYJobModel *)model1
{
    _model1 = model1;
    [self.name setTitle:model1.name forState:UIControlStateNormal];
    self.Detaillabel.text = model1.content;

}
@end
