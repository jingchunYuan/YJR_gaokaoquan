//
//  JYSchoolFirendView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYSchoolFirendView.h"

@implementation JYSchoolFirendView

+ (instancetype)loadView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JYSchoolFirendView" owner:nil options:nil]lastObject];
}

@end
