//
//  JYSameTableviewCellModel.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
/*
 
 true_name: "",
 avatar: "http://img.gaokaoq.com/avatar/portrait.jpg?2710",
 content: "要升入高三了，都说高三要经历四次大考，都可作为志愿填报的参考，所以先买了参考着，有个准备，省的到时候突击想的不周全。",
 ctime: "2
 */

#import <Foundation/Foundation.h>

@interface JYSameTableviewCellModel : NSObject

@property (nonatomic,copy) NSString *true_name;

@property (nonatomic,copy) NSString *avatar;

@property (nonatomic,copy) NSString *content;

@property (nonatomic,copy) NSString *ctime;


@end
