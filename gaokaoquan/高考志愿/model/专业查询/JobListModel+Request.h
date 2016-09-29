//
//  JobListModel+Request.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JobListModel.h"

@interface JobListModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(NSArray *arr, NSError *err))callBack;
@end
