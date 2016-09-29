//
//  JYSettingViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYSettingViewController.h"
#import "JYChangePasswordController.h"
#import "JYFeedbackViewController.h"
@interface JYSettingViewController ()

@end

@implementation JYSettingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItem)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"设置"];
    
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:242/255.0 blue:245/255.0 alpha:1];
    
    
    [self setUI];
    
    
}


// MARK:-UI搭建

- (void)setUI
{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, KWIDTH, 120)];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:view];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 15, 29, 29)];
    
    [view addSubview:imageView];
    
    
    imageView.image = [UIImage imageNamed:@"xiugaimima_1"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(40, 18, 100, 20);
    
    [btn setTitle:@"修改密码" forState:UIControlStateNormal];
    
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:btn];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 60, KWIDTH, 1)];
    
    [view addSubview:line];
    
    line.backgroundColor = [UIColor colorWithRed:240/255.0 green:242/255.0 blue:245/255.0 alpha:1];
    
    
    UIImageView *imageview2 = [[UIImageView alloc]initWithFrame:CGRectMake(20, 70, 29, 29)];
    
    imageview2.image = [UIImage imageNamed:@"意见反馈_1"];
    
    [view addSubview:imageview2];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn2.frame = CGRectMake(40, 72, 100, 20);
    
    [btn2 setTitle:@"意见反馈" forState:UIControlStateNormal];
    
    [view addSubview:btn2];
    
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(10, 150, KWIDTH - 2 * 10, 40);
    
    [button setTitle:@"退出登录" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    button.backgroundColor = [UIColor colorWithRed:250/255.0 green:111/255.0 blue:87/255.0 alpha:1];
    
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];


}

// MARK:-修改密码点击
- (void)btnClick:(UIButton *)btn
{
    
    JYChangePasswordController *change = [[JYChangePasswordController alloc]init];
    
    [self.navigationController pushViewController:change animated:YES];
    
    
}


// MARK:-意见反馈点击
- (void)btn2Click:(UIButton *)button
{

    JYFeedbackViewController *feedback = [[JYFeedbackViewController alloc]init];
    
    
    [self.navigationController pushViewController:feedback animated:YES];

}

// MARK:-退出登录点击
- (void)buttonClick:(UIButton *)Button
{

   
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要退出登录吗?" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
        NSLog(@"退出成功");
        
        
    }]];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (void)leftBarButtonItem
{

    [self.navigationController popViewControllerAnimated:YES];

}

@end
