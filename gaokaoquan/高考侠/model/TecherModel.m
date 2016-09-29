
//
//  TecherModel.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/1.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TecherModel.h"

@implementation TecherModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    if (self=[super initWithDictionary:dict error:err]) {
        JSONModelArray * models= [[JSONModelArray alloc]initWithArray:dict[@"tList"] modelClass:[TecherModel class]];
        _good_course=(NSArray *)models;
    }
    return self;
}


@end
