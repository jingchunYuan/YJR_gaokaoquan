//
//  HotTeacherView.h
//  gaokaoquan
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FengyunViewController.h"
@class HotTeacherView;
@protocol HotTeacherViewDelegate <NSObject>

- (void)moreBtnMethod:(HotTeacherView *)hotTeacherView;
- (void)fengyunMethod:(HotTeacherView *)fengyunView;
- (void)pushController:(FengyunViewController *)FYVC;
@end


@interface HotTeacherView : UIView

@property (weak, nonatomic) id <HotTeacherViewDelegate> delegate;

@end
