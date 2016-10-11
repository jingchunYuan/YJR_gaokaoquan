//
//  MajorDetalXueYouPingLunModel+Request.h
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalXueYouPingLunModel.h"

@interface MajorDetalXueYouPingLunModel (Request)

+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray *arr, NSError *err))callBack;

@end
