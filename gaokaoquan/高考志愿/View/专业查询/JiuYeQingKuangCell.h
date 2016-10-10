//
//  JiuYeQingKuangCell.h
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MajorDetalJiuYeQingKuangModel.h"

@interface JiuYeQingKuangCell : UITableViewCell

@property (nonatomic, strong) MajorDetalJiuYeQingKuangModel *model;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *jiuYeLabel;

@end
