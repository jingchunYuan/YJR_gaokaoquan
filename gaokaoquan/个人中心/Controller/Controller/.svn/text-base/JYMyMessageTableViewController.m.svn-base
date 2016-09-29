//
//  JYMyMessageTableViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMyMessageTableViewController.h"
#import "JYMyMessageView.h"
@interface JYMyMessageTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation JYMyMessageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];

    [self.view addSubview:tableview];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
  //  tableview.contentInset = UIEdgeInsetsMake(37, 0, 0, 0);
    
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:@"返回" target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"我的消息"];

    
   // JYMyMessageView *newView = [JYMyMessageView NibWithView];
    
   // newView.frame = CGRectMake(0, 64, KWIDTH, 60);
    
   // [self.view addSubview:newView];
    
    tableview.rowHeight = 60;
  
    
}

// MARK:-数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 44, 44)];
    
    [cell.contentView addSubview:imageview];
    
    if (indexPath.row == 0) {
        
        imageview.image = [UIImage imageNamed:@"w-de-sixin"];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(40, 15, 100, 30)];
        
        [button setTitle:@"我的私信" forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [cell.contentView addSubview:button];
        
        [button addTarget:self action:@selector(MessageClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }else if (indexPath.row == 1){
        
        imageview.image = [UIImage imageNamed:@"w-de-sixin"];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(40, 15, 100, 30)];
        
        [button setTitle:@"提到我的" forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [cell.contentView addSubview:button];
        
        [button addTarget:self action:@selector(LnvoiveClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
    }else if (indexPath.row == 2){
        
        imageview.image = [UIImage imageNamed:@"w-de-sixin"];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(40, 15, 100, 30)];
        
        [button setTitle:@"我的获赞" forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [cell.contentView addSubview:button];
        
        
        [button addTarget:self action:@selector(zanClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }else if (indexPath.row == 3){
        
        imageview.image = [UIImage imageNamed:@"w-de-sixin"];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(40, 15, 100, 30)];
        
        [button setTitle:@"我的邀请" forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [cell.contentView addSubview:button];
        
        [button addTarget:self action:@selector(LnviteClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }else if (indexPath.row == 4){
        
        
        imageview.image = [UIImage imageNamed:@"w-de-sixin"];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(40, 15, 100, 30)];
        
        [button setTitle:@"我的通知" forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [cell.contentView addSubview:button];
        
        [button addTarget:self action:@selector(NotifoationClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    // 让cell分割线顶头
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    // q取消cell的选中模式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

// MARK:-我的私信点击
- (void)MessageClick:(UIButton *)btn
{
    
    NSLog(@"我的私信");
    
}

// MARK:-提到我的点击
- (void)LnvoiveClick:(UIButton *)btn
{
    NSLog(@"提到我的");
    
}

// MARK:-我的获赞点击
- (void)zanClick:(UIButton *)btn
{
    
    NSLog(@"我的获赞");
    
}

// MARK:-我的邀请点击
- (void)LnviteClick:(UIButton *)btn
{
    
    NSLog(@"邀请我的");
    
}

// MARK:-我的通知点击
- (void)NotifoationClick:(UIButton *)btn
{
    
    NSLog(@"我的通知");
    
}
-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
