//
//  JYRCCSEDetailViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYRCCSEDetailViewController.h"
#import "JYRCCSEViewController.h"
#import "JYGeneralSchoolViewController.h"
#import "JYIndependentSchoolViewController.h"
#import "JYJunjorCollegeViewController.h"
@interface JYRCCSEDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation JYRCCSEDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

- (void)setUI
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"RCCSE详细榜单"];
 
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.rowHeight = 44;
    [self.view addSubview:tableview];
}

// MARK:-数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(50, 10, 22, 22)];
    [cell.contentView addSubview:image];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(80, 12, 100, 20)];
    label.font = [UIFont systemFontOfSize:15];
    [cell.contentView addSubview:label];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        image.image = [UIImage imageNamed:@"zongbangdan"];
        label.text = @"总榜单";
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
    
        image.image = [UIImage imageNamed:@"zhongdiandaxue"];
        label.text = @"重点大学";
        
    }else if (indexPath.section == 2 && indexPath.row == 0){
    
        image.image = [UIImage imageNamed:@"yibandaxue"];
        label.text = @"一般大学";
     
    }else if (indexPath.section == 3 && indexPath.row == 0){
    
        image.image = [UIImage imageNamed:@"dulixueyuan"];
        label.text = @"独立学院";
    
    }else if (indexPath.section == 4 && indexPath.row == 0){
    
        image.image = [UIImage imageNamed:@"zhuankexuexiao"];
        label.text = @"专科学校";
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        JYRCCSEViewController *rccse = [[JYRCCSEViewController alloc]init];
        [self.navigationController pushViewController:rccse animated:YES];
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
        
        JYRCCSEViewController *rccse = [[JYRCCSEViewController alloc]init];
        [self.navigationController pushViewController:rccse animated:YES];
        
    }else if (indexPath.section == 2 && indexPath.row == 0){

    }else if (indexPath.section == 3 && indexPath.row == 0){
        
        JYIndependentSchoolViewController *indepent = [[JYIndependentSchoolViewController alloc]init];
        [self.navigationController pushViewController:indepent animated:YES];
        
    }else if (indexPath.section == 4 && indexPath.row == 0){
        
        JYJunjorCollegeViewController *junior = [[JYJunjorCollegeViewController alloc]init];
        [self.navigationController pushViewController:junior animated:YES];
        
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
