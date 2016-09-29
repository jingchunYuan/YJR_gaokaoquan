//
//  JYNetWorkTool.m
//  text666666
//
//  Created by 家跃 on 16/9/3.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "JYNetWorkTool.h"

@implementation JYNetWorkTool

static JYNetWorkTool *instance;

+ (instancetype)sharedTools{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        
        // 添加反序列化的内容类型
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain",@"text/html", nil];
    });
    return instance;
}


- (void)request:(JYRequestMethod)method urlString:(NSString *)urlString parameters:(id)parameters callback:(void (^)(id, NSError *))callback
{

    if (method == JYRequestMethodGET) {
        
        [self GET:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            
            callback(responseObject,nil);
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
           
            callback(nil,error);
            
        }];
        
//        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            // 请求成功 -> 把请求回来的数据回调回去
//            callback(responseObject, nil);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            // 请求失败 -> 把error 回调回去
//            callback(nil, error);
//        }];
    }else{
        
        
        [self POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            
            callback(responseObject,nil);
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            callback(nil,error);
            
        }];
//        [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            // 请求成功 -> 把请求回来的数据回调回去
//            callback(responseObject, nil);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            // 请求失败 -> 把error 回调回去
//            callback(nil, error);
//        }];
    }

    
}

@end
