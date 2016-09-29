//
//  BaseRequest.m
//  CherryAnimation
//
//  Created by Nevis on 16/6/13.
//  Copyright © 2016年 Nevis. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

+(void)getWithURL:(NSString *)url para:(NSDictionary *)para compeleteHandler:(void (^)(NSData * data, NSError * err))handler
{
    //创建session任务管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置解析器为二进制解析器
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:para success:^(NSURLSessionDataTask *task, id responseObject) {
        handler(responseObject,nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        handler(nil,error);
    }];
}
@end
