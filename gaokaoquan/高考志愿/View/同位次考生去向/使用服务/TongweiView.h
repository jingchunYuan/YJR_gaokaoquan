//
//  TongweiView.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/19.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CheckBtnClickDelegate <NSObject>

-(void)Cityfiled:(UITextField  *)Cityfiled :(UITextField *)WeiciFiled :(BOOL)isWL;

@end

@interface TongweiView : UIView

@property (nonatomic,weak) id<CheckBtnClickDelegate> delegate;

+ (instancetype)loadNibView;

@end
