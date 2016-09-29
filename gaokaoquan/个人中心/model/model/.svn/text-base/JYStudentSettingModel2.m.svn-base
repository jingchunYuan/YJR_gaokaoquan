//
//  JYStudentSettingModel2.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYStudentSettingModel2.h"
#import "JYStudentSettingModel.h"
@implementation JYStudentSettingModel2
-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *arr=[NSMutableArray array];
        for (NSDictionary *dict in self.imageName) {
            JYStudentSettingModel *model = [JYStudentSettingModel StudentSettingModelWithDict:dict];
            
            [arr addObject:model];
        }
        
        self.imageName = arr;
        
    }
    
    
    return self;
}
+(instancetype)StudentSettingModelWithDict:(NSDictionary *)dict
{


    return [[self alloc]initWithDictionary:dict];
}
@end
