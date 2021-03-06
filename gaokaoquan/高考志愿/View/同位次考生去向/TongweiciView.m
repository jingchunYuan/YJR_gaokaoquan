
//
//  TongweiciView.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TongweiciView.h"
#import "TongweiciTableViewCell.h"
#import "TongweiciTableCellModel.h"

@interface TongweiciView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *DataArray;

@end

static NSString *inder = @"cell";


@implementation TongweiciView

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
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/service/comment?sid=3" parameters:nil callback:^(id responseObject, NSError *error) {
        
        NSArray *model = [TongweiciTableCellModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
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
    TongweiciTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TongweiciTableViewCell" owner:nil options:nil]lastObject];
    }
    
    TongweiciTableCellModel *model = self.DataArray[indexPath.row];
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
