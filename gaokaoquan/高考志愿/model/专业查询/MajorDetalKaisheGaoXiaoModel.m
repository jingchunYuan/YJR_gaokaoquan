//
//  MajorDetalKaisheGaoXiaoModel.m
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalKaisheGaoXiaoModel.h"

@implementation MajorDetalKaisheGaoXiaoModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
    
    if ([key isEqualToString:@"tag"]) {
        _tagArray = [[NSMutableArray alloc] init];
        for (NSString *s in value) {
            [_tagArray addObject:s];
        }
    }
    
}

@end
