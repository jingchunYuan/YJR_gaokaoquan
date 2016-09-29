//
//  KSHttpManager.m
//  Student
//
//  Created by pczhai on 15/7/27.
//  Copyright (c) 2015年 kaikeba. All rights reserved.
//

#import "KSHttpManager.h"

@implementation KSHttpManager

+ (KSHttpManager *) shareInstance {
    static KSHttpManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[KSHttpManager alloc] init];
        NSURLCache *cache =
        [[NSURLCache alloc] initWithMemoryCapacity:200 * 1024 * 1024
                                      diskCapacity:320 * 1024 * 1024
                                          diskPath:@"app_cache"];
        [NSURLCache setSharedURLCache:cache];
    });
    return singleton;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self customInitPublicConfig];
    }
    return self;
}

- (void)customInitPublicConfig {
    
    // reqeust
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    self.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"HEAD", nil];
    [self.requestSerializer setTimeoutInterval:60];       // yjc 设置10秒超时
    
    // response
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    AFJSONResponseSerializer *jsonSerializer = [AFJSONResponseSerializer serializer];
    jsonSerializer.removesKeysWithNullValues = YES;
    self.responseSerializer = jsonSerializer;
    
    //请求头
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
}

#pragma mark - public Http Methods
// 因为请求头不同 请不要在通用方法中使用HOST_API
// 如果要使用，请在对应的请求方法里将url拼接好
// 请求集合
- (void)requestUrlPath:(NSString *)urlPath
                method:(NSString *)method
                 param:(id)param
             fromCache:(BOOL)fromCache
        requestSuccess:(ksSuccessBlock) returnSuccessBlock
        requestFailure:(ksFailureBlock) returnFailureBlock {
    
    if (![urlPath hasPrefix:@"http"]) {
        urlPath = [NSString stringWithFormat:@"%@/%@", HOST_ADDRESS, urlPath];
    }
    
    //NSURLRequestReturnCacheDataElseLoad 首先使用缓存，如果没有本地缓存，才从原地址下载
    //NSURLRequestReloadIgnoringCacheData 忽略本地缓存
    [self.requestSerializer setCachePolicy:fromCache ? NSURLRequestReturnCacheDataElseLoad : NSURLRequestReloadIgnoringCacheData];
    
    NSLog(@"yjc -- urlPath=%@",urlPath);
    
    
    if ([method isEqualToString:@"GET"]) {
        [self GET:urlPath
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              returnSuccessBlock(responseObject, operation);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              returnFailureBlock (error,operation);
          }];
    } else if ([method isEqualToString:@"POST"]) {
        [self POST:urlPath
        parameters:param
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               returnSuccessBlock(responseObject, operation);
           }
           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               returnFailureBlock(error, operation);
           }];
    } else if ([method isEqualToString:@"DELETE"]){
        
        [self DELETE:urlPath parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
            returnSuccessBlock(responseObject, operation);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            returnFailureBlock(error, operation);
        }];
    } else if ([method isEqualToString:@"PUT"]){
        
        [self PUT:urlPath parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
            returnSuccessBlock(responseObject, operation);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            returnFailureBlock(error, operation);
        }];
    }
    
}

#pragma mark - 取消指定的网络请求任务（如果指定的任务正在请求）
- (void)cancelCurrentRequesetInQueueWithRequestURL:(NSString *)urlStr {
    for (AFHTTPRequestOperation *operation in self.operationQueue.operations) {
        if ([[operation.request.URL absoluteString] isEqualToString:urlStr]) {
            [operation cancel];
            NSLog(@"取消网络请求 url = %@",urlStr);
            break;
        }
    }
}

@end
