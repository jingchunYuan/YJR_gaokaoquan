//
//  JYTutorMyGoldViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/11.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorMyGoldViewController.h"
#import "JYMyGoldView.h"
#import "JYTutorMyGoldModel.h"
#import "MBProgressHUD.h"
@interface JYTutorMyGoldViewController ()<UITableViewDataSource,UITableViewDelegate>

/// tableview
@property (nonatomic,strong) UITableView *tableview;

/// 存放数据的数组
@property (nonatomic,strong) NSMutableArray *DataArray;

@end

@implementation JYTutorMyGoldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:@"返回" target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"金币记录"];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tableview];
    
    self.tableview = tableview;
    
    tableview.rowHeight = 50;
    tableview.dataSource = self;
    tableview.delegate = self;
    
    // 复用学生的我的金币界面
    JYMyGoldView *GoldView = [[JYMyGoldView alloc]init];
    
    //    GoldView.frame = CGRectMake(0, 0, KWIDTH, 120);
    
    tableview.tableHeaderView = GoldView;
    
    
    // 先取得前20条数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/score?p=1&pageSize=20" parameters:nil callback:^(id responseObject, NSError *error) {
        
        // 将字典数组直接转为模型数组
        
        NSArray *array = [JYTutorMyGoldModel  mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        for (JYTutorMyGoldModel *GoldModel in array) {
            
            [self.DataArray addObject:GoldModel];
            
        }
        
        // 刷新tableview
        [self.tableview reloadData];
        
        
    }];
    
    
    // 设置上拉加载
    self.tableview.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        // 去加载数据
        [self updata];
        
    } ];
    
    
    
    
    
}

// MARK:-加载数据
- (void)updata
{
    
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/score?p=1&pageSize=20" parameters:nil callback:^(id responseObject, NSError *error) {
        
        
        NSArray *array = [JYTutorMyGoldModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        
        for (JYTutorMyGoldModel *model in array) {
            
            
            [self.DataArray addObject:model];
            
        }
        
        [self.tableview reloadData];
        
        // 加载成功停止加载
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


- (void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

// MARK:-数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *inder = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:inder];
        
    }
    
    JYTutorMyGoldModel *model = self.DataArray[indexPath.row];
    
    cell.textLabel.text = model.title;
    
    cell.detailTextLabel.text = model.ctime;
    
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    cell.detailTextLabel.font = [UIFont systemFontOfSize:8];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    label.font = [UIFont boldSystemFontOfSize:9];// 加粗
    
    label.text = model.gold;
    
    label.textColor = [UIColor colorWithRed:49/255.0 green:128/255.0 blue:50/255.0 alpha:1];
    
    cell.accessoryView = label;
    
    
    return cell;
}

// MARK:-懒加载数组
- (NSMutableArray *)DataArray
{
    if (_DataArray == nil) {
        
        _DataArray = [NSMutableArray array];
    }
    return _DataArray;
}


@end
