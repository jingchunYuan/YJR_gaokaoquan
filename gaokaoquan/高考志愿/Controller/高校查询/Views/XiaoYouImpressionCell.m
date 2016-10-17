//
//  XiaoYouImpressionCell.m
//  gaokaoquan
//
//  Created by admin on 2016/10/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "XiaoYouImpressionCell.h"
#import "UIImageView+WebCache.h"

@interface XiaoYouImpressionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UILabel *ctime;
@property (weak, nonatomic) IBOutlet UIButton *up_total;

@end

@implementation XiaoYouImpressionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(XiaoYouImpressionModel *)model {
    
    _model = model;
    //赋值
    if ([model.avatar length] > 0) {
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    }
    self.info.text = model.info;
    self.ctime.text = model.ctime;
    [self.up_total setTitle:model.up_total forState:UIControlStateNormal];
    
}

@end
