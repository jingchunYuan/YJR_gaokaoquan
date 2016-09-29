//
//  MajorModel.m
//  gaokaoquan
//
//  Created by admin on 16/9/28.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorModel.h"
#import "SubMajorModel.h"

@implementation MajorModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
    if ([key isEqualToString:@"major"]) {
        _majorCategory = [[NSMutableArray alloc]init];
        for (NSDictionary * dict in value) {
            SubMajorModel * model = [[SubMajorModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_majorCategory addObject:model];
        }
    }
}

@end
