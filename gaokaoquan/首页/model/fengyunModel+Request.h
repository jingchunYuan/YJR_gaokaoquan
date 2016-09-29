//
//  fengyunModel+Request.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "fengyunModel.h"

@interface fengyunModel (Request)

+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray * arr, NSError * err))callBack;

@end
