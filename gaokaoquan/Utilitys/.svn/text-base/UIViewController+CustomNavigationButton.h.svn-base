//
//  UIViewController+CustomNavigationButton.h
//  learn
//
//  Created by zengmiao on 8/7/14.
//  Copyright (c) 2014 kaikeba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CustomNavigationButton)

/**
 *  自定义导航栏返回按钮
 *
 *  @param name            图片名称
 *  @param highLightedName highLightedName description
 */
- (void)kkb_customLeftNarvigationBarWithImageName:(NSString *)name
                                  highlightedName:(NSString *)highLightedName;

/**
 *  自定义导航栏返回按钮
 *
 *  @param title title 默认 "返回"
 */
- (void)kkb_customLeftNarvigationBarWithTitle:(NSString *)title;

/**
 *  自定义导航栏右侧按钮
 *
 *  @param name            图片名称 默认 ZXNavAdd.png
 *  @param highLightedName highLightedName description
 */
- (void)kkb_customRightNarvigationBarWithImageName:(NSString *)name
                                   highlightedName:(NSString *)highLightedName;

/**
 *  自定义导航栏右侧按钮
 *
 *  @param title title 默认 "完成"
 */
- (void)kkb_customRightNarvigationBarWithTitle:(NSString *)title;

/**
 *  自定义导航栏右侧按钮
 *
 *  @param title title 默认 "完成"
 *  @param normalColor

 */
- (void)kkb_customRightNarvigationBarWithTitle:(NSString *)title
                                    titleColor:(UIColor *)normalColor
                              highlightedColor:(UIColor *)highlightedColor;

/**
 *  自定义导航栏右侧多个按钮
 *
 *  @param titleArray titleArray
 */
- (void)kkb_customRightNarvigationBarWithTitleArray:(NSArray *)titleArray;

/**
 *  自定义导航栏右侧多个图片按钮
 *
 *  @param normalArray normalImage
 *  @param highlightedArray highlightedImage
 */
- (void)kkb_customRightNarvigationBarWithNormalImageArray:(NSArray *)normalArray
                                    highlightedImageArray:
                                        (NSArray *)highlightedArray;
/**
 *  如果需要自定义返回动作 重写此方法
 */
- (void)backBtnTapped;

/**
 *  导航栏右侧按钮事件
 */
- (void)rightBtnTapped;

/**
 *  导航栏右侧多个按钮事件
 */
- (void)rightBarButtonClick:(UIButton *)button;

@end
