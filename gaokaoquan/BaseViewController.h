//
//  BaseViewController.h
//  gaokaoquan
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "MJRefresh.h"
#import "HDManager.h"
@interface BaseViewController : UIViewController
@property (nonatomic, assign) NSInteger page;
//提供给子类重写
-(void)loadData;
//数据请求结束之后
-(void)stopLoadData;
@end
