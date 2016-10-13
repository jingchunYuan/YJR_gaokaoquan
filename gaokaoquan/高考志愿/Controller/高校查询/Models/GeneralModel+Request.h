//
//  GeneralModel+Request.h
//  gaokaoquan
//
//  Created by admin on 2016/10/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GeneralModel.h"

@interface GeneralModel (Request)

+(void)RequestWithUrl:(NSArray *)urls andPara:(NSDictionary *)para andCallBack:(void (^)(NSMutableArray * arrs, NSError * err))callBack;

@end
