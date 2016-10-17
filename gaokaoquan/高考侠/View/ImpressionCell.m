//
//  ImpressionCell.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ImpressionCell.h"
#import "UIImageView+WebCache.h"
@interface ImpressionCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *dateLb;
@property (weak, nonatomic) IBOutlet UILabel *desLb;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameConstant;

@end
@implementation ImpressionCell

-(void)setModel:(ImpressionModel *)model{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
     NSDate * date = [NSDate dateWithTimeIntervalSince1970:[model.ctime doubleValue]];
    NSString * dateStr = [formatter stringFromDate:date];
    [_headImg sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    _nameLb.text = model.true_name;

    _dateLb.text = [NSString stringWithFormat:@"%@",dateStr];
    _desLb.text = model.info;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
