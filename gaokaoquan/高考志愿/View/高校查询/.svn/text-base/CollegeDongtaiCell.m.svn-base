
//
//  CollegeDongtaiCell.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeDongtaiCell.h"

@implementation CollegeDongtaiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnClick:(id)sender {
    NSLog(@"tag = %ld", (long)[((UIButton *)sender) tag]);
    
    int tag = (int)[((UIButton *)sender) tag];
    if ([self.delegate respondsToSelector:@selector(buttonClickAction:btnTag:)]) {
        [self.delegate buttonClickAction:self btnTag:tag];
    }
    
}


@end
