//
//  MajorDetalJieshaoModel.m
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalJieshaoModel.h"

@implementation MajorDetalJieshaoModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];

    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
    
    if ([key isEqualToString:@"joblist"]) {
        _joblist = [[NSMutableArray alloc] init];
        for (NSString *s in value) {
            [_joblist addObject:s];
        }
    }
    
}

@end
