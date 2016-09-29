//
//  GXQUIDefine.h
//  gaokaoquan
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#ifndef GXQUIDefine_h
#define GXQUIDefine_h

/**
 *  放置设置UI的宏定义
 *
 */

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define NAV_STATUS_HEIGHT   64
#define MENU_HEIGHT         40

#define   LIGHTYELLOWCOLOR   [UIColor colorWithRed:252.0/255.0 green:184.0/255.0 blue:2.0/255.0 alpha:1.0]
#define   VIEWCONTROLLERBGCOLOR   [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0]
#define   RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
                [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
#define   MAIN_FONT_COLOR    [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
#define   NAVAGATIONCOLOR    [UIColor colorWithRed:3.0/255.0 green:169.0/255.0 blue:244.0/255.0 alpha:1.0]


/** 
 * 1: 修改默认的NSLog打印格式
 * 0: 去掉NSLog打印
 **/
#if 1
#define NSLog(FORMAT, ...) fprintf(stderr, "[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__]UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif





#endif /* GXQUIDefine_h */
