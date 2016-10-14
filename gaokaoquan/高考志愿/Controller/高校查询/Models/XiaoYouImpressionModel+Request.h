//
//  ImpressionModel+Request.h
//  gaokaoquan
//
//  Created by admin on 2016/10/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "XiaoYouImpressionModel.h"

@interface XiaoYouImpressionModel (Request)

+(void)RequestWithUrl:(NSString *)urls andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray *arrs, NSError * err))callBack;
    
@end
