//
//  DetalHeaderCell.m
//  gaokaoquan
//
//  Created by admin on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "DetalHeaderCell.h"

@implementation DetalHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.guanzhuBtn.layer.masksToBounds = YES;
    self.guanzhuBtn.layer.cornerRadius = 5.0;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setModel:(MajorDetalJieshaoModel *)model {
    _model = model;
    //赋值
    self.zhuanyedaimaLabel.text = model.code;
    self.xiuxuenianxianLabel.text = [NSString stringWithFormat:@"%@年", model.years];
    self.shouyuxueweiLabel.text = model.degree;
    self.xiangjinxueweiLabel.text = model.like_major;
    
    NSMutableString *jobListStr = [NSMutableString string];
    if ([model.joblist count]) {
        for (NSString *s in model.joblist) {
            [jobListStr appendString:[NSString stringWithFormat:@"%@ ",s]];
        }
    }
    if (jobListStr != nil) {
        self.duikouhzhiyeLabel.text = jobListStr;
    }else {
        self.duikouhzhiyeLabel.text = @"暂无信息";
    }
    
}

- (IBAction)btnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(btnClickAction:withBtnTag:)]) {
        [self.delegate btnClickAction:self withBtnTag:(int)sender.tag];
    }
    
}


@end
