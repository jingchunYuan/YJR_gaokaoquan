
//
//  GaoXiaoCollgeViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoXiaoCollgeViewController.h"
#import "GaoxiaochaxunModel.h"
#import "GaoxiaochaxunModel+Request.h"
#import "UniversitySearchCell.h"
#import "UniversityViewController.h"


@interface GaoXiaoCollgeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * dataArr;

@end

@implementation GaoXiaoCollgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //创建UI
    [self layoutUI];
    //加载数据
    [self loadData];
    
    
}

-(void)layoutUI{
    self.navigationItem.title = @"高校查询";
    self.navigationItem.leftBarButtonItem= [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem= [UIBarButtonItem initWithImageName:@"搜索" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    //添加表格试图
    [self.view addSubview:self.tableView];
}

-(void)loadData{
    
    //提示加载
    [super loadData];
    //网络数据请求
    [GaoxiaochaxunModel RequestWithUrl:_url andPara:@{@"p":@(self.page),@"pageSize":@"20"} andCallBack:^(NSArray *arr, NSError *err) {
        if (!err) {
            [_dataArr addObjectsFromArray:arr];
            [self.tableView reloadData];
            [super stopLoadData];
        }else{
            NSLog(@"%@",err.domain);
        }
    }];
}

#pragma mark - 
#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"UniversitySearchCell";
    UniversitySearchCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (!cell) {
        cell = [[UniversitySearchCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UniversitySearchCell"];
    }
    [cell setModel:self.dataArr[indexPath.row]];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UniversityViewController * uniVC = [[UniversityViewController alloc]init];
    uniVC.university = _dataArr[indexPath.row];
    [self.navigationController pushViewController:uniVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftBarButtonItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 
#pragma mark - Getter and Setter 
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

- (UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = VIEWCONTROLLERBGCOLOR;
        [_tableView registerNib:[UINib nibWithNibName:@"UniversitySearchCell" bundle:nil] forCellReuseIdentifier:@"UniversitySearchCell"];
        
    }
    return _tableView;
}

@end
