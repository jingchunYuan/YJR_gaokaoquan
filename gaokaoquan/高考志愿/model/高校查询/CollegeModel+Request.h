//
//  CollegeModel+Request.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeModel.h"

@interface CollegeModel (Request)
+(void)RequestWithUrl:(NSArray *)urls andPara:(NSDictionary *)para andCallBack:(void (^)(NSMutableArray * arrs, NSError * err))callBack;

@end
