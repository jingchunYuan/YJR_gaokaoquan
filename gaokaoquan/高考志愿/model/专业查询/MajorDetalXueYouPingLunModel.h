//
//  MajorDetalXueYouPingLunModel.h
//  gaokaoquan
//
//  Created by admin on 2016/10/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MajorDetalXueYouPingLunModel : NSObject
/*
 {
 "id": "4686",
 "info": "个人认为,通俗点讲,哲学就是讲大道理的...",
 "up_total": "8",
 "avatar": "",
 "ctime": "2016-01-15 14:13:53"
 },
 */
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, copy) NSString *up_total;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *ctime;

@end
