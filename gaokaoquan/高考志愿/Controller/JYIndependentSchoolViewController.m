//
//  JYIndependentSchoolViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.
//
#import "MBProgressHUD.h"
#import "JYIndependentSchoolViewController.h"
#import "JYIndependentView.h"
#import "JYIndependentableViewCell.h"
#import "JYIndependentSchoolModel.h"
@interface JYIndependentSchoolViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,assign) int page;

@end

static NSString *inder = @"Cell";

@implementation JYIndependentSchoolViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.page = 1;
    [self setUI];
}

- (void)setUI
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"RCCSE"];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.dataSource = self;
    tableview.delegate = self;
    self.tableview = tableview;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];

    // 加载headview
    JYIndependentView *independ = [JYIndependentView loadView];
    tableview.tableHeaderView = independ;
    
    // 请求数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/rank/rccse?p=1&pageSize=20&type=4" parameters:nil callback:^(id responseObject, NSError *error) {
       
        NSArray *array = [JYIndependentSchoolModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        [self.DataArray addObjectsFromArray:array];
        [self.tableview reloadData];
        
    }];
    
    // 上拉加载
    tableview.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       
        [self updata];
        
    }];

}

- (void)updata
{
    self.page += 1;
    NSString *Urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/rank/rccse?p=%d&pageSize=20&type=4",self.page];
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:Urlstring parameters:nil callback:^(id responseObject, NSError *error) {
       
        NSArray *array = [JYIndependentSchoolModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        [self.DataArray addObjectsFromArray:array];
        [self.tableview reloadData];
        [self.tableview.footer endRefreshing];
        
        if (error != nil) {
            
            [self.tableview.footer endRefreshing];
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"您的网络不给力!";
            [hud hide: YES afterDelay: 2];
        }

    }];

}
// MARK:-数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    JYIndependentableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYIndependentableViewCell" owner:nil options:nil]lastObject];
    }
    
    JYIndependentSchoolModel *model = self.DataArray[indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSMutableArray *)DataArray
{
    if (_DataArray == nil) {
        
        _DataArray = [NSMutableArray array];
    }
    return _DataArray;
}

- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
