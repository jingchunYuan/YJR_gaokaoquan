//
//  JYGaoXiaoTableViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYGaoXiaoTableViewController.h"
#import "JYGaoXiaoView.h"
#import "JYGaoXiaoTableViewCell.h"
#import "JYGaoXiaoModel.h"
@interface JYGaoXiaoTableViewController ()<UITableViewDataSource,UITableViewDelegate,inqueClickDelegate>

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,strong) UIView *head;

@property (nonatomic,assign) int provice;

@property (nonatomic,assign) int PI;

@end

static NSString *inder = @"cell";

@implementation JYGaoXiaoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
 
}

- (void)setUI
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"高校分数线"];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    tableview.separatorStyle = UITableViewCellSelectionStyleNone;
    tableview.scrollEnabled = NO;
    tableview.showsVerticalScrollIndicator = NO;
    JYGaoXiaoView *Gaoxiao = [JYGaoXiaoView loadNibView];
    tableview.tableHeaderView = Gaoxiao;
    Gaoxiao.delegate = self;
    Gaoxiao.headview.hidden = YES;
    self.head = Gaoxiao.headview;
    
}

// MARK:-查询的点击代理事件
- (void)Cityfiled:(UITextField *)Cityfiled :(UITextField *)PiCiFiled :(UITextField *)SchoolFiled :(UILabel *)sectionLabel :(BOOL)isWL
{
      self.tableview.scrollEnabled = YES;
      self.tableview.showsVerticalScrollIndicator = YES;
      self.head.hidden = NO;
    if ([Cityfiled.text isEqualToString:@"北京"]) {
        self.provice = 1;
    }else if ([Cityfiled.text isEqualToString:@"上海"]){
      
    
    }else if ([Cityfiled.text isEqualToString:@"天津"]){
    
    }else if ([Cityfiled.text isEqualToString:@"重庆"]){
    
    
    }else if ([Cityfiled.text isEqualToString:@"河北"]){
    
    }else if ([Cityfiled.text isEqualToString:@"山西"]){
    
    }else if ([Cityfiled.text isEqualToString:@"内蒙古"]){
    
    }else if ([Cityfiled.text isEqualToString:@"辽宁"]){
    
    }else if ([Cityfiled.text isEqualToString:@"吉林"]){
        
    }else if ([Cityfiled.text isEqualToString:@"黑龙江"]){
        
    }else if ([Cityfiled.text isEqualToString:@"江苏"]){
        
    }else if ([Cityfiled.text isEqualToString:@"浙江"]){
        
    }else if ([Cityfiled.text isEqualToString:@"安徽"]){
        
    }else if ([Cityfiled.text isEqualToString:@"福建"]){
        
    }else if ([Cityfiled.text isEqualToString:@"江西"]){
        
    }else if ([Cityfiled.text isEqualToString:@"山东"]){
        
    }else if ([Cityfiled.text isEqualToString:@"河南"]){
        
    }else if ([Cityfiled.text isEqualToString:@"湖北"]){
        
    }else if ([Cityfiled.text isEqualToString:@"湖南"]){
        
    }else if ([Cityfiled.text isEqualToString:@"广东"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else if ([Cityfiled.text isEqualToString:@"北京"]){
        
    }else{
    
    
    }





















      NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/score?source=1&batch=2&q=&type=1&p=1&pageSize=20"];
      urlstring = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
      [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
        
          NSArray *array = [JYGaoXiaoModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
          [self.DataArray removeAllObjects];
          [self.DataArray addObjectsFromArray:array];
          [self.tableview reloadData];
          
      }];
    
    if (isWL) {
        
        sectionLabel.text = [NSString stringWithFormat:@"%@ %@ %@ 省控线",Cityfiled.text,@"文科",PiCiFiled.text];
        
    }else{
    
        sectionLabel.text = [NSString stringWithFormat:@"%@ %@ %@ 省控线",Cityfiled.text,@"理科",PiCiFiled.text];
        
    }
    
}

// MARK:-tableview数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYGaoXiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYGaoXiaoTableViewCell" owner:nil options:nil]lastObject];
    }
    
    JYGaoXiaoModel *model = self.DataArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)leftBarButtonItemClick
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
