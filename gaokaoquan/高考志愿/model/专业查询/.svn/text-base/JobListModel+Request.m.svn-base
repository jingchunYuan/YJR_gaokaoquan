//
//  JobListModel+Request.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JobListModel+Request.h"

@implementation JobListModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray *arr, NSError *err))callBack{
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        
        if (!err) {
            
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSMutableArray * models = [[NSMutableArray alloc]init];
            for (NSDictionary * dic in dict[@"data"][@"list"]) {
                JobListModel * model = [[JobListModel alloc]init];
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
