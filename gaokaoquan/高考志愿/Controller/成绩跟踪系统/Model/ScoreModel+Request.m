//
//  ScoreModel+Request.m
//  gaokaoquan
//
//  Created by Nevis on 2016/10/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ScoreModel+Request.h"

@implementation ScoreModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray *, NSError *))callBack{
    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        if (!err) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray * arrays = [[NSMutableArray alloc]init];
            NSDictionary * dd = dict[@"data"];
            for (int i =0 ; i<3; i++) {
                NSMutableArray * arr = [[NSMutableArray alloc]init];
                //                for (NSDictionary * score in dd.allValues[i] ) {
                //                    ScoreModel * model = [[ScoreModel alloc]init];
                //                    [model setValuesForKeysWithDictionary:score];
                //                    [arr addObject:model];
                //                }
                
                for (NSArray * list in [dd.allValues[i] allObjects]) {
                    for (NSDictionary * score in list) {
                        [arr addObject:score[@"score"]];
                    }
                    
                }
                //                JSONModelArray * models = [[JSONModelArray alloc]initWithArray:dd.allValues[i] modelClass:[NSString class]];
                [arrays addObject:(NSArray*)arr];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack((NSArray *)arrays,nil);
            });
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,err);
            });
        }
    }];
}
@end
