//
//  ZhuanYeJieshaoCell.h
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MajorDetalJieshaoModel.h"

@interface ZhuanYeJieshaoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *jieShaoLabel;
@property (nonatomic, strong) MajorDetalJieshaoModel *model;

@end
