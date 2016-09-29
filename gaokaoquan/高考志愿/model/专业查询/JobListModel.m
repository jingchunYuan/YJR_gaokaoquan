//
//  JobListModel.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JobListModel.h"
#import "MajorModel.h"

@implementation JobListModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
    if ([key isEqualToString:@"category"]) {
        _jobCategory = [[NSMutableArray alloc]init];
        for (NSDictionary * dict in value) {
            MajorModel * model = [[MajorModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_jobCategory addObject:model];
        }
    }
    
    if ([key isEqualToString:@"job"]) {
        _job = [[JobModel alloc]init];
        [_job setValuesForKeysWithDictionary:value];
    }
    if ([key isEqualToString:@"jobCategory"]) {
        _jobCategory = [[NSMutableArray alloc]init];
        for (NSDictionary * dict in value) {
            JobModel * model = [[JobModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_jobCategory addObject:model];
        }
    }
}

@end
