//
//  JobModel.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JobModel.h"
@implementation JobModel
//+(JSONKeyMapper *)keyMapper{
//    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"Id"}];
//}
//-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
//    if (self=[super initWithDictionary:dict error:err]) {
//        if ([dict objectForKey:@"jobCategory"]) {
//            JSONModelArray * models = [[JSONModelArray alloc]initWithArray:dict[@"jobCategory"] modelClass:[JobModel class]];
//            _jobCategory = (NSArray *)models;
//        }
//        _Id = dict[@"id"];
//        _name = dict[@"name"];
//    }
//    return self;
//}
//+(BOOL)propertyIsOptional:(NSString *)propertyName{
//    return YES;
//}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
}
//-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
//    [super setValuesForKeysWithDictionary:keyedValues];
//    if ([keyedValues objectForKey:@"jobCategory"]) {
//        _jobCategory = [[NSMutableArray alloc]init];
//        for (NSDictionary * dict in keyedValues[@"jobCategory"]) {
//            JobCategoryModel * model = [[JobCategoryModel alloc]init];
//            [model setValuesForKeysWithDictionary:dict];
//        }
//        
//    }
//}
-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
}
@end
