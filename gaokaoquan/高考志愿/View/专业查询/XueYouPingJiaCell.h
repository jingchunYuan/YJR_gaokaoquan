//
//  XueYouPingJiaCell.h
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MajorDetalXueYouPingLunModel.h"

@interface XueYouPingJiaCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;
@property (weak, nonatomic) IBOutlet UILabel *zanCountLabel;
@property (nonatomic, strong) MajorDetalXueYouPingLunModel *model;

@end
