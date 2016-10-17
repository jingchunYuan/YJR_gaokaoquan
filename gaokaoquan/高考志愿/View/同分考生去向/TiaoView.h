//
//  TiaoView.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TiaoView;

@protocol TiaoViewDelegate <NSObject>

@required

-(void)TiaoClickButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface TiaoView : UIView

@property (nonatomic,weak)__weak id<TiaoViewDelegate>delegate;
//警告框标题
@property (nonatomic,copy) NSString * title;
//警告框内容
@property (nonatomic,copy) NSString *body;
//警告框显示
-(void)showAlert;

-(void)TiaoViewTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate canButton:(NSString *)can otherButton:(NSString *)other;

@end
