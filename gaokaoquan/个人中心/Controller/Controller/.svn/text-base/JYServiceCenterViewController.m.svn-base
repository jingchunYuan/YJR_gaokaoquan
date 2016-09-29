//
//  JYServiceCenterViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.

#import "JYServiceCenterViewController.h"
#import "JYServiceView.h"
#import "JYMyServiceModel.h"
#import "MJExtension.h"
#import "JYMYServiceTableViewCell.h"
#import "JYMyServiceFootView.h"
@interface JYServiceCenterViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *DataArray;

@end
@implementation JYServiceCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"剩余次数"];
  
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tableview];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    
    JYServiceView *service = [[[NSBundle mainBundle]loadNibNamed:@"JYServiceView" owner:nil options:nil]lastObject];
    
    tableview.tableHeaderView = service;
    
    JYMyServiceFootView *footView = [[[NSBundle mainBundle]loadNibNamed:@"JYMyServiceFootView" owner:nil options:nil]lastObject];
    
    tableview.tableFooterView = footView;
    
    
    tableview.rowHeight = 55;
    
    tableview.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    tableview.separatorColor = [UIColor darkGrayColor];
    
    
    // 请求数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/times" parameters:nil callback:^(id responseObject, NSError *error) {
       
        
        NSArray *array = [JYMyServiceModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"times"]];
        
        for (JYMyServiceModel *model in array) {
            
            [self.DataArray addObject:model];
            
        }
        
        [tableview reloadData];
        
        
        
    }];
    
    
    
}


// MARK:-数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYMYServiceTableViewCell *cell = [[JYMYServiceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];


    cell = [[[NSBundle mainBundle]loadNibNamed:@"JYMYServiceTableViewCell" owner:nil options:nil]lastObject];
   
    // 改变分割线的位置
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    
    JYMyServiceModel *model = self.DataArray[indexPath.row];
    
    cell.model = model;
    


    return cell;
}


-(void)leftBarButtonItemClick
{

    [self.navigationController popViewControllerAnimated:YES];
   

}


- (NSMutableArray *)DataArray
{
    if (_DataArray == nil) {
        
        _DataArray = [NSMutableArray array];
        
    }
  

    return _DataArray;
}

@end
