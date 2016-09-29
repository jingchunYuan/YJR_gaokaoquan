//
//  JTSchoolFirendViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.


#import "JTSchoolFirendViewController.h"
#import "JYSchoolFirendView.h"
#import "JYSchoolFriendTableViewCell.h"
#import "JYSchoolFriendModel.h"
#import "MBProgressHUD.h"
@interface JTSchoolFirendViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,assign) int page;

@end

static NSString *inder = @"identify";

@implementation JTSchoolFirendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)setUI
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"中国校友会榜单"];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.dataSource = self;
    tableview.delegate = self;
    self.tableview = tableview;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    // 设置headview
    JYSchoolFirendView *school = [JYSchoolFirendView loadView];
    tableview.tableHeaderView = school;
    
    // 发送请求
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/rank/xyh?p=1&pageSize=20" parameters:nil callback:^(id responseObject, NSError *error) {
       
        NSArray *array = [JYSchoolFriendModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        for (JYSchoolFriendModel *model in array) {
            
            [self.DataArray addObject:model];
        }
            [self.tableview reloadData];
    }];
    
    // 上拉加载
    tableview.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self updata];
        
    }];

    
    
    
}

- (void)updata
{
    self.page++;
    NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/rank/xyh?p=%d&pageSize=20",self.page];
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
        
        NSArray *array = [JYSchoolFriendModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYSchoolFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYSchoolFriendTableViewCell" owner:nil options:nil]lastObject];
    }
    
    JYSchoolFriendModel *model = self.DataArray[indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
