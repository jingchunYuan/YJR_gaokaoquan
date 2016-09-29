//
//  TabBarController.m
//  gaokaoquan
//
//  Created by 程伟利 on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"
#import "WishViewController.h"
#import "ManViewController.h"
#import "AnswerViewController.h"
#import "JYPersonalViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //改变字体大小 选中时  通过appearance 统一设置所有UITabBarItem的文字属性
    //后面带有UI_APPEARANCE_SELECTOR的方法，都可以通过appearance对象来统一设置
    //未选中时
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        
    
    //选中时
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setupChildVc:[[HomeViewController alloc]init] title:@"首页" image:@"首页-@2x.png"  selectedImage:@"首页@2x.png"];
    
    [self setupChildVc:[[HomeViewController alloc]init] title:@"高考志愿" image:@"高考工具-@2x.png" selectedImage:@"高考工具@2x.png"];
    
    [self setupChildVc:[[HomeViewController alloc]init] title:@"高考侠" image:@"高考侠-@2x.png"selectedImage:@"高考侠@2x.png"];
    
    [self setupChildVc:[[HomeViewController alloc]init] title:@"问答社区" image:@"问答社区-"selectedImage:@"问答社区"];
    
    [self setupChildVc:[[HomeViewController alloc]init] title:@"个人中心" image:@"个人中心-@2x.png"selectedImage:@"个人中心@2x.png"];

}


//初始化自控制器
-(void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置文字和图片
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
//    UINavigationController * nav=[[UINavigationController alloc]initWithRootViewController:vc];
//    nav.navigationBar.titleTextAttributes = @{
//                                              NSForegroundColorAttributeName: [UIColor blackColor],
//                                              NSFontAttributeName:[UIFont fontWithName:@"HYQiHei" size:25.0]
//                                              };
//    vc.navigationItem.title = title;

    //添加为子控制器
    [self addChildViewController:vc];
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
