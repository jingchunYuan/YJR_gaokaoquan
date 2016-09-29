//
//  ZhiYuanModel+Request.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ZhiYuanModel+Request.h"

@implementation ZhiYuanModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(ZhiYuanModel *, NSError *))callBack{
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        if (!err) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            ZhiYuanModel * model = [[ZhiYuanModel alloc]init];
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
