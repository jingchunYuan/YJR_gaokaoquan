//
//  AnswerDetalViewController.m
//  gaokaoquan
//
//  Created by admin on 16/8/31.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AnswerDetalViewController.h"
#import "AnswerDetalTopCell.h"
#import "AnswerDetalUnderCell.h"
#import "AnswerDetalModel+Request.h"

@interface AnswerDetalViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSDictionary *_dataDictionary;
}

@end

@implementation AnswerDetalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"问答社区详情页";
    self.automaticallyAdjustsScrollViewInsets = NO;
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    // 初始化数据
    _dataArray = [NSMutableArray array];
    _dataDictionary = [NSDictionary dictionary];
    
    // 创建表格
    [self createTableView];
    
    //请求数据
    [self requestData];
    
    
}

#pragma mark - 请求数据
-(void)requestData
{
    NSString * url =@"http://api.dev.gaokaoq.com/ask/view?";
    NSDictionary * para = @{
                            @"id":_uid,
                            @"pageSize":@30
                            };
    [AnswerDetalModel RequestWithUrl:url andPara:para andCallBack:^(NSDictionary *dict, NSArray *arr, NSError *err) {
        
        if (!err) {
            
            _dataDictionary = dict;
            [_dataArray addObjectsFromArray:arr];
            [_tableView reloadData];
            
        }else{
            NSLog(@"%@",err.domain);
        }
        
    }];
     
    
}

- (void)createTableView {

   
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"AnswerDetalTopCell" bundle:nil] forCellReuseIdentifier:@"AnswerDetalTopCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"AnswerDetalUnderCell" bundle:nil] forCellReuseIdentifier:@"AnswerDetalUnderCell"];
    [self.view addSubview:_tableView];
//    UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(20, 130, 150, 40)];
//    bt.backgroundColor = [UIColor clearColor];
//    [bt setBackgroundImage:[UIImage imageNamed:@"yaoqinghuida@3x.png"] forState:UIControlStateNormal];
//    UIButton *bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    bt1.frame = CGRectMake(200, 130, 150, 40);
//    bt1.backgroundColor = [UIColor clearColor];
//    [bt1 setBackgroundImage:[UIImage imageNamed:@"tianjiadaan@3x.png"] forState:UIControlStateNormal];
//    [_tableView addSubview:bt];
//    [_tableView addSubview:bt1];
}


#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count] + 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        static NSString *cellID = @"AnswerDetalTopCell";
        AnswerDetalTopCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (!cell) {
            cell = [[AnswerDetalTopCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        
        // 设置cell
        if (![_dataDictionary isKindOfClass:[NSNull class]]) {
            [cell setDict:_dataDictionary];
        }
        
        return cell;
        
    }else {
        static NSString *cellID = @"AnswerDetalUnderCell";
        AnswerDetalUnderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        
        if (!cell) {
            cell = [[AnswerDetalUnderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        // 设置cell
        if (_dataArray) {
            [cell setModel:_dataArray[indexPath.row-1]];
        }
        
        return cell;
        
    }
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
    
//    if (indexPath.row == 0) {
//        return 230;
//    }else {
//        return 150;
//    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
