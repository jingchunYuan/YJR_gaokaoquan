//
//  zhuanyeViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "zhuanyeViewController.h"

@interface zhuanyeViewController ()

@end

@implementation zhuanyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self createUI];
}
     
-(void)createUI {
    
    self.navigationItem.title = @"专业分数线";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem= [UIBarButtonItem initWithImageName:@"搜索" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    btn.backgroundColor = [UIColor clearColor];
    
}

- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
