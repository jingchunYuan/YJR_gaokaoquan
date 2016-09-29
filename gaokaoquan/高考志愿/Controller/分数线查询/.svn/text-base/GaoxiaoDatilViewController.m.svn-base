//
//  GaoxiaoDatilViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoxiaoDatilViewController.h"

@interface GaoxiaoDatilViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel *_cityLabel;
    
}

@end

@implementation GaoxiaoDatilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
    
    
}
-(void)createUI {
    self.navigationItem.title = @"高校分数线";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem= [UIBarButtonItem initWithImageName:@"搜索" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    btn.backgroundColor = [UIColor clearColor];
//    _table.delegate = self;
//    _table.dataSource = self;
//    [self.table registerNib:[UINib nibWithNibName:@"UniversitySearchCell" bundle:nil] forCellReuseIdentifier:@"UniversitySearchCell"];
    //NSLog(@"%@",_url);
   
  
    
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


- (IBAction)chaxunBtn:(id)sender {
}
@end
