//
//  DongTaiCell.m
//  gaokaoquan
//
//  Created by admin on 16/9/6.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "DongTaiCell.h"

@interface DongTaiCell ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *contextLabel;

@end

@implementation DongTaiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _bgView.backgroundColor = [UIColor clearColor];
    _contextLabel.textColor = [UIColor whiteColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDictModel:(NSDictionary *)dictModel {
    _dictModel = dictModel;
    //赋值
    NSString *s = [NSString stringWithFormat:@"%@：%@",dictModel[@"type"], dictModel[@"title"]];
    _contextLabel.text = s;
}

@end
