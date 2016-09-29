//
//  JYSCViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYSCViewController.h"
#import "JYProviceScoreView.h"
#import "JYProvicerModel.h"
#import "JYProvicerScoreTableViewCell.h"
@interface JYSCViewController ()<UITableViewDataSource,UITableViewDelegate,CheckClickDelegate>

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,strong) UIView *head;

@property (nonatomic,strong) UILabel *label;

@end

static NSString *inder = @"ceLL";

@implementation JYSCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
    
}

- (void)setUI
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"省控线"];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    tableview.separatorStyle = UITableViewCellSelectionStyleNone;
    tableview.scrollEnabled = NO;
    tableview.showsVerticalScrollIndicator = NO;
    JYProviceScoreView *scoreview = [JYProviceScoreView loadNibView];
    tableview.tableHeaderView = scoreview;
    scoreview.delegate = self;
    scoreview.headView.hidden = YES;
    self.label = scoreview.label;
    self.head = scoreview.headView;

}

// MARK:-scoreView的代理方法
- (void)ckeckClicK:(UITextField *)cityfiled PICIFiled:(UITextField *)PICiFiled ISwl:(BOOL)ISwl
{
    self.tableview.scrollEnabled = YES;
    self.tableview.showsVerticalScrollIndicator = YES;
    self.head.hidden = NO;
    NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/score/province?city=1&batch=2&type=1&p=1&pageSize=20&p=1&pageSize=20"];
    urlstring = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
       
        NSArray *array = [JYProvicerModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"lsit"]];
        [self.DataArray removeAllObjects];
        [self.DataArray addObjectsFromArray:array];
        [self.tableview reloadData];
        
    }];
    
    if (ISwl) {
        
        self.label.text = [NSString stringWithFormat:@"%@ %@ %@ 省控线",cityfiled.text,@"文科",PICiFiled.text];
        
    }else{
    
         self.label.text = [NSString stringWithFormat:@"%@ %@ %@ 省控线",cityfiled.text,@"理科",PICiFiled.text];
    
    }
    
}

// MARK:-数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYProvicerScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYProvicerScoreTableViewCell" owner:nil options:nil]lastObject];
    }
    
    JYProvicerModel *model = self.DataArray[indexPath.row];
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
