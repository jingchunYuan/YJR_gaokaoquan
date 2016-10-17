//
//  ShopServiceViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/15.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ShopServiceViewController.h"
#import "ServiceFirstCell.h"
#import "ServiceSecondCell.h"
#import "ServiceThirdCell.h"
#import "ServiceFourthCell.h"
#import "ServiceFifthCell.h"
#import "ServiceSixthCell.h"

@interface ShopServiceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * table;

@end

@implementation ShopServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}

-(void)layoutUI{
    self.view.backgroundColor = UIColorRGB(245, 245, 245);
    self.navigationItem.title = @"购买服务";
    [self.view addSubview:self.table];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
}



-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _table.delegate =self;
        _table.dataSource = self;
        [_table registerNib:[UINib nibWithNibName:@"ServiceFirstCell" bundle:nil] forCellReuseIdentifier:@"ServiceFirstCell"];
        [_table registerNib:[UINib nibWithNibName:@"ServiceSecondCell" bundle:nil] forCellReuseIdentifier:@"ServiceSecondCell"];
        [_table registerNib:[UINib nibWithNibName:@"ServiceThirdCell" bundle:nil] forCellReuseIdentifier:@"ServiceThirdCell"];
        [_table registerNib:[UINib nibWithNibName:@"ServiceFourthCell" bundle:nil] forCellReuseIdentifier:@"ServiceFourthCell"];
        [_table registerNib:[UINib nibWithNibName:@"ServiceFifthCell" bundle:nil] forCellReuseIdentifier:@"ServiceFifthCell"];
        [_table registerNib:[UINib nibWithNibName:@"ServiceSixthCell" bundle:nil] forCellReuseIdentifier:@"ServiceSixthCell"];
    }
    return _table;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        ServiceFirstCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceFirstCell"];
        if (!cell) {
            cell = [[ServiceFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceFirstCell"];
        }
        return cell;
    }else if(indexPath.section==1) {
        ServiceSecondCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceSecondCell"];
        if (!cell) {
            cell = [[ServiceSecondCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceSecondCell"];
        }
        return cell;
    }else if(indexPath.section==2) {
        ServiceThirdCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceThirdCell"];
        if (!cell) {
            cell = [[ServiceThirdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceThirdCell"];
        }
        return cell;
    }else if(indexPath.section==3) {
        ServiceFourthCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceFourthCell"];
        if (!cell) {
            cell = [[ServiceFourthCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceFourthCell"];
        }
        return cell;
    }else if(indexPath.section==4) {
        ServiceFifthCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceFifthCell"];
        if (!cell) {
            cell = [[ServiceFifthCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceFifthCell"];
        }
        return cell;
    }else{
        ServiceSixthCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceSixthCell"];
        if (!cell) {
            cell = [[ServiceSixthCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ServiceSixthCell"];
        }
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0.0f;
    switch (indexPath.section) {
        case 0:
            height = 40.0f;
            break;
        case 1:
            height = 100.0f;
            break;
        case 2:
            height = 60.0f;
            break;
        case 3:
            height = 60.0f;
            break;
        case 4:
            height = 100.0f;
            break;
        case 5:
            height = 250.0f;
            break;
        default:
            break;
    }
    return height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
