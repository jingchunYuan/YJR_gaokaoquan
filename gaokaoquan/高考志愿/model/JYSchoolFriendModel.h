//
//  JYSchoolFriendModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//
/*
 pid: "1",
 college_id: "1",
 total_score: "100.00",
 city: "北京",
 type: "综合",
 name: "北京大学",
 province_id:"1"
 
 */
#import <Foundation/Foundation.h>

@interface JYSchoolFriendModel : NSObject

@property (nonatomic,copy) NSString *pid;

@property (nonatomic,copy) NSString *college_id;

@property (nonatomic,copy) NSString *total_score;

@property (nonatomic,copy) NSString *city;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *province_id;

@end
