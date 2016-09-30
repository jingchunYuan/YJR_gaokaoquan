//
//  MajorDetalJieshaoModel.h
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MajorDetalJieshaoModel : NSObject

@property(nonatomic, strong) NSMutableArray *joblist;
@property(nonatomic, copy) NSString *Id;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *code;
@property(nonatomic, copy) NSString *years;
@property(nonatomic, copy) NSString *degree;
@property(nonatomic, copy) NSString *course;
@property(nonatomic, copy) NSString *like_major;
@property(nonatomic, copy) NSString *content;

@end
