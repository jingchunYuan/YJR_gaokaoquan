//
//  PersonModel.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/8/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//


/**
 "anonymous": "0",
 "uid": "237719",
 "true_name": "高考侠",
 "avatar": "",
 "title": "20来天时间，理科生如何有效提高数学成绩？",
 "info": "",
 "comment_total": "6",
 "follow_total": "0",
 "ask_time": "5月17日 14:36",
 "update_time": "7月14日 17:04"
 */

#import "JSONModel.h"

@interface PersonModel : JSONModel

@property(nonatomic,copy)NSString *anonymous;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *true_name;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *info;
@property(nonatomic,copy)NSString *comment_total;
@property(nonatomic,copy)NSString *follow_total;
@property(nonatomic,copy)NSString *ask_time;
@property(nonatomic,copy)NSString *update_time;
@property(nonatomic,copy)NSString * Id;
@property(nonatomic,copy)NSArray *good_course;

@end
