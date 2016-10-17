//
//  ImpressionModel+Request.m
//  gaokaoquan
//
//  Created by admin on 2016/10/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "XiaoYouImpressionModel+Request.h"

@implementation XiaoYouImpressionModel (Request)

+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray *arrs, NSError * err))callBack {
    
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        
        if (!err) {
            
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSLog(@"---%@", dict[@"data"][@"comment"]);
            
            NSMutableArray *models = [[NSMutableArray alloc]init];
            for (NSDictionary * dic in dict[@"data"][@"comment"]) {
                XiaoYouImpressionModel * model = [[XiaoYouImpressionModel alloc]init];
                [model setValuesForKeysWithDictionary:dic];
                [models addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack((NSArray *)models,nil);
            });
            
        }
        
    }];
    
}

    
@end
