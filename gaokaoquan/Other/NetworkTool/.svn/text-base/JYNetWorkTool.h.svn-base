//
//  JYNetWorkTool.h
//  text666666
//
//  Created by 家跃 on 16/9/3.
//  Copyright © 2016年 Apple. All rights reserved.
//
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
typedef NS_ENUM(NSUInteger, JYRequestMethod) {
    /// GET
    JYRequestMethodGET = 0,
    /// POST
    JYRequestMethodPOST = 1,
};

@interface JYNetWorkTool : AFHTTPSessionManager

+ (instancetype)sharedTools;

/// 发送请求的方法
///
/// @param method     请求方式
/// @param urlString  请求地址
/// @param parameters 请求参数
/// @param callback   请求完成之后的block回调
- (void)request:(JYRequestMethod)method urlString:(NSString *)urlString parameters:(id)parameters callback:(void(^)(id responseObject, NSError *error))callback;

@end
