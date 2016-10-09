
//
//  ZhiyuanTableView.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/8.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ZhiyuanTableView.h"
#import "ZhiyuanTableViewCellModel.h"
#import "ZhiyuanTableViewCell.h"

@interface ZhiyuanTableView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *DataArray;


@end

static NSString *inder = @"cell";

@implementation ZhiyuanTableView

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
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/service/comment?sid=6" parameters:nil callback:^(id responseObject, NSError *error) {
        
        NSArray *model = [ZhiyuanTableViewCellModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
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
    ZhiyuanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZhiyuanTableViewCell" owner:nil options:nil]lastObject];
    }
    
    ZhiyuanTableViewCellModel *model = self.DataArray[indexPath.row];
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
