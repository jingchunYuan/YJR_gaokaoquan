//
//  AnswerDetalModel+Request.m
//  gaokaoquan
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AnswerDetalModel+Request.h"

@implementation AnswerDetalModel (Request)

+(void)RequestWithUrl:(NSString *)url
              andPara:(NSDictionary *)para
          andCallBack:(void (^)(NSDictionary *dict, NSArray * arr, NSError * err))callBack

{

    [BaseRequest getWithURL:url para:para compeleteHandler:^(NSData *data, NSError *err) {
        if (!err) {
            
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            NSDictionary *myDict = dict[@"data"][@"ask"];
            JSONModelArray *models = [[JSONModelArray alloc]initWithArray: dict[@"data"][@"answer"]
                                                               modelClass:[AnswerDetalModel class]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(myDict,(NSArray *)models,nil);
            });
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,nil,err);
            });
            
        }
    }];
    
}

@end
