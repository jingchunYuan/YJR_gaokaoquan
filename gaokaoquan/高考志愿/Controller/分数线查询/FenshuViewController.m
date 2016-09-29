
//
//  FenshuViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.


#import "FenshuViewController.h"
#import "JYGaoXiaoTableViewController.h"
#import "JYScoreViewController.h"
#import "JYSCViewController.h"
@interface FenshuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonnull,strong) UITableView *tableview;


@end

@implementation FenshuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    
}

-(void)createUI{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"分数线查询"];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.rowHeight = 40;
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
        
        cell.textLabel.text = @"高校分数线";
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
        
        cell.textLabel.text = @"专业分数线";
        
    }else if (indexPath.section == 2 && indexPath.row == 0){
        
        cell.textLabel.text = @"省控线";
        
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
        
        JYGaoXiaoTableViewController *gaoxiao = [[JYGaoXiaoTableViewController alloc]init];
        [self.navigationController pushViewController:gaoxiao animated:YES];
        
    }else if (indexPath.section == 1 && !indexPath.row){
        
        JYScoreViewController *score = [[JYScoreViewController alloc]init];
        [self.navigationController pushViewController:score animated:YES];
        
           }else if (indexPath.section == 2 && !indexPath.row){
        
               JYSCViewController *PR = [[JYSCViewController alloc]init];
               [self.navigationController pushViewController:PR animated:YES];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
