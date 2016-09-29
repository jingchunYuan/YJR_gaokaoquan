//
//  TecherModel.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/1.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JSONModel.h"

@interface TecherModel : JSONModel

@property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSString *true_name;
@property (nonatomic,copy) NSString *avatar;
@property (nonatomic,copy) NSString *praise_total;
@property (nonatomic,copy) NSString *astro;
@property (nonatomic,copy) NSString *sex;
@property (nonatomic,copy) NSString *education;
@property (nonatomic,copy) NSString *college_id;
@property (nonatomic,copy) NSString *college_name;
@property (nonatomic,copy) NSString *major_id;
@property (nonatomic,copy) NSString *major_name;
@property (nonatomic,copy) NSString *signature;
@property (nonatomic,copy) NSArray *good_course;
@property (nonatomic,copy) NSString *city;
@end
