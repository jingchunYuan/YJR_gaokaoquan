//
//  AnswerDetalUnderCell.m
//  gaokaoquan
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AnswerDetalUnderCell.h"
#import "AnswerDetalModel.h"
#import "UIImageView+WebCache.h"

@implementation AnswerDetalUnderCell

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

- (void)setModel:(AnswerDetalModel *)model {
    
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.avatar]
                      placeholderImage:[UIImage imageNamed:@"63D1C32889672031033CB630952BC2BB.jpg"]];
    
    self.name.text = model.true_name;
    self.time.text = model.comment_time;
    self.info.text = model.info;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
