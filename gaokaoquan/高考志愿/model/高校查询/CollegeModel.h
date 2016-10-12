//
//  CollegeModel.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JSONModel.h"

@interface CollegeModel : JSONModel

/*
 招生计划
 {
 "id": "1",
 "college_id": "1",
 "city": "北京",
 "major_name": "考古学",
 "plan_type": "非定向",
 "category": "文史",
 "type": "文科",
 "length": "本科",
 "plan_number": "4",
 "year": "2015",
 "create_ts": "2016-04-02 14:21:20"
 },
 */

@property(nonatomic,copy)NSString * Id;
@property(nonatomic,copy)NSString * college_id;
@property(nonatomic,copy)NSString * city;
@property(nonatomic,copy)NSString * type;
@property(nonatomic,copy)NSString * batch;
@property(nonatomic,copy)NSString * year;
@property(nonatomic,copy)NSString * max_score;
@property(nonatomic,copy)NSString * min_score;
@property(nonatomic,copy)NSString * control_line;
@property(nonatomic,copy)NSString * status;
@property(nonatomic,copy)NSString * admission;
@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * major_name;
@property(nonatomic,copy)NSString * plan_type;
@property(nonatomic,copy)NSString * category;
@property(nonatomic,copy)NSString * length;
@property(nonatomic,copy)NSString * plan_number;
@property(nonatomic,copy)NSString * create_ts;

@end
