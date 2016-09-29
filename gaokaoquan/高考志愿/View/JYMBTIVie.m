//
//  JYMBTIVie.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMBTIVie.h"

@implementation JYMBTIVie

+ (instancetype)loadNibView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JYMBTIVie" owner:nil options:nil]lastObject];
}
@end
