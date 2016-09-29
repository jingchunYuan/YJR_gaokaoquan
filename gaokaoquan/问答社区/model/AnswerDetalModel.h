//
//  AnswerDetalModel.h
//  gaokaoquan
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JSONModel.h"

@interface AnswerDetalModel : JSONModel

// 下
@property(nonatomic,copy) NSString *avatar;
@property(nonatomic,copy) NSString *true_name;
@property(nonatomic,copy) NSString *comment_time;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *info;

@end
