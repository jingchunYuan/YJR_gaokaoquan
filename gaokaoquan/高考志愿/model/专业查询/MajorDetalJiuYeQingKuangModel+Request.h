//
//  MajorDetalJiuYeQingKuangModel+Request.h
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalJiuYeQingKuangModel.h"

@interface MajorDetalJiuYeQingKuangModel (Request)

+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(id dict, NSError *err))callBack;

@end
