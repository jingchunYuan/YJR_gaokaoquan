//
//  JYScoreModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
/*
 id: "109",
 level: "本科",
 batch_name: "本科一批",
 year: "2015",
 college_name: "北京大学",
 major_name: "经济学类",
 score: "704",
 number: "1",
 rank: "68"
 */

#import <Foundation/Foundation.h>

@interface JYScoreModel : NSObject

@property (nonatomic,copy) NSString *ID;

@property (nonatomic,copy) NSString *level;

@property (nonatomic,copy) NSString *batch_name;

@property (nonatomic,copy) NSString *year;

@property (nonatomic,copy) NSString *college_name;

@property (nonatomic,copy) NSString *major_name;

@property (nonatomic,copy) NSString *score;

@property (nonatomic,copy) NSString *number;

@property (nonatomic,copy) NSString *rank;

@end
