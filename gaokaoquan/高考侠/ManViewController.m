//
//  ManViewController.m
//  gaokaoquan
//
//  Created by 程伟利 on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ManViewController.h"
#import "manTableViewCell.h"
#import "ManModel+Request.h"
#import "KSHttpManager.h"
#import "MBProgressHUD.h"
#import "TecherViewController.h"
#import "CustomTextField.h"

@interface ManViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    UITableView  *_tableView;
    NSMutableArray  *_dataArray;
    UIView *_searchView;
    CustomTextField *_textField;
    UIButton *_searchBtn;
    BOOL _firstFlag;
    NSString *_searchKeyword;
}
@property (nonatomic, strong) MBProgressHUD *HDView;//加载指示器
@end

@implementation ManViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"学长学姐";
    // 初始化数组
    _dataArray = [NSMutableArray array];
    _firstFlag = YES;
    // 搭建UI
    [self layoutUI];
    //请求数据
    [self requestData];
}

-(void)layoutUI {
    
    [self kkb_customLeftNarvigationBarWithTitle:@"搜索"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //表格试图
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [_tableView registerNib:[UINib nibWithNibName:@"manTableViewCell" bundle:nil] forCellReuseIdentifier:@"manCell"];
    _tableView.backgroundColor = VIEWCONTROLLERBGCOLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //添加下拉刷新功能
    __weak ManViewController * weakSelf = self;
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    //添加上拉加载更多数据
    _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    [self.view addSubview:_tableView];

}

- (void)createSearchUIView {
    //搜索框
    _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
    _searchView.backgroundColor = VIEWCONTROLLERBGCOLOR;
    [self.view addSubview:_searchView];
    
    _textField = [[CustomTextField alloc] initWithFrame:CGRectMake(40, 20, (SCREEN_WIDTH-80), 30)];
    _textField.placeholder = @"请输入关键词..";
    _textField.font = [UIFont systemFontOfSize:12.0];
    _textField.layer.cornerRadius = 13.0;
    _textField.layer.masksToBounds = YES;
    _textField.layer.borderWidth = 0.3;
    _textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_searchView addSubview:_textField];
    
    _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchBtn.frame = CGRectMake(SCREEN_WIDTH-90, 20, 50, 30);
    [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    _searchBtn.tintColor = [UIColor whiteColor];
    _searchBtn.backgroundColor = NAVAGATIONCOLOR;
    _searchBtn.layer.cornerRadius = 12.0;
    _searchBtn.layer.masksToBounds = YES;
    [_searchBtn addTarget:self action:@selector(searchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _searchBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
    [_searchView addSubview:_searchBtn];
}

- (void)searchBtnClick:(UIButton *)sender {

    __weak ManViewController * weakSelf = self;
    if ([_textField.text length]) {
        //有输入内容
        _searchKeyword = _textField.text;
        [self requestData];
        //隐藏顶部试图
        _firstFlag = YES;
        [_tableView.tableHeaderView removeFromSuperview];
        UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView setTableHeaderView:view];
    }else {
        [weakSelf refreshData];
        //隐藏顶部试图
        _firstFlag = YES;
        [_tableView.tableHeaderView removeFromSuperview];
        UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView setTableHeaderView:view];
    }
}

#pragma mark - 重写父类方法，搜索
- (void)backBtnTapped {
    if (_firstFlag) {
        _firstFlag = NO;
        //设置
        [self createSearchUIView];
        [_tableView setTableHeaderView:_searchView];
    }else {
        //清除数据
        _searchKeyword = nil;
        _firstFlag = YES;
        [_tableView.tableHeaderView removeFromSuperview];
        UIView * view = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView setTableHeaderView:view];
    }
}

//下拉刷新
-(void)refreshData
{
    //重整数据
    _searchKeyword = nil;
    self.page = 1;
    [self requestData];
}
//上拉加载更多
-(void)loadMoreData
{
    self.page ++;
    [self requestData];
}
#pragma mark - 请求数据
-(void)requestData
{
    __weak ManViewController * weakSelf = self;
    [super loadData];
    
    NSString * url =@"http://api.dev.gaokaoq.com/advisor/lists";
    NSDictionary * para = @{
                            @"p":@(weakSelf.page),
                            @"pageSize":@20,
                            @"city":@1,
                            @"q":_searchKeyword?_searchKeyword:@"北京"
                            };
    [ManModel RequestWithUrl:url andPara:para andCallBack:^(NSArray *arr, NSError *err) {
        if (!err) {
            if (weakSelf.page == 1) {
                [_dataArray removeLastObject];
            }
            [_dataArray addObjectsFromArray:arr];
            [_tableView reloadData];
            
        }else{
            NSLog(@"%@",err.domain);
        }
        [weakSelf stopLoadData];
    }];
}

-(void)stopLoadData{
    [super stopLoadData];
    [_tableView.header endRefreshing];
    [_tableView.footer endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId = @"manCell";
    manTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[manTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellId];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    //设置cell
    [cell setModel:_dataArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ManModel *model = _dataArray[indexPath.row];
    NSLog(@"model.uid = %@", model.uid);
    
    TecherViewController *VC = [[TecherViewController alloc] init];
    VC.uid = model.uid;
    VC.true_name = model.true_name;
    [self.navigationController pushViewController:VC animated:YES];
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(MBProgressHUD *)HDView
{
    if (!_HDView) {
        _HDView = [[MBProgressHUD alloc]initWithView:self.view];
        _HDView.labelText = @"正在加载...";
    }
    return _HDView;
}
@end
