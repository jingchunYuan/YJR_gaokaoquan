//
//  OccupationCell.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobListModel.h"

@interface OccupationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *textLB;
@property (weak, nonatomic) IBOutlet UIImageView *btnImageView;

- (void)setupWithTitle:(NSString *)title detailText:(NSString *)detailText level:(NSInteger)level additionButtonHidden:(BOOL)additionButtonHidden;

@end
