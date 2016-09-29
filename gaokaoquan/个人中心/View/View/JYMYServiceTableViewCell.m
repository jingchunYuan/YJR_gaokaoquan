//
//  JYMYServiceTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMYServiceTableViewCell.h"
@interface JYMYServiceTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIButton *UseBtn;

@end
@implementation JYMYServiceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(JYMyServiceModel *)model
{
    _model = model;
    
    
    self.titleLabel.text = model.title;
    
    self.numLabel.text = [NSString stringWithFormat:@"%d次",model.times];
    
    
    

}
- (IBAction)UserBtnClick:(UIButton *)sender {
    
    
    
    
}
@end
