//
//  JYIndentDetailsViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYIndentDetailsViewController.h"

@interface JYIndentDetailsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tabeview;

@end

@implementation JYIndentDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"订单详情"];
    
    UITableView *tabeview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [self.view addSubview:tabeview];
    
    tabeview.dataSource = self;
    tabeview.delegate = self;
    
    self.tabeview = tabeview;
    
    // 隐藏多余cell
    self.tabeview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    

}

// MARK:-数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{


    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 20)];
    
    label.font = [UIFont systemFontOfSize:15];
    
    [cell addSubview:label];
    
   
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(70, 13, 200, 15)];
    
    label2.font = [UIFont systemFontOfSize:15];
    
    [cell addSubview:label2];
    
    if (indexPath.section == 0) {
        
        label.text = @"订单号";
        
        cell.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
        
        label.textColor = [UIColor whiteColor];
       
        label2.text = self.Model.order_no;
        
        label2.textColor = [UIColor whiteColor];
        
        
    }else if (indexPath.section == 1){
    
    
        label.text = @"购买服务:";
        
        label2.x = 90;
        
        label2.text = self.Model.title;
        
    }else if(indexPath.section == 2){
    
       label.text = @"下单时间:";
       label2.x = 90;
       label2.text = self.Model.ctime;
    
    }else if (indexPath.section == 3){
       
        label.text = @"单价:";
        label2.x = 50;
        label2.text = self.Model.pay_money;
        

    }else if (indexPath.section == 4){
    
        self.tabeview.rowHeight = 90;
        label.text = @"实付款:";
        label2.text = [NSString stringWithFormat:@"金额: %@元",self.Model.pay_balance];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(70, 35, 100, 20)];
        lab.font = [UIFont systemFontOfSize:15];
        lab.text = [NSString stringWithFormat:@"金币: %@个",self.Model.pay_gold];
        
        [cell addSubview:lab];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(70, 60, 150, 20)];
        line.font = [UIFont systemFontOfSize:15];
        
        line.text = [NSString stringWithFormat:@"在线支付:%@元",self.Model.pay_money];
        
        [cell addSubview:line];
        
    
    }else if (indexPath.section == 5){
    
        self.tabeview.rowHeight = 44;
        label.text = @"状态:";
        label2.x = 50;
        label2.text = self.Model.status_title;
        
        
    
    }else if (indexPath.section == 6){
    
       self.tabeview.rowHeight = 44;
       label.text = @"操作:";
    
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{



    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 0.1;
}

- (void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)setModel:(JYMYIndentModel *)Model
{
    _Model = Model;


}

@end
