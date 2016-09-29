//
//  JYRCCSEViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYRCCSEViewController.h"
#import "JYRCCSEDetailViewController.h"
#import "JYRCCSEHeadView.h"
#import "JYRCCSETableViewCell.h"
#import "JYRCCSEModel.h"
#import "MBProgressHUD.h"
@interface JYRCCSEViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,assign) int page;

@end
static NSString *inder = @"cell";
@implementation JYRCCSEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    [self setUI];
}

- (void)setUI
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:nil highlightedImage:nil title:@"详细榜单" target:self action:@selector(rightBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"RCCSE"];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.dataSource = self;
    tableview.delegate = self;
    self.tableview = tableview;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
    
    // 加载headview
    JYRCCSEHeadView *headView = [JYRCCSEHeadView loadView];
    tableview.tableHeaderView = headView;
    
    // 加载数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/rank/rccse?p=1&pageSize=20" parameters:nil callback:^(id responseObject, NSError *error) {
       
        NSArray *array = [JYRCCSEModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
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
    NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/rank/rccse?p=%d&pageSize=20",self.page];

   [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
       

       NSArray *array = [JYRCCSEModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
       
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
    JYRCCSETableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYRCCSETableViewCell" owner:nil options:nil]lastObject];
    }
    
    JYRCCSEModel *model = self.DataArray[indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)rightBarButtonItemClick
{
    JYRCCSEDetailViewController *detail = [[JYRCCSEDetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
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
