//
//  AnswerDetalTopCell.m
//  gaokaoquan
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AnswerDetalTopCell.h"
#import "UIImageView+WebCache.h"

@implementation AnswerDetalTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.contentView layoutIfNeeded];
    // Initialization code
    //将头像设置成圆形
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius =_headImage.zj_width/2;
    _headImage.layer.borderWidth = 1;
    _headImage.layer.borderColor = [UIColor lightGrayColor].CGColor;

}

- (void)setDict:(NSDictionary *)dict {
    
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:dict[@"avatar"]]
                      placeholderImage:[UIImage imageNamed:@"63D1C32889672031033CB630952BC2BB.jpg"]];
    self.true_name.text = dict[@"true_name"];
    self.time.text = dict[@"ask_time"];
    self.title.text = dict[@"title"];
    self.info.text = dict[@"info"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
