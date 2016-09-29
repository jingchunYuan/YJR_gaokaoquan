//
//  UIViewController+CustomNavigationButton.m
//  learn
//
//  Created by zengmiao on 8/7/14.
//  Copyright (c) 2014 kaikeba. All rights reserved.
//

#import "UIViewController+CustomNavigationButton.h"

#define BAR_BUTTON_WIDTH 35
#define BAR_BUTTOM_HEIGHT 35
#define BAR_BACK_WIDTH 35

#define BAR_RIGHT_ARRAY_WIDTH 30
#define BAR_RIGHT_ARRAY_HEIGHT 22
#define BAR_RIGHT_WIDTH 22
@implementation UIViewController (CustomNavigationButton)

/**
 *  自定义导航栏返回按钮
 *
 *  @param name            图片名称
 *  @param highLightedName highLightedName description
 */
- (void)kkb_customLeftNarvigationBarWithImageName:(NSString *)name
                                  highlightedName:(NSString *)highLightedName {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *normalImgName = name;
    NSString *highlightedImgName = highLightedName;
    if (!normalImgName) {
        normalImgName = @"kkb-iphone-recommend-navi-back-item";
    }
    if (!highlightedImgName) {
        highlightedImgName = @"kkb-iphone-v4-navi-back-item-highlighted";
    }
    [btn setImage:[UIImage imageNamed:normalImgName]
         forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImgName]
         forState:UIControlStateHighlighted];

    btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [btn addTarget:self
                  action:@selector(backBtnTapped)
        forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, BAR_BACK_WIDTH, BAR_BUTTON_WIDTH);

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barItem;
}

/**
 *  自定义导航栏返回按钮
 *
 *  @param title title 默认 "返回"
 */
- (void)kkb_customLeftNarvigationBarWithTitle:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *normalTitle = title;
    NSString *highlightedTitle = title;
    if (!normalTitle) {
        normalTitle = @"返回";
    }
    if (!highlightedTitle) {
        highlightedTitle = @"返回";
    }
    [btn setTitle:normalTitle forState:UIControlStateNormal];
    [btn setTitle:highlightedTitle forState:UIControlStateHighlighted];

    btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [btn addTarget:self
                  action:@selector(backBtnTapped)
        forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, BAR_BACK_WIDTH, BAR_BUTTOM_HEIGHT);

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barItem;
}

/**
 *  自定义导航栏右侧按钮
 *
 *  @param title title 默认 "完成"
 */
- (void)kkb_customRightNarvigationBarWithTitle:(NSString *)title {
    [self kkb_customRightNarvigationBarWithTitle:title
                                      titleColor:nil
                                highlightedColor:nil];
}
/**
 *  自定义导航栏右侧按钮
 *
 *  @param title title 默认 "完成"
 */
- (void)kkb_customRightNarvigationBarWithTitle:(NSString *)title
                                    titleColor:(UIColor *)normalColor
                              highlightedColor:(UIColor *)highlightedColor {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSString *normalTitle = title;
    NSString *highlightedTitle = title;
    if (!normalTitle) {
        normalTitle = @"完成";
    }
    if (!highlightedTitle) {
        highlightedTitle = @"完成";
    }
    [btn setTitle:normalTitle forState:UIControlStateNormal];
    [btn setTitle:highlightedTitle forState:UIControlStateHighlighted];

    if (normalColor) {
        [btn setTitleColor:normalColor forState:UIControlStateNormal];
    }

    if (highlightedColor) {
        [btn setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    }

    btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [btn addTarget:self
                  action:@selector(rightBtnTapped)
        forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, BAR_BUTTON_WIDTH, BAR_BUTTOM_HEIGHT);

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barItem;
}

/**
 *  自定义导航栏右侧按钮
 *
 *  @param name            图片名称 默认 ZXNavAdd.png
 *  @param highLightedName highLightedName description
 */
- (void)kkb_customRightNarvigationBarWithImageName:(NSString *)name
                                   highlightedName:(NSString *)highLightedName {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    if (!name) {
        name = @"";
    }
    if (!highLightedName) {
        highLightedName = @"";
    }
    [btn setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highLightedName]
         forState:UIControlStateHighlighted];

    btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [btn addTarget:self
                  action:@selector(rightBtnTapped)
        forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, BAR_RIGHT_WIDTH, BAR_BUTTOM_HEIGHT);

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barItem;
}

/**
 *  自定义导航栏右侧多个按钮
 *
 *  @param titleArray titleArray
 */
- (void)kkb_customRightNarvigationBarWithTitleArray:(NSArray *)titleArray {
    NSMutableArray *rightButtonArray = [[NSMutableArray alloc] init];
    for (NSString *buttonTitle in titleArray) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:buttonTitle forState:UIControlStateNormal];
        [btn setTitle:buttonTitle forState:UIControlStateHighlighted];

        btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [btn addTarget:self
                      action:@selector(rightBarButtonClick:)
            forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(0, 0, 30, BAR_BUTTOM_HEIGHT);
        UIBarButtonItem *barItem =
            [[UIBarButtonItem alloc] initWithCustomView:btn];
        [rightButtonArray addObject:barItem];
    }

    self.navigationItem.rightBarButtonItems = (NSArray *)rightButtonArray;
}

/**
 *  自定义导航栏右侧多个图片按钮
 *
 *  @param normalArray normalImage
 *  @param highlightedArray highlightedImage
 */
- (void)kkb_customRightNarvigationBarWithNormalImageArray:(NSArray *)normalArray
                                    highlightedImageArray:
                                        (NSArray *)highlightedArray {
    NSMutableArray *rightButtonArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < normalArray.count; i++) {
        NSString *normalImageName = [normalArray objectAtIndex:i];
        NSString *highlightedImageName = [highlightedArray objectAtIndex:i];

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:normalImageName]
             forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:highlightedImageName]
             forState:UIControlStateHighlighted];

        btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [btn addTarget:self
                      action:@selector(rightBarButtonClick:)
            forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 22222 * (i + 1);
        btn.frame =
            CGRectMake(0, 0, BAR_RIGHT_ARRAY_WIDTH, BAR_RIGHT_ARRAY_HEIGHT);
        UIBarButtonItem *barItem =
            [[UIBarButtonItem alloc] initWithCustomView:btn];
        [rightButtonArray addObject:barItem];
    }

    self.navigationItem.rightBarButtonItems = (NSArray *)rightButtonArray;
}
- (void)backBtnTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnTapped {
}

- (void)rightBarButtonClick:(UIButton *)button {
}

@end
