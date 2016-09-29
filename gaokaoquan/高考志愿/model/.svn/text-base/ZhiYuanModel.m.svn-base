//
//  ZhiYuanModel.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ZhiYuanModel.h"

@implementation ZhiYuanModel
-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    [super setValuesForKeysWithDictionary:keyedValues];
    if ([keyedValues objectForKey:@"banner"]) {
        _banner = [[WishBtnModel alloc]init];
        [_banner setValuesForKeysWithDictionary:[keyedValues[@"banner"] firstObject]];
    }
    if ([keyedValues objectForKey:@"service"]) {
        _service = [[NSMutableArray alloc]init];
        for (NSDictionary * service in keyedValues[@"service"]) {
            ServiceModel * model = [[ServiceModel alloc]init];
            [model setValuesForKeysWithDictionary:service];
            [_service addObject:model];
        }
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}@end
