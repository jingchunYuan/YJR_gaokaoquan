//
//  ShopModel.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopModel : NSObject
@property (nonatomic,copy) NSString * Id;
@property (nonatomic,assign) NSInteger uid;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * original_price;
@property (nonatomic,copy) NSString * price;
@property (nonatomic,copy) NSString * Discount;
@property (nonatomic,assign) NSInteger gold;
@property (nonatomic,assign) NSInteger kgold;
@property (nonatomic,assign) NSInteger couponList;
@property (nonatomic,copy) NSString *  stock;//股票
@property (nonatomic,copy) NSString * coupon;
@property (nonatomic,copy) NSString * couponimg;
@property (nonatomic,copy) NSString *bank;

@end
