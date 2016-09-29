//
//  JYLectureModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//
/*
 id: "2204",
 uid: "2567",
 sid: "7",
 result_href: "ServiceChance/result",
 result_id: "2006",
 ctime: "2016-05-16 11:22:27",
 title: "录取概率测试"
 
 */
#import <Foundation/Foundation.h>

@interface JYLectureModel : NSObject

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *uid;

@property (nonatomic,copy) NSString *sid;

@property (nonatomic,copy) NSString *result_href;

@property (nonatomic,copy) NSString *result_id;

@property (nonatomic,copy) NSString *ctime;

@property (nonatomic,copy) NSString *title;

@end
