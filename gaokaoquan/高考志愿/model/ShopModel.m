
//
//  ShopModel.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ShopModel.h"

@implementation ShopModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
}

@end
