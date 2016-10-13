//
//  GeneralModel+Request.m
//  gaokaoquan
//
//  Created by admin on 2016/10/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GeneralModel+Request.h"

@implementation GeneralModel (Request)

+(void)RequestWithUrl:(NSArray *)urls andPara:(NSDictionary *)para andCallBack:(void (^)(NSMutableArray *, NSError *))callBack{
    
    NSMutableArray * arrs = [[NSMutableArray alloc]init];
    [BaseRequest getWithURL:urls[0] para:para compeleteHandler:^(NSData *data, NSError *err) {
        if (!err) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"yjc1 : %@",dict[@"data"]);
            NSDictionary *myDict = dict[@"data"];
            GeneralModel *model = [[GeneralModel alloc] initWithDictionary:myDict error:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [arrs addObject:model];
            });
            
            [BaseRequest getWithURL:urls[1] para:para compeleteHandler:^(NSData *data, NSError *err) {
                if (!err) {
                    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                    NSLog(@"yjc2 : %@",dict[@"data"]);
                    NSDictionary *myDict1 = dict[@"data"];
                    GeneralModel *model1 = [[GeneralModel alloc] initWithDictionary:myDict1 error:nil];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [arrs addObject:model1];
                        callBack(arrs,err);
                    });
                    
                }else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        callBack(nil,err);
                    });
                }
            }];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,err);
            });
        }
    }];
    
}

@end
