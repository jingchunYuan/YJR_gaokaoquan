//
//  JYGeneralSchoolViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/22.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYGeneralSchoolViewController.h"
#import "JYRCCSEHeadView.h"
#import "MBProgressHUD.h"
#import "JYGeneralSchoolModel.h"
#import "JYRCCSETableViewCell.h"
@interface JYGeneralSchoolViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,assign) int page;

@end
static NSString *inder = @"cell";
@implementation JYGeneralSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.page = 1;
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
    
    // 加载headview(复用RCCSE的headview)
    JYRCCSEHeadView *headView = [JYRCCSEHeadView loadView];
    tableview.tableHeaderView = headView;

    // 加载数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/rank/rccse?p=1&pageSize=20&type=3" parameters:nil callback:^(id responseObject, NSError *error) {
        
        NSArray *array = [JYGeneralSchoolModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        [self.DataArray addObjectsFromArray:array];
        [tableview reloadData];
        
    }];
    
    // 上拉加载
    tableview.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self updata];
        
    }];


}

// MARK:-上拉加载数据
- (void)updata
{
    self.page++;
    NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/rank/rccse?p=%d&pageSize=20&type=3",self.page];
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
        
        
        NSArray *array = [JYGeneralSchoolModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
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
    // 复用RCCSE的cell
    JYRCCSETableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYRCCSETableViewCell" owner:nil options:nil]lastObject];
    }
    
    JYRCCSEModel *model = self.DataArray[indexPath.row];
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
