//
//  LuquShowView.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/11.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LuquShowView : UIView

-(id)initWithFrame:(CGRect)frame items:(NSArray <NSString *> *)items showPoint:(CGPoint)showPoint;

//选中后的颜色
@property (nonatomic,strong) UIColor *selectColor;
@property (nonatomic,strong) UIColor *backGroundColor;
@property (nonatomic,copy) void(^selectBlock) (LuquShowView *view,NSInteger index);
@property (nonatomic,copy) UIColor *itemTextColor;

-(void)setSelectBlock:(void (^)(LuquShowView * view, NSInteger index))block;
//显示
- (void)showView;
//隐藏
- (void)dismissView;

@end
