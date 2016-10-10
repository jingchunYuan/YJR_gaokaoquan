//
//  XueYouPingJiaCell.m
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "XueYouPingJiaCell.h"
#import "UIImageView+WebCache.h"

@implementation XueYouPingJiaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _headImageView.layer.cornerRadius = _headImageView.zj_width/2;
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.borderWidth = 0.3;
    _headImageView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _titleLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MajorDetalXueYouPingLunModel *)model {
    _model = model;
    
    //赋值
    if ([model.avatar length] > 0) {
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar] placeholderImage:[UIImage imageNamed:@"高考侠2戴眼镜默认头像.jpg"]];
    }else {
        self.headImageView.image = [UIImage imageNamed:@"高考侠2戴眼镜默认头像.jpg"];
    }
    
    NSString *myInfoStr = model.info;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    CGRect rect = [myInfoStr boundingRectWithSize:CGSizeMake(200, 60)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:attributes
                                          context:nil];
    self.titleLabel.frame = CGRectMake(100, 5, 200, rect.size.height+20);
    self.titleLabel.text = myInfoStr;
    self.dataTimeLabel.text = model.ctime;
    self.zanCountLabel.text = model.up_total;
    
}

@end
