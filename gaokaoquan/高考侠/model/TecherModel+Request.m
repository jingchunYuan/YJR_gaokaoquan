//
//  TecherModel+Request.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/2.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TecherModel+Request.h"

@implementation TecherModel (Request)

+(void)RequestWithUrl:(NSString *)url
              andPara:(NSDictionary *)para
          andCallBack:(void (^)(NSDictionary * dict, NSArray *arr, NSError * err))callBack
{
    NSLog(@"%@",url);
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data,NSError *err) {
        if ( !err) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *dict = dic[@"data"][@"user"];
            NSArray *arr = dic[@"data"][@"experienceList"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(dict, arr, nil);
            });
            
        }else
 
       {            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil, nil, err);
            });
        }
        
    }];
}


@end
