//
//  MajorDetalJieshaoModel+Request.h
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalJieshaoModel.h"

@interface MajorDetalJieshaoModel (Request)

+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(id dict, NSError *err))callBack;

@end
