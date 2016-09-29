//
//  ManModel.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/8/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JSONModel.h"

@interface ManModel : JSONModel

@property(nonatomic,copy)NSString *uid;

@property(nonatomic,copy)NSString *avatar;

@property(nonatomic,copy)NSString *true_name;

@property(nonatomic,copy)NSString *home_province;

@property(nonatomic,copy)NSString *home_city;

@property(nonatomic,copy)NSString *praise_total;

@property(nonatomic,copy)NSString *college_name;

@property(nonatomic,copy)NSString *major_name;

@property(nonatomic,copy)NSString *education;

@property(nonatomic,copy)NSArray *good_course;

@property(nonatomic,copy)NSString *signature;

@property(nonatomic,copy)NSString *astro;
          

@end
