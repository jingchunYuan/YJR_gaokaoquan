//
//  JYKongFuModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
/*
 pid: "1",
 name: "北京大学",
 total_score: "205.71",
 culture: "92.16",
 study: "62.12",
 type: "综合类",
 province: "北京",
 college_id: "1"
 
 */

#import <Foundation/Foundation.h>

@interface JYKongFuModel : NSObject

@property (nonatomic,copy) NSString *pid;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *total_score;

@property (nonatomic,copy) NSString *culture;

@property (nonatomic,copy) NSString *study;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *province;

@property (nonatomic,copy) NSString *college_id;

@end
