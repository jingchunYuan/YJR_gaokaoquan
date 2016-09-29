//
//  PersonModel+Request.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/8/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "PersonModel+Request.h"

@implementation PersonModel (Request)

+(void)RequestWithUrl:(NSString *)url
              andPara:(NSDictionary *)para
          andCallBack:(void (^)(NSArray *arr, NSError *))callBack
{
    NSLog(@"%@",url);
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        if (!err) {
            
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            JSONModelArray *models = [[JSONModelArray alloc]initWithArray: dict[@"data"][@"list"] modelClass:[PersonModel class]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack((NSArray *)models,nil);
            });
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,err);
            });
            
        }
    }];

}

@end
