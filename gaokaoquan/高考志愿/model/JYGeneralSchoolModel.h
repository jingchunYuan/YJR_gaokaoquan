//
//  JYGeneralSchoolModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.
/*
 pid: "1",
 name: "首都医科大学",
 total_score: "100.00",
 city: "北京",
 city_id: "1",
 type: "医药",
 type_id: "1",
 college_id: "77"
 
 */

#import <Foundation/Foundation.h>

@interface JYGeneralSchoolModel : NSObject

@property (nonatomic,copy) NSString *pid;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *total_score;

@property (nonatomic,copy) NSString *city;

@property (nonatomic,copy) NSString *city_id;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *type_id;

@property (nonatomic,copy) NSString *college_id;

@end
