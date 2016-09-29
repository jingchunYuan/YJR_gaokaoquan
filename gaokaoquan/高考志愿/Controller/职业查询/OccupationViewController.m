
//
//  OccupationViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "OccupationViewController.h"

@interface OccupationViewController ()

@end

@implementation OccupationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)createUI{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"搜索" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"职业查询"];
    
}

-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
-(void)rightBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
