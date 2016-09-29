//
//  JYTutorAppointViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/11.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorAppointViewController.h"
#import "JYTutorAppointModel.h"
#import "JYTutorAppDetailViewController.h"
@interface JYTutorAppointViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *DataArray;

@end

@implementation JYTutorAppointViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"我的预约"];
    
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    
    [self.view addSubview:tableview];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/AdvisorCenter/order" parameters:nil callback:^(id responseObject, NSError *error) {
        
        
        NSArray *array = [JYTutorAppointModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        for (JYTutorAppointModel *model in array) {
            
            [self.DataArray addObject:model];
            
        }
        
        [tableview reloadData];
        
    }];

    

    
}
// MARK:-数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.DataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *inder = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:inder];
        
    }
    
    JYTutorAppointModel *model = self.DataArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"订单号 %@",model.order_no];
    
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    label.font = [UIFont systemFontOfSize:12];
    
    label.textColor = [UIColor redColor];
    
    label.text = model.status;
    
    cell.accessoryView = label;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取当前cell的order_no
    JYTutorAppointModel *model = self.DataArray[indexPath.row];

    JYTutorAppDetailViewController *app = [[JYTutorAppDetailViewController alloc]init];

    app.order_no = model.order_no;
    
    [self.navigationController pushViewController:app animated:YES];
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (NSMutableArray *)DataArray
{
    
    if (_DataArray == nil) {
        
        _DataArray = [NSMutableArray array];
        
    }
    
    return _DataArray;
}



@end
