//
//  AnswerViewController.m
//  gaokaoquan
//
//  Created by 程伟利 on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AnswerViewController.h"
#import "TouchPropagatedScrollView.h"
#import "QHCommonUtil.h"
#import "PersonTableViewCell.h"
#import "PersonModel+Request.h"
#import "AnswerDetalViewController.h"
#import "AskQuestionsController.h"
#import "CustomTextField.h"

#define MENU_HEIGHT 40
#define MENU_BUTTON_WIDTH  80
#define MIN_MENU_FONT  13.f
#define MAX_MENU_FONT  15.f

@interface AnswerViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    
    UIView *_bigBgView;
    UIView *_topBgView;
    UIView *_topNaviV;
    TouchPropagatedScrollView *_navScrollV;
    NSArray *arT;
    UILabel * btnLeftline;
    UILabel * btnRightline;
    UIView *navView ;
    
    //搜索
    UIView *_searchView;
    CustomTextField *_textField;
    UIButton *_searchBtn;
    NSString *_searchKeyword;
    BOOL _addSearchBtnFlage;
    BOOL _firstFlag;
}

@end

@implementation AnswerViewController

- (void)searchBtnClick:(UIButton *)sender {
    if ([_textField.text length]) {
        //有输入内容
        _searchKeyword = _textField.text;
        
        //请求搜索接口
        [self searchRequestData];
        
        //隐藏顶部试图
        _firstFlag = YES;
        //设置
        [_tableView.tableHeaderView removeFromSuperview];
        _addSearchBtnFlage = NO;
        [self createUI];
        [_tableView setTableHeaderView:_topBgView];
        
    }else {
        
        //刷新数据
        [self requestData:0];
        
        //隐藏顶部试图
        _firstFlag = YES;
        //设置
        [_tableView.tableHeaderView removeFromSuperview];
        _addSearchBtnFlage = NO;
        [self createUI];
        [_tableView setTableHeaderView:_topBgView];
    }
}
//导航栏左侧按钮，“搜索”
- (void)backBtnTapped {
    NSLog(@"导航栏搜索按钮");
    
    if (_firstFlag) {
        _firstFlag = NO;
        //设置
        [_tableView.tableHeaderView removeFromSuperview];
        _addSearchBtnFlage = YES;
        [self createUI];
        [_tableView setTableHeaderView:_bigBgView];
    }else {
        //清除数据
        _firstFlag = YES;
        //设置
        [_tableView.tableHeaderView removeFromSuperview];
        _addSearchBtnFlage = NO;
        [self createUI];
        [_tableView setTableHeaderView:_topBgView];
    }
    
}
//导航栏右侧按钮, "提问"
- (void)rightBtnTapped {
    NSLog(@"导航栏提问按钮");
    AskQuestionsController *VC = [[AskQuestionsController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"问答社区";
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self kkb_customLeftNarvigationBarWithTitle:@"搜索"];
    [self kkb_customRightNarvigationBarWithTitle:@"提问"];
    
    // 初始化数据
    _dataArray = [NSMutableArray array];
    _addSearchBtnFlage = NO;
    _firstFlag = YES;
    // 创建表格
    [self createTableView];
    // 创建UI
    [self createUI];
    //请求数据
    [self requestData:0];
    
}
#pragma mark - 请求数据
-(void)requestData:(NSInteger)tid
{
    NSString * url =@"http://api.dev.gaokaoq.com/ask/lists";
    NSDictionary * para = @{
                            @"tid":@(tid)
                            //@"type":@(type)
                            };
    [PersonModel RequestWithUrl:url andPara:para andCallBack:^(NSArray *arr, NSError *err) {
        
        if (!err) {
            [_dataArray removeAllObjects];
            [_dataArray addObjectsFromArray:arr];
            [_tableView reloadData];
            
        }else{
            NSLog(@"%@",err.domain);
        }
    }];
}

- (void)searchRequestData {
    NSLog(@"搜索数据展示--------------- _searchKeyword=%@",_searchKeyword);
    //http://api.dev.gaokaoq.com/ask/lists?p=1&pageSize=10&tid=1&type=new&q=%E5%AD%A6%E4%B9%A0
    NSString *url = @"http://api.dev.gaokaoq.com/ask/lists?";
    NSDictionary *para = @{
                           @"p":@1,
                           @"pageSize":@10,
                           @"tid":@1,
                           @"type":@"new",
                           @"q":_searchKeyword ? _searchKeyword:@""
                           };
    [PersonModel RequestWithUrl:url andPara:para andCallBack:^(NSArray *arr, NSError *err) {
        
        if (!err) {
            [_dataArray removeAllObjects];
            [_dataArray addObjectsFromArray:arr];
            [_tableView reloadData];
            
        }else{
            NSLog(@"%@",err.domain);
        }
    }];
    
}

- (void)createSearchUIView {
    //搜索框
    _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
    _searchView.backgroundColor = VIEWCONTROLLERBGCOLOR;
    [_bigBgView addSubview:_searchView];
    
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
- (void)createUI {
    
    if (_addSearchBtnFlage) {
        _bigBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MENU_HEIGHT*2 + 70)];
        [self.view addSubview:_bigBgView];
        //搜索
        [self createSearchUIView];
        _topBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, MENU_HEIGHT*2)];
        [_bigBgView addSubview:_topBgView];
    }else {
        _topBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MENU_HEIGHT*2)];
        [self.view addSubview:_topBgView];
    }
    
    // 滚动条
    _topNaviV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, MENU_HEIGHT)];
    //_topNaviV.backgroundColor = RGBA(241.f, 241.f, 241.f, 1);
    _topNaviV.backgroundColor = [UIColor whiteColor];
    [_topBgView addSubview:_topNaviV];
    
    arT = @[@"全部",@"学习方法",@"经验分享",@"校园爱情",@"高考专区",@"志愿填报",@"爱上大学"];
    _navScrollV = [[TouchPropagatedScrollView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, MENU_HEIGHT)];
    [_navScrollV setShowsHorizontalScrollIndicator:NO];
    [_navScrollV setBounces:NO];
    _navScrollV.contentSize = CGSizeMake(MENU_BUTTON_WIDTH * [arT count], MENU_HEIGHT);
    [_topNaviV addSubview:_navScrollV];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, MENU_HEIGHT-1, MENU_BUTTON_WIDTH * [arT count], 1)];
    view1.backgroundColor = RGBA(241.f, 241.f, 241.f, 1);
    [_navScrollV addSubview:view1];
    
    for (int i = 0; i < [arT count]; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIView *view = [[UIView alloc] init];
        
        [btn setFrame:CGRectMake(MENU_BUTTON_WIDTH * i, 0, MENU_BUTTON_WIDTH, MENU_HEIGHT)];
        view.frame = CGRectMake(MENU_BUTTON_WIDTH * i, MENU_HEIGHT-1, MENU_BUTTON_WIDTH, 1);
        view.backgroundColor = RGBA(29.f, 182.f, 250.f, 1);
        view.tag = i + 1 + 100;
        
        [btn setTitle:[arT objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:MAIN_FONT_COLOR forState:UIControlStateNormal];
        btn.tag = i + 1;
        if(i==0)
        {
            [btn setTitleColor:NAVAGATIONCOLOR forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:MAX_MENU_FONT];
            view.alpha = 1.0;
        }else
        {
            btn.titleLabel.font = [UIFont systemFontOfSize:MIN_MENU_FONT];
            view.alpha = 0.0;
        }
        [btn addTarget:self action:@selector(actionbtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [_navScrollV addSubview:btn];
        [_navScrollV addSubview:view];
    }
    
    // 最新、热门、等待回复
    navView = [[UIView alloc] initWithFrame:CGRectMake(0, MENU_HEIGHT, SCREEN_WIDTH, 40)];
    //view.backgroundColor = RGBA(241.f, 241.f, 241.f, 1);
    navView.backgroundColor = [UIColor whiteColor];
    [_topBgView addSubview:navView];
    //最新、热门、等待回复按钮的下面的线
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, MENU_HEIGHT-6.5, SCREEN_WIDTH, 1)];
    lineView.backgroundColor = RGBA(241.f, 241.f, 241.f, 1);
    [navView addSubview:lineView];
    
    NSArray *titleArray = @[@"最新",@"热门",@"等待回复"];
    for (int i=0; i<3; i++) {
        if (i == 0) {
            //按钮的背景图片
            UIImageView * bgImg = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60*3 + i*(60), 5, 60, 30)];
            bgImg.tag = 5050;
            bgImg.image = [UIImage imageNamed:@"kuang@3x"];
            [navView addSubview:bgImg];
        }
        UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
        b.frame = CGRectMake(SCREEN_WIDTH-60*3 + i*(60), 5, 60, 30);

        [b setTitle:titleArray[i] forState:UIControlStateNormal];
        b.titleLabel.font = [UIFont systemFontOfSize:12];
        [b setTitleColor:MAIN_FONT_COLOR forState:UIControlStateNormal];
        [navView addSubview:b];
        
//        UIButton *b1 = [UIButton buttonWithType:UIButtonTypeCustom];
//        b1.frame = CGRectMake(SCREEN_WIDTH - 60*3 + i*(60), 5, 60, 30);
//        b1.backgroundColor = [UIColor redColor];
        
        [b addTarget:self action:@selector(clictBtn:) forControlEvents:UIControlEventTouchUpInside];
        b.tag = 900+i;
    }
//    btnLeftline = [[UILabel alloc]initWithFrame:CGRectMake(0, navView.height, SCREEN_WIDTH, 1)];
//    btnLeftline.backgroundColor = [UIColor lightGrayColor];
//    btnRightline = [[UILabel alloc]initWithFrame:CGRectMake(0, navView.height, SCREEN_WIDTH, 1)];
//    btnLeftline.backgroundColor = [UIColor lightGrayColor];
//    [navView addSubview:btnLeftline];
//    [navView addSubview:btnRightline];
    
    // 添加到tableView
    if (!_addSearchBtnFlage) {
        [_tableView setTableHeaderView:_topBgView];
    }
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"PersonTableViewCell";
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[PersonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    // 设置cell
    [cell setModel:_dataArray[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *Id = [_dataArray[indexPath.row] Id];
    AnswerDetalViewController *detalVC = [[AnswerDetalViewController alloc] init];
    detalVC.uid = Id;
    [self.navigationController pushViewController:detalVC animated:YES];
}
- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    _tableView.backgroundColor = VIEWCONTROLLERBGCOLOR;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"PersonTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonTableViewCell"];
    [self.view addSubview:_tableView];
}
//上面滚动的点击事件
- (void)actionbtn:(UIButton *)btn
{
    // 改变UI
    float xx = SCREEN_WIDTH * (btn.tag - 1) * (MENU_BUTTON_WIDTH / SCREEN_WIDTH) - MENU_BUTTON_WIDTH;
    [_navScrollV scrollRectToVisible:CGRectMake(xx, 0, _navScrollV.frame.size.width, _navScrollV.frame.size.height) animated:YES];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:MAX_MENU_FONT];
    [btn setTitleColor:NAVAGATIONCOLOR forState:UIControlStateNormal];
    NSInteger viewTag = btn.tag + 100;
    UIView *view = [self.view viewWithTag:viewTag];
    view.alpha = 1.0;
    
    for (id obj in _navScrollV.subviews) {
        
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *b = obj;
            if (b.tag != btn.tag) {
                b.titleLabel.font = [UIFont systemFontOfSize:MIN_MENU_FONT];
                [b setTitleColor:MAIN_FONT_COLOR forState:UIControlStateNormal];
                
                NSInteger myViewTag = b.tag + 100;
                UIView *myView = [self.view viewWithTag:myViewTag];
                myView.alpha = 0.0;
            }
            
        }
        
    }
    
    // 更改数据
    [self requestData:btn.tag-1];
    
}
//最新 热门 等待回复的点击事件
-(void)clictBtn:(UIButton *)btn{
    UIImageView * bgImg = (UIImageView *)[self.view viewWithTag:5050];
    NSInteger i = btn.tag-900;
    //根据点击的按钮，控制背景图片的位置
    [UIView animateWithDuration:0.5 animations:^{
        bgImg.frame = CGRectMake(SCREEN_WIDTH-60*3 + i*(60), 5, 60, 30);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
