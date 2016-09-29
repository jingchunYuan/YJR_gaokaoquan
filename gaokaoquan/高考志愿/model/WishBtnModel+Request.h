//
//  WishBtnModel+Request.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/8.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "WishBtnModel.h"

@interface WishBtnModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray * arr,NSNumber *count, NSError *err))callBack;


@end
