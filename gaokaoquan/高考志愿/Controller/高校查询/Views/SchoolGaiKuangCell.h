//
//  SchoolGaiKuangCell.h
//  gaokaoquan
//
//  Created by admin on 2016/10/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeneralModel.h"

@class SchoolGaiKuangCell;
@protocol SchoolGaiKuangCellDelegate <NSObject>

@required
- (void)schoolGaiKuangBtnMethod:(SchoolGaiKuangCell *)cell;

@end


@interface SchoolGaiKuangCell : UITableViewCell

@property (nonatomic, strong) GeneralModel *model;
@property (nonatomic, assign) id<SchoolGaiKuangCellDelegate>delegate;
@property (nonatomic, assign) int isFlagShoolShow;
@property (weak, nonatomic) IBOutlet UIButton *showMoreBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
