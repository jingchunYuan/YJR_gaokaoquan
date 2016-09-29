//
//  JYMyExperienceController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMyExperienceController.h"
#import "JYMyExperienceView.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "JYMyExperienceModel.h"
#import "MBProgressHUD.h"
@interface JYMyExperienceController()<UITableViewDataSource,UITableViewDelegate>
/// 存储数据
@property (nonatomic,strong) NSMutableArray *DataArray;

/// tableview
@property (nonatomic,strong) UITableView *tableview;

@end


@implementation JYMyExperienceController

static NSString *Inder = @"cell";

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"经验记录"];
    
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tableview];
    
    self.tableview = tableview;
    
    tableview.rowHeight = 50;
    tableview.dataSource = self;
    tableview.delegate = self;

    
    JYMyExperienceView *ExperienceView = [[JYMyExperienceView alloc]init];
    
//    ExperienceView.frame = CGRectMake(0, 0, KWIDTH, 120);
    
    tableview.tableHeaderView = ExperienceView;
    
    // 先取得前20条数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/exp?p=1&pageSize=20" parameters:nil callback:^(id responseObject, NSError *error) {
        
              
        NSMutableArray *Array = [JYMyExperienceModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        for (JYMyExperienceModel *model in Array) {
            
            [self.DataArray addObject:model];
            
        }
        
            [self.tableview reloadData];
        
    }];
    
    


    tableview.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self updateData];
        
    }];
    
    
    
    
}

// 更新界面
- (void)updateView
{

    [self.tableview reloadData];

}

// 刷新数据
- (void)updateData
{
   
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/exp?p=1&pageSize=20" parameters:nil callback:^(id responseObject, NSError *error) {
        
        NSArray *Array = [JYMyExperienceModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        for (JYMyExperienceModel *model in Array) {
        
            [self.DataArray addObject:model];
            
        }
        
         [self updateView];
        
        [self.tableview.footer endRefreshing];
        
        // 有错误提示用户
        if (error != nil) {
            
            [self endRefresh];
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            hud.mode = MBProgressHUDModeText;
            
            hud.labelText = @"您的网络不给力!";
            
            [hud hide: YES afterDelay: 2];
            
            
        }
        
        
    }];
    
}


// 停止刷新
- (void)endRefresh{
    
    [self.tableview.footer endRefreshing];
    
}
// MARK:-leftBarButtonItem点击
- (void)leftBarButtonItemClick
{
  
    [self.navigationController popViewControllerAnimated:YES];

}


// MARK:-数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Inder];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Inder];
    }
    
    JYMyExperienceModel *model = self.DataArray[indexPath.row];
    
    cell.textLabel.text = model.title;
    
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    cell.detailTextLabel.font = [UIFont systemFontOfSize:8];
    
    cell.detailTextLabel.text = model.ctime;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    label.font = [UIFont boldSystemFontOfSize:9];// 加粗
    
    label.text = model.exp;
    
    label.textColor = [UIColor colorWithRed:49/255.0 green:128/255.0 blue:50/255.0 alpha:1];
    
    cell.accessoryView = label;
    
    return cell;

}
// 懒加载数组
- (NSMutableArray *)DataArray
{
    if (_DataArray == nil) {
        
        
        _DataArray = [NSMutableArray array];
        
    }

    return _DataArray;
}


@end
