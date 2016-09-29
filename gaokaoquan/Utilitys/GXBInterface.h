//
//  GXBInterface.h
//  gaokaoquan
//
//  Created by admin on 16/8/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#ifndef GXBInterface_h
#define GXBInterface_h

#import "UIColor+KKBAdd.h"
#import "UIViewController+CustomNavigationButton.h"
#import "RATreeView.h" //多级列表


/**
 *  放置设置接口的宏定义
 *
 */

//---------------------------------- 主机地址定义 -------------------------------------------------

#if  0
#define HOST_ADDRESS        @"http://192.168.30.40:8080/hybird-web"           //测试服务器
#else
#define HOST_ADDRESS        @"http://gxb-app.gaoxiaobang.com/hybird-web"      //正式服务器
#endif

//------------------------------------------------------------------------------------------------

//所有人员的基本信息
#define BSDSIC_GETALLBRANDLIST @"http://192.168.1.10/advisor/lists?p=3&pageSize=20&city=1&q=%E5%8C%97%E4%BA%AC"


#endif /* GXBInterface_h */
