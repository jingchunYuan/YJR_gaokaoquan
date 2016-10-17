//
//  ShopModel+Request.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ShopModel.h"

@interface ShopModel (Request)
+(void)RequestWithUrl:(NSString *)url andPara:(NSDictionary *)para andCallBack:(void (^)(ShopModel * model, NSError * err))callBack;
@end
