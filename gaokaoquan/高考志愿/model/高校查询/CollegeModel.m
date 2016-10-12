//
//  CollegeModel.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeModel.h"

@implementation CollegeModel

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"Id"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end
