//
//  YinXiangView.m
//  gaokaoquan
//
//  Created by admin on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "YinXiangView.h"
#import "YinxiangCell.h"
#import "AddYinXiangView.h"


@interface YinXiangView ()<UITableViewDataSource,UITableViewDelegate,AddYinXiangViewDelegate> {
    
    UITableView *_tableView;
    NSArray *_dataArray;
    AddYinXiangView *_addYinXiangView;

}
@end

@implementation YinXiangView

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
    
    //印象数
    _addYinXiangView = [[AddYinXiangView alloc] init];
    _addYinXiangView.zj_height = 60;
    _addYinXiangView.delegate = self;
    
    // 添加_tableView
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"YinxiangCell" bundle:nil] forCellReuseIdentifier:@"YinxiangCell"];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView setTableHeaderView:_addYinXiangView];
    [self addSubview:_tableView];
    
}

- (void)layoutSubviews {
    //刷新数据
    _tableView.frame = CGRectMake(0, 0, self.zj_width, self.zj_height+60);
    [_tableView reloadData];
}

#pragma mark - 
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cellId = @"YinxiangCell";
    YinxiangCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[YinxiangCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // 设置cell
    NSDictionary *model = _dataArray[indexPath.row];
    cell.dictModel = model;
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

// 刷新数据
- (void)setYinXiangArr:(NSArray *)yinXiangArr {
    _dataArray = yinXiangArr;
    //刷新数据
    [_tableView reloadData];
    
}

- (void)setCount:(NSNumber *)count {
    _count = count;
}

#pragma mark - 
#pragma mark - AddYinXiangViewDelegate
- (void)addYinXiangButtonClick:(AddYinXiangView *)addYinXiangView {
    
    if ([self.delegate respondsToSelector:@selector(yinXiangViewWithAddYinXiangMethod:)]) {
        [self.delegate yinXiangViewWithAddYinXiangMethod:self];
    }
    
}


@end
