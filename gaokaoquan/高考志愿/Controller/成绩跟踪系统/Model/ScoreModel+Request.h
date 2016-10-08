//
//  ScoreModel+Request.h
//  gaokaoquan
//
//  Created by Nevis on 2016/10/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ScoreModel.h"

@interface ScoreModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray * arr, NSError *err))callBack;
@end
