
//
//  WishBtnModel+Request.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/8.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "WishBtnModel+Request.h"

@implementation WishBtnModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray *,NSNumber *count, NSError *))callBack{
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        if (!err) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *arr = dict[@"data"][@"banner"];
            NSNumber *count = dict[@"data"][@"service"];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(arr,count,nil);
            });
            
        }else{
            callBack(nil,nil,err);
        }
    }];
}
@end
