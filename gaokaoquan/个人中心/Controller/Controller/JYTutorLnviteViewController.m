//
//  JYTutorLnviteViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/11.
//  Copyright © 2016年 袁静茹. All rights reserved.
// http://api.dev.gaokaoq.com/AdvisorCenter/recomReg

#import "JYTutorLnviteViewController.h"
#import "JYLnviteview.h"
#import "JYTutorLnviteModel.h"
#import "JYTutorCountModel.h"
@interface JYTutorLnviteViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,strong) NSMutableArray *Count;

@end

@implementation JYTutorLnviteViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"邀请注册"];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.view addSubview:tableview];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
     // 复用学生的邀请注册headview
    
    JYLnviteview *Head = [[[NSBundle mainBundle]loadNibNamed:@"JYLnviteview" owner:nil options:nil]lastObject];
    
    tableview.tableHeaderView = Head;
    
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/AdvisorCenter/recomReg" parameters:nil callback:^(id responseObject, NSError *error) {
        
        
        JYTutorCountModel *countModel = [JYTutorCountModel mj_objectWithKeyValues:responseObject[@"data"]];
        
        [self.Count addObject:countModel];
        
        [self.DataArray addObjectsFromArray:countModel.list];
        
        
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
    
    
    JYTutorLnviteModel *model = self.DataArray[indexPath.row];
    
    
    cell.textLabel.text = model.true_name;
    
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
    
    label.font = [UIFont systemFontOfSize:12];
    
    label.text = model.reg_time;
    
    cell.accessoryView = label;
    
    
    // 取消cell的点击模式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

// MARK:-设置section文字

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (self.Count.count ==  0) {
        
        return @"";
    }
    
    JYTutorCountModel *count = self.Count[section];
    
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
