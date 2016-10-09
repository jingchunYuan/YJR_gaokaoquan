//
//  AppDelegate.m
//  gaokaoquan
//
//  Created by 程伟利 on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"

#import "HomeViewController.h"
#import "WishViewController.h"
#import "ManViewController.h"
#import "AnswerViewController.h"
#import "JYPersonalViewController.h"
#import "GXQNavigationController.h"
#import "GXQUIDefine.h"
#import "GaoXiaoZhiYuanViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建窗口
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    //设置窗口的根控制器
    [self initViewControllers];
    
    //显示窗口
    [self.window makeKeyAndVisible];
    
 
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initViewControllers {
    
    NSArray *vcArray = [NSArray arrayWithObjects:
                        [HomeViewController class],
                        [GaoXiaoZhiYuanViewController class],
                        [ManViewController class],
                        [AnswerViewController class],
                        [JYPersonalViewController class],
                        nil];
    NSArray *titleArr = @[@"首页",@"高考志愿",@"高考侠",@"问答社区",@"个人中心"];
    NSArray *imageArr = @[@"shouye_unselect",@"高考工具-",@"高考侠-",@"问答社区-",@"个人中心-"];
    NSArray *selArr = @[@"shouye_selected",@"高考工具",@"高考侠",@"问答社区",@"个人中心"];
    
    NSMutableArray *controllers = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        
        // 去掉渲染
        UIImage *myImage = [[UIImage imageNamed:[imageArr objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *myselImage = [[UIImage imageNamed:[selArr objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIViewController *vc = [[[vcArray objectAtIndex:i] alloc] init];
        GXQNavigationController *nav = [[GXQNavigationController alloc] initWithRootViewController:vc];
         nav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};

        [vc.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg@2x"] forBarMetrics:UIBarMetricsDefault];
        UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, SCREEN_WIDTH, 20)];
        statusBarView.backgroundColor = [UIColor whiteColor];
        [vc.navigationController.navigationBar addSubview:statusBarView];
        //设置图片
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:[titleArr objectAtIndex:i]
                                                       image:myImage
                                               selectedImage:myselImage];
        //未选中时
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        attrs[NSForegroundColorAttributeName] = UIColorRGBA(79, 193, 233, 1);
        //选中时
        NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
        selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        selectedAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
        
        //设置
        [nav.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
        [nav.tabBarItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
        
        [controllers addObject:nav];
        
    }
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    tabController.viewControllers = controllers;
    tabController.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"矩形-6@2x"];

    self.window.rootViewController = tabController;

    
}


@end
