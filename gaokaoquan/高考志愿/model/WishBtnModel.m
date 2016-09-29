//
//  WishBtnModel.m
//  gaokaoquan
//
//  Created by 崔雪娇 on 16/9/8.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "WishBtnModel.h"

@implementation WishBtnModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"url"]) {
        _url = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/college/lists%@",value];
    }
}
@end
