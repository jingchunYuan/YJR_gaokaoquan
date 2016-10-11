//
//  KaiSheGaoXiaoCell.h
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MajorDetalKaisheGaoXiaoModel.h"

@class KaiSheGaoXiaoCell;
@protocol KaiSheGaoXiaoCellDelegate <NSObject>
@required
- (void)guanzhuBtnClick:(KaiSheGaoXiaoCell *)kaiSheGaoXiaoCell;
@end


@interface KaiSheGaoXiaoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *schoolName;
@property (weak, nonatomic) IBOutlet UILabel *schoolAddress;
@property (nonatomic,strong) MajorDetalKaisheGaoXiaoModel *model;
@property (nonatomic, assign) id<KaiSheGaoXiaoCellDelegate>delegate;

@end
