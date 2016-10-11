
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


#define BTN_HEIGHT  40


@interface GaoXiaoCollgeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArray;
    NSInteger _btnTag;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UITableView *tableView1;

@end

@implementation GaoXiaoCollgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //初始化数据
    _dataArray = [[NSMutableArray alloc] init];
    //创建UI
    [self layoutUI];
    //加载数据
    [self loadData];
    
}

-(void)layoutUI{
    
    self.navigationItem.title = @"高校查询";
    self.navigationItem.leftBarButtonItem= [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem= [UIBarButtonItem initWithImageName:@"搜索" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    
    //地区、特色、分类、层次
    NSArray *titleArray = @[@"地区",@"特色",@"分类",@"层次"];
    for (int i=0; i<4; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0+(((SCREEN_WIDTH-3)/4 + 1)*i), 0, (SCREEN_WIDTH-3)/4, BTN_HEIGHT);
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, btn.zj_width/2-15)];
        [btn setImage:[UIImage imageNamed:@"高校查询-默认状态三角形"] forState:UIControlStateNormal];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.zj_width/2+15, 0, 0)];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100 + i;
        [self.view addSubview:btn];
        
    }
    
    //添加表格试图
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView1];
    self.tableView1.hidden = YES;
    
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
    if (tableView == self.tableView1) {
        return [_dataArray count];
    }
    return [self.dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.tableView1) {
        
        static NSString *cellId = @"cellId";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = VIEWCONTROLLERBGCOLOR;
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        cell.textLabel.text = _dataArray[indexPath.row];
        return cell;
        
    }else {
        
        static NSString *cellId = @"UniversitySearchCell";
        UniversitySearchCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = VIEWCONTROLLERBGCOLOR;
        if (!cell) {
            cell = [[UniversitySearchCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UniversitySearchCell"];
        }
        [cell setModel:self.dataArr[indexPath.row]];
        
        return cell;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tableView1) {
        return 44;
    }
    return 100.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.tableView1) {
        
        //隐藏选择的表格试图
        self.tableView1.hidden = YES;
        UIButton *b = (UIButton *)[self.view viewWithTag:_btnTag];
        NSString *title = _dataArray[indexPath.row];
        [b setTitle:title forState:UIControlStateNormal];
        
        //未进行真正的结果筛选
        
        
    }else {
        
        //大学详情页
        UniversityViewController * uniVC = [[UniversityViewController alloc]init];
        uniVC.university = _dataArr[indexPath.row];
        [self.navigationController pushViewController:uniVC animated:YES];
        
    }
    
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
#pragma mark - 选择按钮的点击事件
- (void)btnClick:(UIButton *)btn {
    
    //赋值
    _btnTag = btn.tag;
    
    //先清除数据
    [_dataArray removeAllObjects];
    
    //添加数据
    if (btn.tag==100) {
        //地区
        NSArray *array = @[@"不限",@"北京",@"上海",@"天津",@"重庆",@"河北",@"山西",@"内蒙古",@"辽宁",@"吉林",@"黑龙江",@"江苏",@"浙江",@"安徽",@"福建",@"江西",@"山东",@"河南",@"湖北",@"湖南",@"广东",@"广西",@"海南",@"四川",@"贵州",@"云南",@"西藏",@"陕西",@"甘肃",@"青海",@"宁夏",@"新疆"];
        [_dataArray addObjectsFromArray:array];
    }
    
    if (btn.tag==101) {
        //特色
        NSArray *array = @[@"不限",@"985",@"211",@"自主招生",@"研究生院",@"国防生",@"卓越计划"];
        [_dataArray addObjectsFromArray:array];
        
    }
    
    if (btn.tag==102) {
        //分类
        NSArray *array = @[@"不限",@"综合类",@"理工类",@"财经类",@"农林类",@"林业类",@"医药类",@"师范类",@"体育类",@"语言类",@"政法类",@"艺术类",@"民族类",@"军事类",@"商学院"];
        [_dataArray addObjectsFromArray:array];
    }
    
    if (btn.tag==103) {
        //层次
        NSArray *array = @[@"不限",@"本科",@"专科"];
        [_dataArray addObjectsFromArray:array];
    }
    
    //显示或隐藏
    if (self.tableView1.hidden) {
        self.tableView1.hidden = NO;
    }else {
        self.tableView1.hidden = YES;
    }
    //刷新
    [self.tableView1 reloadData];
    
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, BTN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-64-BTN_HEIGHT-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = VIEWCONTROLLERBGCOLOR;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"UniversitySearchCell" bundle:nil] forCellReuseIdentifier:@"UniversitySearchCell"];
        [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        
    }
    return _tableView;
}

- (UITableView *)tableView1 {
    if (!_tableView1) {
        _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, BTN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-64-BTN_HEIGHT-49) style:UITableViewStylePlain];
        _tableView1.delegate = self;
        _tableView1.dataSource = self;
        [_tableView1 setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];

    }
    return _tableView1;
}

@end
