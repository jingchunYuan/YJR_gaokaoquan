//
//  JYTextFiled.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTextFiled.h"

@implementation JYTextFiled

// MARK:-改变占位文字的位置
- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
     CGRect place = [super placeholderRectForBounds:bounds];
    
    place.origin.y -= 60    ;

    return place;
}

// MARK:-改变光标的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x + 2, bounds.origin.y - 60, bounds.size.width, bounds.size.height);
    return inset;
}

@end
