//
//  AdmissionsArticlesCell.h
//  gaokaoquan
//
//  Created by admin on 2016/10/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeneralModel.h"

@class AdmissionsArticlesCell;
@protocol AdmissionsArticlesCellDelegate <NSObject>

@required
- (void)admissionsArticlesBtnMethod:(AdmissionsArticlesCell *)cell;

@end

@interface AdmissionsArticlesCell : UITableViewCell

@property(nonatomic, strong) GeneralModel *model;
@property(nonatomic, assign) id<AdmissionsArticlesCellDelegate>delegate;
@property(nonatomic, assign) int isFlagAdmissionsShow;
@property (weak, nonatomic) IBOutlet UIButton *showMoreBtn;
@property (weak, nonatomic) IBOutlet UILabel *zhaoShengLabel;

@end
