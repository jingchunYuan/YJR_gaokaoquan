//
//  MajorDetalJiuYeQingKuangModel+Request.m
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalJiuYeQingKuangModel+Request.h"

@implementation MajorDetalJiuYeQingKuangModel (Request)

+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(id dict, NSError *err))callBack {
    
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        
        if (!err) {
            
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dict1 = dict[@"data"];
            
            MajorDetalJiuYeQingKuangModel * model = [[MajorDetalJiuYeQingKuangModel alloc]init];
            [model setValuesForKeysWithDictionary:dict1];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(model,nil);
            });
            
        }
        
    }];
    
}


@end
