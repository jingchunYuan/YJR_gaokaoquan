//
//  CollegeModel+Request.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeModel+Request.h"

@implementation CollegeModel (Request)
+(void)RequestWithUrl:(NSArray *)urls andPara:(NSDictionary *)para andCallBack:(void (^)(NSMutableArray *, NSError *))callBack{
    
    NSMutableArray * arrs = [[NSMutableArray alloc]init];
    NSArray * modelClass = @[@"college",@"majorScore",@"collegeZsplan"];
    
        [BaseRequest getWithURL:urls[0] para:para compeleteHandler:^(NSData *data, NSError *err) {
            if (!err) {
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"yjc1 : %@",dict[@"data"]);
                
                JSONModelArray * models = [[JSONModelArray alloc]initWithArray:dict[@"data"][modelClass[0]] modelClass:[CollegeModel class]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [arrs addObject:models];
                });

                [BaseRequest getWithURL:urls[1] para:para compeleteHandler:^(NSData *data, NSError *err) {
                    if (!err) {
                        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                        NSLog(@"yjc2 : %@",dict[@"data"]);
                        
                        JSONModelArray * models = [[JSONModelArray alloc]initWithArray:dict[@"data"][modelClass[1]] modelClass:[CollegeModel class]];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [arrs addObject:models];
                        });
                        
                        [BaseRequest getWithURL:urls[2] para:para compeleteHandler:^(NSData *data, NSError *err) {
                            if (!err) {
                                
                                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                NSLog(@"yjc3 : %@",dict[@"data"]);
                                
                                JSONModelArray * models = [[JSONModelArray alloc]initWithArray:dict[@"data"][modelClass[2]] modelClass:[CollegeModel class]];
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    [arrs addObject:models];
                                    callBack(arrs,err);
                                });
                                
                            }else {
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    callBack(nil,err);
                                });
                            }
                        }];
                        
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
