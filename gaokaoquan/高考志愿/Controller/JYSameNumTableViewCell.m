//
//  JYSameNumTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYSameNumTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "JYSameTableviewCellModel.h"
@interface JYSameNumTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UILabel *time;

@end

@implementation JYSameNumTableViewCell

- (void)setModel:(JYSameTableviewCellModel *)model
{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:nil];
    self.imageView.layer.cornerRadius = 20;
    self.imageView.layer.masksToBounds = YES;
    self.detailLabel.text = model.content;
    self.time.text = model.ctime;

}

@end
