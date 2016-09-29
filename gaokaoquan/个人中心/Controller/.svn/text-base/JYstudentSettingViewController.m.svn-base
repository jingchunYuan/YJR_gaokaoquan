                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         //
//  JYstudentSettingViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYstudentSettingViewController.h"
// 复用导师设置界面
#import "JYChangePasswordController.h"
#import "JYFeedbackViewController.h"
@interface JYstudentSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation JYstudentSettingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"设置"];

    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];

}

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
    
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            cell.textLabel.text = @"意见反馈";
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            
            
            cell.textLabel.text = @"更改密码";
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
    
    }else if (indexPath.section == 2){
        
        
        if (indexPath.row == 0) {
            
        
    
        tableView.rowHeight = 80;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(20, 20, KWIDTH - 2 * 20, 30);
        
        [button setTitle:@"退出登录" forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        button.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
        
        [cell addSubview:button];
            
            [button addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        }
    
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{


    return 2;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
  
    if (section == 3) {
        
        return 0;
        
    }else{
    
    
        return 2;
    }

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            JYFeedbackViewController *feedback = [[JYFeedbackViewController alloc]init];
            
            [self.navigationController pushViewController:feedback animated:YES];
            
        }
        
    }else if(indexPath.section == 1){
    
        if (indexPath.row == 0) {
            
            JYChangePasswordController *pass = [[JYChangePasswordController alloc]init];
            
            [self.navigationController pushViewController:pass animated:YES];
           
        }
    
    }

}

- (void)ButtonClick:(UIButton *)btn
{

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"http://m.gaokaoq.com" message:@"确认退出" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"退出成功");
        
        
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

- (void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];


}

@end
