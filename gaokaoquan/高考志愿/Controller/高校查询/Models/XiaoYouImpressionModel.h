//
//  ImpressionModel.h
//  gaokaoquan
//
//  Created by admin on 2016/10/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XiaoYouImpressionModel : NSObject

/*
 "id": "64",
 "info": "看是不适合自己呗，一般来说学习氛围很不错。",
 "up_total": "31",
 "avatar": "",
 "true_name": null,
 "ctime": "2016-01-17 01:05:11"
 */
@property(nonatomic,copy)NSString *Id;
@property(nonatomic,copy)NSString *info;
@property(nonatomic,copy)NSString *up_total;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *true_name;
@property(nonatomic,copy)NSString *ctime;

@end
