//
//  JYLectureViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYLectureViewController.h"
#import "JYLectureTableViewCell.h"
#import "JYLectureModel.h"
#import "MJExtension.h"
@interface JYLectureViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *DataArray;

@end
@implementation JYLectureViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"我的报告"];
    
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];

    
    [self.view addSubview:tableview];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    tableview.rowHeight = 70;
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/repot" parameters:nil callback:^(id responseObject, NSError *error) {
       
        NSArray *array = [JYLectureModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        
        for (JYLectureModel *model in array) {
            
            [self.DataArray addObject:model];
            
        }
        
        [tableview reloadData];
        
    }];
    
    
}


// MARK:-数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{


    return self.DataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
       static NSString *inder = @"cell";
    
    JYLectureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYLectureTableViewCell" owner:nil options:nil]lastObject];
            
     }

    [cell seeReport:^{
       
        NSLog(@"查看报告");
        
        
    }];
    
    // 取消cell的选中样式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    JYLectureModel *model = self.DataArray[indexPath.section];
    
    cell.Model = model;
    
    return cell;
}

// MARK:-调整section之间的间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{


    return 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"点击了cell");

}

- (NSMutableArray *)DataArray
{
    if (_DataArray == nil) {
        
        
        _DataArray = [NSMutableArray array];
    }

    return _DataArray;
}

-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

@end
