//
//  DongTaiView.m
//  gaokaoquan
//
//  Created by admin on 16/9/6.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "DongTaiView.h"
#import "DongTaiCell.h"

@interface DongTaiView ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *_tableView;
    NSArray *_dataArray;
}
@end

@implementation DongTaiView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadNibName];
    }
    return self;
}

- (void)loadNibName {
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
    view.frame = self.bounds;
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    
    // 添加_tableView
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"DongTaiCell" bundle:nil] forCellReuseIdentifier:@"DongTaiCell"];
    _tableView.backgroundColor = [UIColor clearColor];
    [self addSubview:_tableView];
}

- (void)layoutSubviews {
    //刷新数据
    _tableView.frame = self.bounds;
    [_tableView reloadData];
}

#pragma mark -
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"DongTaiCell";
    DongTaiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[DongTaiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    // 设置cell
    NSDictionary *model = _dataArray[indexPath.row];
    cell.dictModel = model;
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 40;
    
}

// 刷新数据
- (void)setDongTaiArr:(NSArray *)dongTaiArr {
    _dataArray = dongTaiArr;
    [_tableView reloadData];
}

@end
