

//
//  ShopViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ShopViewController.h"
#import "FirstCell.h"
#import "SecondCell.h"
#import "ThirdCell.h"
#import "FourthCell.h"
#import "FifthCell.h"
#import "SixthCell.h"
@interface ShopViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * table;


@end

@implementation ShopViewController

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
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _table.delegate =self;
        _table.dataSource = self;
        [_table registerNib:[UINib nibWithNibName:@"FirstCell" bundle:nil] forCellReuseIdentifier:@"FirstCell"];
        [_table registerNib:[UINib nibWithNibName:@"SecondCell" bundle:nil] forCellReuseIdentifier:@"SecondCell"];
        [_table registerNib:[UINib nibWithNibName:@"ThirdCell" bundle:nil] forCellReuseIdentifier:@"ThirdCell"];
        [_table registerNib:[UINib nibWithNibName:@"FourthCell" bundle:nil] forCellReuseIdentifier:@"FourthCell"];
        [_table registerNib:[UINib nibWithNibName:@"FifthCell" bundle:nil] forCellReuseIdentifier:@"FifthCell"];
        [_table registerNib:[UINib nibWithNibName:@"SixthCell" bundle:nil] forCellReuseIdentifier:@"SixthCell"];
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
        FirstCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell"];
        if (!cell) {
            cell = [[FirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FirstCell"];
        }
        return cell;
    }else if(indexPath.section==1) {
        SecondCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SecondCell"];
        if (!cell) {
            cell = [[SecondCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SecondCell"];
        }
        return cell;
    }else if(indexPath.section==2) {
        ThirdCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ThirdCell"];
        if (!cell) {
            cell = [[ThirdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ThirdCell"];
        }
        return cell;
    }else if(indexPath.section==3) {
        FourthCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FourthCell"];
        if (!cell) {
            cell = [[FourthCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FourthCell"];
        }
        return cell;
    }else if(indexPath.section==4) {
        FifthCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FifthCell"];
        if (!cell) {
            cell = [[FifthCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FifthCell"];
        }
        return cell;
    }else{
        SixthCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SixthCell"];
        if (!cell) {
            cell = [[SixthCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SixthCell"];
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
            height = 130.0f;
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
