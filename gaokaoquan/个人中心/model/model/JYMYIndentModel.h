//
//  JYMYIndentModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

/*
 
 order_no: "20160305174825470084",
 cid: "1",
 uid: "2567",
 title: "估分选大学",
 price: "49.00",
 pay_balance: "0.00",
 pay_gold: "0",
 pay_coupon: "0.00",
 pay_money: "49.00",
 ctime: "1457171305",
 status: "2",
 status_title: "已关闭",
 gold_pay_status: "0",
 service_id: "8",
 ask_title: null,
 ask_info: null,
 phone: null,
 order_date: null,
 order_time: null,
 user_read: null,
 advisor_read: null
 
 */

#import <Foundation/Foundation.h>

@interface JYMYIndentModel : NSObject

@property (nonatomic,copy) NSString *order_no;

@property (nonatomic,copy) NSString *cid;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *price;

@property (nonatomic,copy) NSString *pay_balance;

@property (nonatomic,copy) NSString *pay_gold;

@property (nonatomic,copy) NSString *pay_coupon;

@property (nonatomic,copy) NSString *pay_money;

@property (nonatomic,copy) NSString *ctime;

@property (nonatomic,copy) NSString *status;

@property (nonatomic,copy) NSString *status_title;

@property (nonatomic,copy) NSString *gold_pay_status;

@property (nonatomic,copy) NSString *service_id;

@end
