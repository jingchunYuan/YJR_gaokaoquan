//
//  MajorDetalXueYouPingLunModel.m
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalXueYouPingLunModel.h"

@implementation MajorDetalXueYouPingLunModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
    
}

@end
