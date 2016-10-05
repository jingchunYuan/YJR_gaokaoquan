//
//  MajorDetalKaisheGaoXiaoModel+Request.h
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalKaisheGaoXiaoModel.h"

@interface MajorDetalKaisheGaoXiaoModel (Request)

+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray *arr, NSError *err))callBack;

@end
