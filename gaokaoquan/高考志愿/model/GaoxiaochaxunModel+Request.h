//
//  GaoxiaochaxunModel+Request.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoxiaochaxunModel.h"

@interface GaoxiaochaxunModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray * arr, NSError * err))callBack;
@end
