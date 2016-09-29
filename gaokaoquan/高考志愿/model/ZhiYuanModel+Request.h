//
//  ZhiYuanModel+Request.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ZhiYuanModel.h"

@interface ZhiYuanModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(ZhiYuanModel * model, NSError * err))callBack;
@end
