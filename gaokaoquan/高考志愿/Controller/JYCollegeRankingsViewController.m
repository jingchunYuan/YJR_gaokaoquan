//
//  JYCollegeRankingsViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYCollegeRankingsViewController.h"
#import "JYRCCSEViewController.h"
#import "JYKongfuViewController.h"
#import "JTSchoolFirendViewController.h"
@interface JYCollegeRankingsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonnull,strong) UITableView *tableview;

@end

@implementation JYCollegeRankingsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"大学排名"];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.rowHeight = 60;
    [self.view addSubview:tableview];
}

// MARK:-数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (!indexPath.section && !indexPath.row ) {
        
    cell.textLabel.text = @"RCCSE排行榜单";
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
    
    cell.textLabel.text = @"武书连榜单";
        
    }else if (indexPath.section == 2 && indexPath.row == 0){
    
    cell.textLabel.text = @"校友会榜单";
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath.section && !indexPath.row ) {
        
        JYRCCSEViewController *RCCSE = [[JYRCCSEViewController alloc]init];
        [self.navigationController pushViewController:RCCSE animated:YES];
    
    }else if (indexPath.section == 1 && !indexPath.row){
    
        JYKongfuViewController *kongfu = [[JYKongfuViewController alloc]init];
        [self.navigationController pushViewController:kongfu animated:YES];
         
    }else if (indexPath.section == 2 && !indexPath.row){
    
        JTSchoolFirendViewController *school = [[JTSchoolFirendViewController alloc]init];
        [self.navigationController pushViewController:school animated:YES];
       
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

@end
