//
//  CollegeYinxiangView.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/28.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeYinxiangView.h"
#import "CollegeYinxiangCell.h"

@interface CollegeYinxiangView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_dataArray;
    
}

@end

@implementation CollegeYinxiangView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self loadNibName];
    }
    return self;
}

-(void)loadNibName {
    UIView *view = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil]lastObject];
    view.frame = self.bounds;
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
    
    //添加_tableVeiw
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"CollegeYinxiangCell" bundle:nil] forCellReuseIdentifier:@"CollegeYinxiangCell"];
    _tableView.backgroundColor = [UIColor clearColor];
    [self addSubview:_tableView];
    
}

- (void)layoutSubviews {
    //刷新数据
    _tableView.frame = CGRectMake(0, 0, self.zj_width, self.zj_height+60);
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"CollegeYinxiangCell";
    CollegeYinxiangCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[CollegeYinxiangCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
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

//刷新数据
-(void)setYinxiangArr:(NSArray *)yinxiangArr {
    
    _dataArray = yinxiangArr;
    //刷新数据
    [_tableView reloadData];
    
}
-(void)setCount1:(NSNumber *)count1
{
    _count1 = count1;
}

@end
