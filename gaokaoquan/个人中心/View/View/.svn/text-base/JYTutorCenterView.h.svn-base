//
//  JYTutorCenterView.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/5.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYTutorinformModel.h"
typedef void(^iconBlock)();
typedef void(^MyExpBlock) ();
typedef void(^MYGoldBlock) ();
typedef void(^MYMessageBlock)();
@interface JYTutorCenterView : UIView

@property(nonatomic,copy)iconBlock block;

@property (nonatomic,strong) JYTutorinformModel *model;

@property (nonatomic,copy) MyExpBlock expBlock;

@property (nonatomic,copy) MYGoldBlock GoldBlock;

@property (nonatomic,copy) MYMessageBlock messageBlock;

- (void)myMessageClick:(MYMessageBlock)block;

-(void)iconBtnClick:(iconBlock)block;

- (void)ExpClick:(MyExpBlock)block;

- (void)GoldClick:(MYGoldBlock)block;


@end
