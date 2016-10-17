//
//  ShopServiceModel+Request.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/15.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ShopServiceModel.h"

@interface ShopServiceModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(ShopServiceModel * model, NSError * err))callBack;
@end
