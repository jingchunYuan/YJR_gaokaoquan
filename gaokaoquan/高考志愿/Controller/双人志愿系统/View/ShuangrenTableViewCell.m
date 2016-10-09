

//
//  ShuangrenTableViewCell.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ShuangrenTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ShuangrenTableViewCellModel.h"

@interface ShuangrenTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iamgeView;


@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end

@implementation ShuangrenTableViewCell


-(void)setModel:(ShuangrenTableViewCellModel *)model{
    
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:nil];
    self.imageView.layer.cornerRadius = 30;
    self.imageView.layer.masksToBounds = YES;
    self.detailLabel.text = model.content;
    self.time.text = model.ctime;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
