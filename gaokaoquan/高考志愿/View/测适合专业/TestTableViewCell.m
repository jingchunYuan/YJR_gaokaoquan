//
//  TestTableViewCell.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TestTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "TestTableCellModel.h"

@interface TestTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageName;


@property (weak, nonatomic) IBOutlet UILabel *detailLb;

@property (weak, nonatomic) IBOutlet UILabel *time;



@end


@implementation TestTableViewCell

-(void)setModel:(TestTableCellModel *)model
{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:nil];
    self.imageView.layer.cornerRadius = 30;
    self.imageView.layer.masksToBounds = YES;
    self.detailLb.text = model.content;
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
