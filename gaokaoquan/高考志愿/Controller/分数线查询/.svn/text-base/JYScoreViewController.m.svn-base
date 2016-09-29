//
//  JYScoreViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYScoreViewController.h"
#import "JYScoreMajorView.h"
#import "JYScoreModel.h"
#import "JYScoreTableViewCell.h"
@interface JYScoreViewController ()<UITableViewDataSource,UITableViewDelegate,checkClickDelegate>

@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,strong) UIView *Head;

@property (nonatomic,strong) UILabel *label;

@end

static NSString *inder = @"cell";

@implementation JYScoreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"专业分数线"];
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.dataSource = self;
    tableview.delegate = self;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    tableview.separatorStyle = UITableViewCellSelectionStyleNone;
    tableview.scrollEnabled = NO;
    tableview.showsVerticalScrollIndicator = NO;
    JYScoreMajorView *scoremajor = [JYScoreMajorView loadNibView];
    tableview.tableHeaderView = scoremajor;
    self.Head = scoremajor.headview;
    self.label = scoremajor.label;
    scoremajor.headview.hidden = YES;
    scoremajor.delegate = self;
}

// MARK:-scoremajor代理方法
- (void)WLFiled:(UITextField *)WLFiled :(UITextField *)CityFiled :(UITextField *)PICIFiled :(UITextField *)yearTextFiled :(UITextField *)schoolFiled
{
    if ([schoolFiled.text isEqualToString:@""]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"http://www.gaokaoq.com" message:@"请输入高校名称" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }else{

       self.tableview.scrollEnabled = YES;
       self.tableview.showsVerticalScrollIndicator = YES;
       self.Head.hidden = NO;
        NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/scores/major?type=2&city=1&batch=2&year=2015&college=%@&p=1&pageSize=20&p=1&pageSize=20",schoolFiled.text];
    urlstring = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
       
        NSArray *array = [JYScoreModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        [self.DataArray removeAllObjects];
        [self.DataArray addObjectsFromArray:array];
        [self.tableview reloadData];
        self.label.text = [NSString stringWithFormat:@"%@ %@ %@ 专业分数线",CityFiled.text,WLFiled.text,PICIFiled.text];
        
    }];
        
        [schoolFiled resignFirstResponder];

    }
}

// MARK:-数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JYScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYScoreTableViewCell" owner:nil options:nil]lastObject];
        
    }
    JYScoreModel *model = self.DataArray[indexPath.row];
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
