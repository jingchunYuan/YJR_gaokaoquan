//
//  JYLnviteViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.

#import "JYLnviteViewController.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "JYLnviteModel.h"
#import "JYLnviteview.h"
#import "JYLnviteCountModel.h"
@interface JYLnviteViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,strong) NSMutableArray *Count;

@end
@implementation JYLnviteViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"邀请注册"];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.view addSubview:tableview];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    
    JYLnviteview *Head = [[[NSBundle mainBundle]loadNibNamed:@"JYLnviteview" owner:nil options:nil]lastObject];
    
    tableview.tableHeaderView = Head;
    
   
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/recomreg?p=1&pageSize=20" parameters:nil callback:^(id responseObject, NSError *error) {
    
        
        JYLnviteCountModel *countModel = [JYLnviteCountModel mj_objectWithKeyValues:responseObject[@"data"]];
        
        [self.Count addObject:countModel];
        
        
        
        
//        NSArray *arr = countModel.list;
        [self.DataArray addObjectsFromArray:countModel.list];
        
//        for (JYLnviteModel *model in arr) {
//            
//            [self.DataArray addObject:model];
//            
//        }
        
        [tableview reloadData];
        

    }];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
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
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:inder];
    }
    
    
    JYLnviteModel *model = self.DataArray[indexPath.row];
    
    
    cell.textLabel.text = model.true_name;
    
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    
    label.font = [UIFont systemFontOfSize:12];
    
    label.text = model.reg_time;
    
    cell.accessoryView = label;
    
    return cell;
}

// MARK:-设置section文字

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (self.Count.count ==  0) {
      return @"";
    }
    
     JYLnviteCountModel *count = self.Count[section];
    
    return  [NSString stringWithFormat:@"我的邀请记录 共%tu条",count.count];
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

- (NSMutableArray *)Count
{
    if (_Count == nil) {
        
        
        _Count = [NSMutableArray array];
        
    }
    
    
    return _Count;
}


@end
