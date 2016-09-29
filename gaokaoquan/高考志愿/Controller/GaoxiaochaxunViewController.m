
//
//  GaoxiaochaxunViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoxiaochaxunViewController.h"
#import "GaoxiaochaxunCell.h"
#import "GaoxiaochaxunModel+Request.h"


@interface GaoxiaochaxunViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation GaoxiaochaxunViewController
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"高校查询";
    [self createUI];
    
}

-(void)createUI{
  
    
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellId = @"GaoxiaochaxunCell";
    GaoxiaochaxunCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[GaoxiaochaxunCell alloc]initWithStyle:UITableViewCellStyleDefault
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

-(void)createTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"" bundle:nil
                             ] forCellReuseIdentifier:@""];
    [self.view addSubview:_tableView];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
