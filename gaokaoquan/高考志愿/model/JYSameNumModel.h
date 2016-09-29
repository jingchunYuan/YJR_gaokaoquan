//
//  JYSameNumModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//
/*
 id: "4",
 title: "同分考生去向",
 thumb: "http://img.gaokaoq.com/item/service4.jpg",
 desc: "看看和你分数相近的同学，他们都选择的哪些院校，就读了什么专业，为考生填报志愿提供参考。",
 img_title: "查询往年与你分数相近考生的去向",
 original_price: "79.00",
 price: "32.00",
 service_times: "30",
 content_wap: "<p><img src="http://img.gaokaoq.com/item/service_content4.jpg"/></p>",
 intro: "看看和你分数相近的同学，他们都选择的哪些院校，就读了什么专业，为考生填报志愿提供参考。<br><br>适用考生：想查看和自己分数相同的学长学姐的去向<br><b>适用批次</b>：普通类本/专科批次 （提前批、艺术/体育类暂不适用）",
 time: 0
 
 */

#import <Foundation/Foundation.h>

@interface JYSameNumModel : NSObject

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *thumb;

@property (nonatomic,copy) NSString *desc;

@property (nonatomic,copy) NSString *img_title;

@property (nonatomic,copy) NSString *original_price;

@property (nonatomic,copy) NSString *price;

@property (nonatomic,copy) NSString *service_times;

@property (nonatomic,copy) NSString *content_wap;

@property (nonatomic,copy) NSString *intro;

@property (nonatomic,copy) NSString *time;

@end
