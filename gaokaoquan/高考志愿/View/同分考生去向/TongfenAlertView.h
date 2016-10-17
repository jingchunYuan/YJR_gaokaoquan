//
//  TongfenAlertView.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TongfenAlertDelegate <NSObject>

-(void)pushController:(NSInteger)type;

@end

@interface TongfenAlertView : UIView

@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * message;
@property (nonatomic,copy)NSString * nextTitle;
@property (nonatomic,copy)NSString * cancelTitle;

@property (nonatomic,assign)id<TongfenAlertDelegate>delegate;

@end
