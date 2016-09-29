
//
//  FengyunViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "FengyunViewController.h"
#import "FengYunHotCell.h"
#import "fengyunModel+Request.h"
@interface FengyunViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *allRankBtn;
@property (weak, nonatomic) IBOutlet UIButton *weekRankBtn;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation FengyunViewController
{
    NSMutableArray * _dataArray;
    NSArray * _urls;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"点赞榜";
    [self createUI];
    [self loadData:0];
}

-(void)createUI{
    _urls = @[@"http://api.dev.gaokaoq.com/top/praise?cycle=all&limit=10"
              ,@"http://api.dev.gaokaoq.com//top/praise?cycle=week&limit=10"];
    _table.delegate = self;
    _table.dataSource= self;
    [_table registerNib:[UINib nibWithNibName:@"FengYunHotCell" bundle:nil] forCellReuseIdentifier:@"FengYunHotCell"];
    [self.view addSubview:_table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark -请求数据
-(void)loadData:(NSInteger) index{
    [super loadData];
    _dataArray = [[NSMutableArray alloc]init];
    __weak FengyunViewController * weakSelf = self;
    [fengyunModel RequestWithUrl:_urls[index] andPara:nil andCallBack:^(NSArray *arr, NSError *err) {
        if(!err){
            [_dataArray addObjectsFromArray:arr];
            [weakSelf.table reloadData];
        }
        [weakSelf stopLoadData];
    }];
}
#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId = @"FengYunHotCell";
    FengYunHotCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[FengYunHotCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellId];
    }
    
    //设置cell
    [cell setModel:_dataArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}


@end
