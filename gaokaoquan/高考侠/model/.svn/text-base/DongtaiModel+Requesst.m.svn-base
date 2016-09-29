
//
//  DongtaiModel+Requesst.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/5.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "DongtaiModel+Requesst.h"

@implementation DongtaiModel (Requesst)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray * arr, NSError *err))callBack{
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data,NSError *err) {
        
        if (!err) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *arr = dict[@"data"][@"list"];
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(arr,nil);
            });
        }else{
            callBack(nil,err);
        }
    }];
    
}
@end

