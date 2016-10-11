//
//  GaoXiaoSearchViewController.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/18.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoXiaoSearchViewController.h"
#import "UniversitySearchCell.h"
#import "GaoxiaochaxunModel+Request.h"
#import "UniversityViewController.h"

@interface GaoXiaoSearchViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic,strong) NSMutableArray * dataArr;
@end

@implementation GaoXiaoSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self loadData];
}
- (IBAction)sortBy:(UIButton *)sender {
}
-(void)layoutUI{
    self.navigationItem.title = @"高校查询";
    self.navigationItem.leftBarButtonItem= [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem= [UIBarButtonItem initWithImageName:@"搜索" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    _table.delegate = self;
    _table.dataSource = self;
    [self.table registerNib:[UINib nibWithNibName:@"UniversitySearchCell" bundle:nil] forCellReuseIdentifier:@"UniversitySearchCell"];
    NSLog(@"高校查询url = %@",_url);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadData{
    [super loadData];
    
    [GaoxiaochaxunModel RequestWithUrl:_url andPara:@{@"p":@(self.page),@"pageSize":@"20"} andCallBack:^(NSArray *arr, NSError *err) {
        if (!err) {
            [_dataArr addObjectsFromArray:arr];
            [_table reloadData];
            [super stopLoadData];
        }else{
            NSLog(@"%@",err.domain);
        }
    }];
}
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
#pragma mark -table delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UniversitySearchCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UniversitySearchCell"];
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

- (void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
