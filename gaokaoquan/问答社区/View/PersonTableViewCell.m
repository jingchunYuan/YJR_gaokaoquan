//
//  PersonTableViewCell.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/8/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "PersonTableViewCell.h"
#import "PersonModel.h"
#import "UIImageView+WebCache.h"

@implementation PersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //将头像设置成圆形
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius =_headImage.zj_width/2;
    _headImage.layer.borderWidth = 1;
    _headImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

-(void)setModel:(PersonModel *)model
{
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.avatar]
                      placeholderImage:[UIImage imageNamed:@"63D1C32889672031033CB630952BC2BB.jpg"]];
    self.name.text = model.true_name;
    self.time.text = model.ask_time;
    self.titleLb.text = model.title;
    self.commentLb.text = model.comment_total;
    self.followLb.text = model.follow_total;
    self.uidLb.text = model.uid;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
