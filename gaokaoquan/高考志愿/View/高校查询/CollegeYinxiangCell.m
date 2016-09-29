
//
//  CollegeYinxiangCell.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeYinxiangCell.h"

@implementation CollegeYinxiangCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setDictModel:(NSDictionary *)dictModel
{
    self.infoLb.text = dictModel[@"info"];
    self.ctimeLb.text = dictModel[@"ctime"];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)totalBtn:(id)sender {
}
@end
