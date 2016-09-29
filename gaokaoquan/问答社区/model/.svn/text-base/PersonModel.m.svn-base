//
//  PersonModel.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/8/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    if (self=[super initWithDictionary:dict error:err]) {
        JSONModelArray * models= [[JSONModelArray alloc]initWithArray:dict[@"tList"] modelClass:[PersonModel class]];
        _good_course=(NSArray *)models;
    }
    return self;
}
+(JSONKeyMapper *)keyMapper{
    
    //当字典中的key,与模型属性名不一致时，实现这个方法
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"Id"}];
    
}
@end
