//
//  GeneralModel.m
//  gaokaoquan
//
//  Created by admin on 2016/10/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GeneralModel.h"

@implementation GeneralModel

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"Id"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end
