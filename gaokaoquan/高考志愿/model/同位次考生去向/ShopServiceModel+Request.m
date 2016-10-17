//
//  ShopServiceModel+Request.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/15.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ShopServiceModel+Request.h"

@implementation ShopServiceModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(ShopServiceModel *, NSError *))callBack{
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        if(!err){
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            ShopServiceModel * model = [[ShopServiceModel alloc]init];
            [model setValuesForKeysWithDictionary:dict[@"data"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(model,nil);
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,err);
            });
        }
    }];
}
@end
