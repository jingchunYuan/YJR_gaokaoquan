//
//  TecherViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/2.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TecherViewController.h"
#import "TecherModel+Request.h"
#import "TecherDetalView.h"
#import "RTLabel.h"
#import "JieshaoView.h"
#import "YinXiangView.h"
#import "ImpressionCell.h"
#import "ImpressionModel+Request.h"
#import "DongTaiView.h"
#import "DongtaiModel+Requesst.h"
#import "YuyueViewController.h"
#import "MianfeiViewController.h"
#import "AddImpressionController.h"

@interface TecherViewController ()<YinXiangViewDelegate, TecherDetalViewDelegate>
{
    
    NSDictionary *_dict; // 头像部分数据
    NSMutableArray *_dataArray1; // 介绍数据
    NSMutableArray *_dataArray2; // 印象数据
    NSMutableArray *_dataArray3; // 动态数据
    UIScrollView *_scrollView;
    TecherDetalView *_detalView;
    UIView *_bgView;
    JieshaoView *_jieshaoView;
    YinXiangView *_yinXiangView;
    DongTaiView *_dongTaiView;
    float _h1;
    
}

@end

@implementation TecherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.true_name != nil) {
        self.navigationItem.title = [NSString stringWithFormat:@"%@导师", self.true_name];
    }else {
        self.navigationItem.title = @"问答社区详情页";
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // 初始化数据
    _dict = [NSDictionary dictionary];
    _dataArray1 = [NSMutableArray array];
    _dataArray2 = [NSMutableArray array];
    _dataArray3 = [NSMutableArray array];
    
    // 创建UI
    [self createUI];
    
    //请求数据
    [self requestData];
    
}

#pragma mark -
#pragma mark - 三个方法
- (void)showJieshaoView {
    _jieshaoView.alpha = 1.0;
    _yinXiangView.alpha = 0.0;
    _dongTaiView.alpha = 0.0;
}

- (void)showYinxiangView {
    _jieshaoView.alpha = 0.0;
    _yinXiangView.alpha = 1.0;
    _dongTaiView.alpha = 0.0;
}

- (void)showDongtaiView {
    // 未写
    _jieshaoView.alpha = 0.0;
    _yinXiangView.alpha = 0.0;
    _dongTaiView.alpha = 1.0;
}


#pragma mark -
#pragma mark - 创建UI
- (void)createUI {
    UIImageView * bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    bgView.image = [UIImage imageNamed:@"beijing@3x"];
    [self.view addSubview:bgView];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.backgroundColor = [UIColor colorWithHue:46.0/255.0 saturation:117.0/255.0 brightness:147.0/255.0 alpha:1.0];
    _scrollView.pagingEnabled = NO;
    [self.view addSubview:_scrollView];
    
    // topView
    _detalView = [[TecherDetalView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 320)];
    _detalView.delegate = self;
    [_scrollView addSubview:_detalView];
    [_scrollView addSubview:_detalView];
    _scrollView.backgroundColor = [UIColor clearColor];
    
    //介绍、印象、动态
    _bgView = [[UIView alloc] initWithFrame:CGRectMake(10, _detalView.frame.origin.y+_detalView.frame.size.height+10, SCREEN_WIDTH-20, 40)];
    _bgView.backgroundColor = [UIColor clearColor];
    _bgView.layer.borderWidth = 0.5;
    _bgView.layer.borderColor = [UIColor cyanColor].CGColor;
    _bgView.layer.masksToBounds = YES;
    _bgView.layer.cornerRadius = 18.0;
    [_scrollView addSubview:_bgView];
    
    NSArray *imageArray = @[@"jieshao",@"yinxiang",@"dongtai"];
    NSArray *titleArray = @[@"介绍",@"印象",@"动态"];
    float myWidth = (SCREEN_WIDTH-20-40)/3;
    float imageWidth = (SCREEN_WIDTH-20)/3;
    for (int i=0; i<3; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        UILabel *label = [[UILabel alloc] init];
        imageView.frame = CGRectMake(30+i*(myWidth+10), 10, 20, 20);
        label.frame = CGRectMake(10+20+i*(myWidth+10), 10, myWidth-20, 20);
        UIButton *myBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        myBtn.frame = CGRectMake(i*imageWidth, 0, imageWidth, 40);
        
        imageView.backgroundColor = [UIColor clearColor];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = titleArray[i];
        
        label.tag = 100+i;
        myBtn.tag = 200+i;
        
        myBtn.backgroundColor = [UIColor clearColor];
        if (i == 0) {
            [myBtn setBackgroundImage:[UIImage imageNamed:@"lansesekuai"] forState:UIControlStateNormal];
            label.textColor = [UIColor whiteColor];
        }else{
            [myBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            label.textColor = [UIColor lightGrayColor];
        }
        [myBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_bgView addSubview:myBtn];
        [_bgView addSubview:imageView];
        [_bgView addSubview:label];

    }
    
    //介绍view，还需要动态适配View的高度
    _h1 = (_bgView.frame.origin.y+_bgView.frame.size.height+10);
    _jieshaoView = [[JieshaoView alloc] initWithFrame:CGRectMake(10, (_bgView.frame.origin.y+_bgView.frame.size.height+10), SCREEN_WIDTH-20, 80)];
    _jieshaoView.alpha = 1.0;
    
    //印象view，还需要动态适配View的高度
    _yinXiangView = [[YinXiangView alloc] initWithFrame:CGRectMake(10, (_bgView.frame.origin.y+_bgView.frame.size.height+10), SCREEN_WIDTH-20, 80)];
    _yinXiangView.delegate = self;
    _yinXiangView.alpha = 0.0;
    
    //动态
    _dongTaiView = [[DongTaiView alloc] initWithFrame:CGRectMake(10, (_bgView.frame.origin.y+_bgView.frame.size.height+10), SCREEN_WIDTH-20, 80)];
    _dongTaiView.alpha = 0.0;
    
}

- (void)btnClick:(UIButton *)sender {
    //取消
    for (id obj in [_bgView subviews]) {
        
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton *b = (UIButton *)obj;
            [b setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        }
        if ([obj isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)obj;
            label.textColor = [UIColor lightGrayColor];
        }
        
    }
    
    //设置
    [sender setBackgroundImage:[UIImage imageNamed:@"lansesekuai"] forState:UIControlStateNormal];
    UILabel *label = [_bgView viewWithTag:(sender.tag-100)];
    label.textColor = [UIColor whiteColor];
    
    //事件处理
    switch (sender.tag) {
        case 200:
            [self showJieshaoView];
            _scrollView.contentSize = CGSizeMake(0, _h1+_jieshaoView.viewHeight+64+49);
            break;
        case 201:
            [self showYinxiangView];
            [self loadImpression];
            break;
        case 202:
            [self showDongtaiView];
            [self loadDongTaiData];
            _scrollView.contentSize = CGSizeMake(0, _h1 + [_dataArray3 count] * 40 + 64 + 49);
            break;
        default:
            break;
    }
    
}

//请求数据
-(void)requestData
{
    NSString * url =@"http://api.dev.gaokaoq.com/advisor/view?";
    NSDictionary * para = @{
                            @"uid":self.uid
                            };
    [TecherModel RequestWithUrl:url andPara:para andCallBack:^(NSDictionary *dict, NSArray *arr, NSError *err) {
        if (!err) {
            
            _dict = dict;
            [_dataArray1 addObjectsFromArray:arr];
            
            //刷新UI
            _detalView.topDict = _dict;
            _jieshaoView.jieshaoDict = _dict; // 获取intro字段
            //添加介绍view
            if ([_dataArray1 count]) {
                _jieshaoView.jieshaoArr = _dataArray1;
                _jieshaoView.zj_height = _jieshaoView.viewHeight;
                [_scrollView addSubview:_jieshaoView];
                _scrollView.contentSize = CGSizeMake(0, _h1+_jieshaoView.viewHeight+64+49);
            }else {
                _scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT);
            }
            
        }else {
            NSLog(@"%@",err.domain);
        }
        
    }];

}
//印象数据
-(void)loadImpression{
    //uid=2567&p=1&pageSize=20
    NSString * url = @"http://api.dev.gaokaoq.com/advisor/comment?";
    NSDictionary * para = @{
                            @"uid":self.uid,
                            @"p":@1,
                            @"pageSize":@20
                            };
    [ImpressionModel RequestWithUrl:url andPara:para andCallBack:^(NSArray * arr,NSNumber *count,  NSError * err) {
        if (!err) {
            if ([_dataArray2 count]) {
                [_dataArray2 removeAllObjects];
            }
            [_dataArray2 addObjectsFromArray:arr];
            // 如果有印象数据，添加印象view
            if ([_dataArray2 count]) {
                _yinXiangView.yinXiangArr = _dataArray2;
                _yinXiangView.count = count;
                _yinXiangView.zj_height = [_dataArray2 count]*90;
                _scrollView.contentSize = CGSizeMake(0, _h1+[_dataArray2 count]*90+64+49+60);
                [_scrollView addSubview:_yinXiangView];
            }else {
                _scrollView.contentSize = CGSizeMake(0, SCREEN_HEIGHT);
            }
        }
    }];
    
}

//动态数据
- (void)loadDongTaiData {
    //http://api.dev.gaokaoq.com/advisor/feed?uid=2567
    
    
    NSString *url = @"http://api.dev.gaokaoq.com/advisor/feed?";
    NSDictionary *para = @{
                           @"uid":self.uid
                           };
    [DongtaiModel RequestWithUrl:url andPara:para andCallBack:^(NSArray *arr, NSError *err) {
        if (!err) {
            if ([_dataArray3 count]) {
                [_dataArray3 removeAllObjects];
            }
            [_dataArray3 addObjectsFromArray:arr];
            if ([_dataArray3 count]) {
                _dongTaiView.dongTaiArr = _dataArray3;
                _dongTaiView.zj_height = [_dataArray3 count] * 40;
                _scrollView.contentSize = CGSizeMake(0, _h1 + [_dataArray3 count] * 40 + 64 + 49);
                [_scrollView addSubview:_dongTaiView];
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark - YinXiangViewDelegate
- (void)yinXiangViewWithAddYinXiangMethod:(YinXiangView *)yinXiangView{
    NSLog(@"添加印象按钮点击了");
    AddImpressionController *VC = [[AddImpressionController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)yuYueZiXunBtnWithTeacher:(TecherDetalView *)detalView {
    NSLog(@"预约咨询");
    
    YuyueViewController *VC = [[YuyueViewController alloc] init];
    VC.true_name = [NSString stringWithFormat:@"预约%@导师", self.true_name];
    [self.navigationController pushViewController:VC animated:YES];
    
}
- (void)mianFeiTiWenBtnWithTeacher:(TecherDetalView *)detalView {
    NSLog(@"免费提问");
    
    MianfeiViewController *VC = [[MianfeiViewController alloc] init];
    VC.true_name = [NSString stringWithFormat:@"私信%@导师", self.true_name];
    [self.navigationController pushViewController:VC animated:YES];

}


@end
