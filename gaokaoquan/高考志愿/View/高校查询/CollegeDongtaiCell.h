//
//  CollegeDongtaiCell.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollegeDongtaiCell;
@protocol CollegeDongtaiCellDelegate <NSObject>

@required
- (void)buttonClickAction:(CollegeDongtaiCell *)cell btnTag:(int)tag;

@end

@interface CollegeDongtaiCell : UITableViewCell

@property(nonatomic, weak) id<CollegeDongtaiCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIView *luQulineView;
@property (weak, nonatomic) IBOutlet UIView *gaiKuolineView;
@property (weak, nonatomic) IBOutlet UIView *xiaoYoulineView;
@property (weak, nonatomic) IBOutlet UIView *xiaoYuanlineView;

@end
