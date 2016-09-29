//
//  JYProviceScoreView.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CheckClickDelegate<NSObject>

@optional
- (void)ckeckClicK:(UITextField *)cityfiled PICIFiled:(UITextField *)PICiFiled ISwl:(BOOL)ISwl;


@end

@interface JYProviceScoreView : UIView

@property (nonatomic,weak) id<CheckClickDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIView *headView;

+ (instancetype)loadNibView;

@end
