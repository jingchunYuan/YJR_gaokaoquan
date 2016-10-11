//
//  DetalHeaderCell.h
//  gaokaoquan
//
//  Created by admin on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MajorDetalJieshaoModel.h"

@class DetalHeaderCell;
@protocol DetalHeaderCellDelegate <NSObject>

@required
- (void)btnClickAction:(DetalHeaderCell *)detalHeaderCell withBtnTag:(int)tag;

@end

@interface DetalHeaderCell : UITableViewCell

@property (weak, nonatomic) id<DetalHeaderCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIView *bgView1;
@property (weak, nonatomic) IBOutlet UIView *bgView2;
@property (weak, nonatomic) IBOutlet UIButton *guanzhuBtn;
@property (nonatomic, strong) MajorDetalJieshaoModel *model;
@property (weak, nonatomic) IBOutlet UILabel *zhuanyedaimaLabel;
@property (weak, nonatomic) IBOutlet UILabel *xiuxuenianxianLabel;
@property (weak, nonatomic) IBOutlet UILabel *shouyuxueweiLabel;
@property (weak, nonatomic) IBOutlet UILabel *xiangjinxueweiLabel;
@property (weak, nonatomic) IBOutlet UILabel *duikouhzhiyeLabel;
@property (weak, nonatomic) IBOutlet UIView *lineView1;
@property (weak, nonatomic) IBOutlet UIView *lineView2;
@property (weak, nonatomic) IBOutlet UIView *lineView3;
@property (weak, nonatomic) IBOutlet UIView *lineView4;

@end
