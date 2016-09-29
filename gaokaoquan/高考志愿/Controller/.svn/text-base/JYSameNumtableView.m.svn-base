//
//  JYSameNumtableView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYSameNumtableView.h"
#import "JYSameTableviewCellModel.h"
#import "JYSameNumTableViewCell.h"
@interface JYSameNumtableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *DataArray;

@end

static NSString *inder = @"cell";

@implementation JYSameNumtableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.dataSource = self;
        self.delegate = self;
        [self loadData];
         self.rowHeight = UITableViewAutomaticDimension;
        
    }
    return self;
}

- (void)loadData
{
   [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/service/comment?sid=4" parameters:nil callback:^(id responseObject, NSError *error) {
      
       NSArray *model = [JYSameTableviewCellModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
       
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
    JYSameNumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYSameNumTableViewCell" owner:nil options:nil]lastObject];
    }
    
    JYSameTableviewCellModel *model = self.DataArray[indexPath.row];
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
