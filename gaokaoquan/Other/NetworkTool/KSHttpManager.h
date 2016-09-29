//
//  KSHttpManager.h
//  Student
//
//  Created by pczhai on 15/7/27.
//  Copyright (c) 2015年 kaikeba. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

typedef void (^ksSuccessBlock)(id result, AFHTTPRequestOperation *operation);
typedef void (^ksFailureBlock)(id result, AFHTTPRequestOperation *operation);


@interface KSHttpManager : AFHTTPRequestOperationManager

+ (KSHttpManager *)shareInstance;

/**
 *  网络请求的总函数
 *
 *  @param urlPath            urlPath
 *  @param method             method
 *  @param param              param
 *  @param fromCache          fromCache
 *  @param returnSuccessBlock returnSuccessBlock
 *  @param returnFailureBlock returnFailureBlock
 */
- (void)requestUrlPath:(NSString *)urlPath
                method:(NSString *)method
                 param:(id)param
             fromCache:(BOOL)fromCache
        requestSuccess:(ksSuccessBlock) returnSuccessBlock
        requestFailure:(ksFailureBlock) returnFailureBlock;

/**
 *  取消指定的网络请求任务（如果指定的任务正在请求）
 *
 *  @return  urlStr
 */
- (void)cancelCurrentRequesetInQueueWithRequestURL:(NSString *)urlStr;


@end
