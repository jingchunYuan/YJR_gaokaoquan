//
//  TiaozhuanView.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/12.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TiaozhuanView;

@protocol TiaozhuanViewDelegate <NSObject>

@required

-(void)TiaozhuanClickButtonAtIndex:(NSInteger)buttonIndex;


@end

@interface TiaozhuanView : UIView

@property (nonatomic,weak)__weak id<TiaozhuanViewDelegate>delegate;
//警告框标题
@property (nonatomic,copy) NSString * title;
//警告框内容
@property (nonatomic,copy) NSString *body;
//警告框显示
-(void)showAlert;

-(void)TiaozhuanViewTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate canButton:(NSString *)can otherButton:(NSString *)other;



@end
