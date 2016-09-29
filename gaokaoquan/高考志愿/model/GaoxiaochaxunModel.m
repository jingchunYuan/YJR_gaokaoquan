
//
//  GaoxiaochaxunModel.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoxiaochaxunModel.h"

@implementation GaoxiaochaxunModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"Id"}];
}
@end
