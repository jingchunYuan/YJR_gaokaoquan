//
//  JYTutorAppDetailViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/11.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorAppDetailViewController.h"

@interface JYTutorAppDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *DataArray;

@property (nonatomic,strong) UITableView *tabeview;

@end

@implementation JYTutorAppDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"预约详情"];
    
    UITableView *tabeview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tabeview];
    
    tabeview.dataSource = self;
    tabeview.delegate = self;
    
    self.tabeview = tabeview;
    
    self.tabeview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    // 发送请求
    NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/AdvisorCenter/orderView?order_on=%@",self.order_no];

    
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {


        
        
        
        
    
    
    }];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 50, 20)];
    
    label.font = [UIFont systemFontOfSize:12];
    
    [cell addSubview:label];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(130, 10, 170, 20)];
    
    label2.numberOfLines = 0;
    
    label2.font = [UIFont systemFontOfSize:12];
    
    [cell addSubview:label2];
    
    
    
//        NSDictionary *dict = responseObject[@"data"][@"order"];
//        
//        JYAppointmentDetailsModel *model = [JYAppointmentDetailsModel mj_objectWithKeyValues:dict];
//        
//        
//        if (indexPath.row == 0) {
//            
//            label.text = @"订单号";
//            
//            label2.text = model.order_no;
//            
//            
//        }else if (indexPath.row == 1){
//            
//            label.text = @"导师";
//            label2.text = model.advisor_id;
//            
//        }else if (indexPath.row == 2){
//            
//            label.text = @"主题";
//            label2.text = model.info;
//            
//        }else if (indexPath.row == 3){
//            
//            label.text = @"内容";
//            label2.text = @"如题";
//            
//        }else if (indexPath.row == 4){
//            
//            label.text = @"预约时间";
//            label2.text = [NSString stringWithFormat:@"%@ %@",model.order_date,model.order_time];
//            
//        }else if (indexPath.row == 5){
//            
//            label.text = @"下单时间";
//            label2.text = model.add_time;
//            
//            
//        }else if (indexPath.row == 6){
//            
//            label.text = @"金额";
//            label2.text = model.price;
//            
//        }else if (indexPath.row == 7){
//            
//            label.text = @"状态";
//            label2.text = model.status_title;
//            
//        }else if (indexPath.row == 8){
//            
//            label.text = @"操作";
//            label2.text = @"去评价";
//            
//        }
        
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 10;
}

- (void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)setOrder_no:(NSString *)order_no
{
    
    _order_no = order_no;
    
}

-(NSMutableArray *)DataArray
{
    if (_DataArray == nil) {
        
        _DataArray = [NSMutableArray array];
        
    }
    
    return _DataArray;
}


@end
