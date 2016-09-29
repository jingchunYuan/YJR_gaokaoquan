//
//  ServiceModel.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ServiceModel.h"

@implementation ServiceModel


-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues{
    [super setValuesForKeysWithDictionary:keyedValues];
    if ([keyedValues objectForKey:@"list"]) {
        _list = [[NSMutableArray alloc]init];
        for (NSDictionary * btn in keyedValues[@"list"]) {
            WishBtnModel * model = [[WishBtnModel alloc]init];
            [model setValuesForKeysWithDictionary:btn];
            [_list addObject:model];
        }
    }
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
