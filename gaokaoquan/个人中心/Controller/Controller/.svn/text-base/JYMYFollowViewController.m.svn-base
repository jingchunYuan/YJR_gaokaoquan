//
//  JYMYFollowViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMYFollowViewController.h"

@interface JYMYFollowViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation JYMYFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItem)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"关注中心"];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    
    [self.view addSubview:tableview];
    
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    
    
    
}
// MARK:-数据源代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    if (indexPath.section == 0) {
    
        cell.imageView.image = [UIImage imageNamed:@"w-de-guanzhu"];
        
        cell.textLabel.text = @"关注的人";
        
    }else if (indexPath.section == 1){
    
        cell.imageView.image = [UIImage imageNamed:@"guanzhu-wenti"];
        cell.textLabel.text = @"关注问题";
    
    
    }else if (indexPath.section == 2){
    
        cell.imageView.image = [UIImage imageNamed:@"guanzhu-wenzhang"];
        cell.textLabel.text = @"关注文章";

      
    }else if (indexPath.section == 3){
       
        cell.imageView.image = [UIImage imageNamed:@"guanzhuxuexiao"];
        cell.textLabel.text = @"关注院校";
    
    
    }else if (indexPath.section == 4){
    
        cell.imageView.image = [UIImage imageNamed:@"guanzhuzhuanye"];
        cell.textLabel.text = @"关注专业";

    
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.textColor = [UIColor grayColor];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{

    return 5;
}

- (void)leftBarButtonItem
{

    [self.navigationController popViewControllerAnimated:YES];

}

@end
