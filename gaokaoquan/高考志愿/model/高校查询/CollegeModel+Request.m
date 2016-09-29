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
    
    //    // 实例化一个调度组
    //    dispatch_group_t group =dispatch_group_create();
    //
    //    // 队列
    //    //    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    NSMutableArray * arrs = [[NSMutableArray alloc]init];
    NSArray * modelClass = @[@"college",@"majorScore"];
        [BaseRequest getWithURL:urls[0] para:para compeleteHandler:^(NSData *data, NSError *err) {
            if (!err) {
                NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSLog(@"%@",dict[@"data"]);
                
                JSONModelArray * models = [[JSONModelArray alloc]initWithArray:dict[@"data"][modelClass[0]] modelClass:[CollegeModel class]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [arrs addObject:models];
                });
                //                        [arrs addObject:(NSArray *)models];
                [BaseRequest getWithURL:urls[1] para:para compeleteHandler:^(NSData *data, NSError *err) {
                    if (!err) {
                        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                        NSLog(@"%@",dict[@"data"]);
                        
                        JSONModelArray * models = [[JSONModelArray alloc]initWithArray:dict[@"data"][modelClass[1]] modelClass:[CollegeModel class]];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [arrs addObject:models];
                            callBack(arrs,err);
                        });
                    }
                }];
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    callBack(nil,err);
                });
            }
        }];
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //        callBack(arrs,nil);
    //    });
    
    
//    dispatch_group_t group = dispatch_group_create();
//    
//    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
//    // 添加任务
//    // group 负责监控任务，queue 负责调度任务
//    for (int i=0; i<urls.count; i++) {
//        
//        for (int i=0; i<urls.count; i++) {
//            dispatch_group_async(group, q, ^{
//                
//                [BaseRequest getWithURL:urls[i] para:para compeleteHandler:^(NSData *data, NSError *err) {
//                    if (!err) {
//                        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//                        NSLog(@"%@",dict[@"data"]);
//                        
//                        JSONModelArray * models = [[JSONModelArray alloc]initWithArray:dict[@"data"][modelClass[i]] modelClass:[CollegeModel class]];
//                        //                        [arrs addObject:(NSArray *)models];
//                        dispatch_async(dispatch_get_main_queue(), ^{
//                            [arrs addObject:(NSArray *)models];
//                            if (i==urls.count-1) {
//                                callBack(arrs,nil);
//                            }
//                        });
//                    }else{
//                        dispatch_async(dispatch_get_main_queue(), ^{
//                            callBack(nil,err);
//                        });
//                    }
//                }];
//            });
//            
//        }
//        
//        
//        
//        
//        
//        // 获得所有调度组里面的异步任务完成的通知
//        //    dispatch_group_notify(group, queue, ^{
//        //        NSLog(@"下载完成，请观看%@", [NSThread currentThread]); //异步的
//        //    });
//        
//        //注意点：在调度组完成通知里，可以跨队列通信
//        
//    }
//    // 监听所有任务完成 － 等到 group 中的所有任务执行完毕后，"由队列调度 block 中的任务异步执行！"
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        // 修改为主队列，后台批量下载，结束后，主线程统一更新UI
//        callBack(arrs,nil);
//    });
}
@end
