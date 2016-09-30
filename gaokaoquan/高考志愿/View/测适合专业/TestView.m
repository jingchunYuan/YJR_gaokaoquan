//
//  TestView.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TestView.h"
#import "TestTableViewCell.h"
#import "TestTableCellModel.h"

@interface TestView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *DataArray;


@end

static NSString *inder = @"cell";

@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.dataSource = self;
        self.delegate = self;
        [self loadData];
        self.rowHeight = 70;
        
    }
    return self;
}

- (void)loadData
{
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/service/comment?sid=5" parameters:nil callback:^(id responseObject, NSError *error) {
        
        NSArray *model = [TestTableCellModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        [self.DataArray addObjectsFromArray:model];
        [self reloadData];
        
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TestTableViewCell" owner:nil options:nil]lastObject];
    }
    
    TestTableCellModel *model = self.DataArray[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (NSMutableArray *)DataArray
{
    if (_DataArray == nil) {
        
        _DataArray = [NSMutableArray array];
    }
    return _DataArray;
}


@end
