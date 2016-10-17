//
//  ShopServiceModel.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/15.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JSONModel.h"

@interface ShopServiceModel : NSObject
@property (nonatomic,copy) NSString * Id;
@property (nonatomic,assign) NSInteger uid;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * original_price;
@property (nonatomic,copy) NSString * price;
@property (nonatomic,copy) NSString * Discount;
@property (nonatomic,assign) NSInteger gold;
@property (nonatomic,assign) NSInteger kgold;
@property (nonatomic,assign) NSInteger couponList;
@property (nonatomic,copy) NSString *  stock;//
//coupon
@property (nonatomic,copy) NSString * couponimg;
@end
