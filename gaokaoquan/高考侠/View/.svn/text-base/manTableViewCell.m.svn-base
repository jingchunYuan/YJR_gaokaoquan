//
//  manTableViewCell.m
//  gaokaoquan
//
//  Created by Nevis on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "manTableViewCell.h"
#import "ManModel.h"
#import "UIImageView+WebCache.h"

@interface manTableViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *eduLbHeight;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end


@implementation manTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.contentView layoutIfNeeded];
    _headIcon.layer.masksToBounds = YES;
    _headIcon.layer.cornerRadius = _headIcon.zj_width/2;
    _backView.layer.masksToBounds = YES;
    _backView.layer.cornerRadius = 5;
}

-(void)setModel:(ManModel *)model
{
   // [self.headIcon sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    //[self.heartLb sd_setImageWithURL:[NSURL URLWithString:_model.]];
    [self.headIcon sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.nameLb.text = model.true_name;
    self.starLb.text = model.astro;
    self.supportLb.text = model.praise_total;
    self.desLb.text = model.signature;
    self.collegeLb.text = model.college_name;
    self.eduLb.text = [NSString stringWithFormat:@"%@ | %@",model.college_name,model.major_name];
    CGSize size = [_eduLb sizeThatFits:CGSizeMake(_eduLb.frame.size.width, MAXFLOAT)];
    _eduLbHeight.constant = size.height;
    NSMutableString * course = [[NSMutableString alloc]init];
    for (int i=0; i<model.good_course.count; i++) {
        [course appendString:[NSString stringWithFormat:@"%@ ",model.good_course[i]]];
    }
    self.planTxt.text = course;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
