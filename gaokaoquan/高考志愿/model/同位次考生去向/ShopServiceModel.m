//
//  ShopServiceModel.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/15.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ShopServiceModel.h"

@implementation ShopServiceModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"id"]) {
        _Id = value;
    }
}
@end
