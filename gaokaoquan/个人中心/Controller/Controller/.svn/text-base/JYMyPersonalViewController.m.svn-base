//
//  JYMyPersonalViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMyPersonalViewController.h"

@interface JYMyPersonalViewController ()<UITableViewDataSource,UITableViewDelegate>



@end

static NSString *ident = @"cell";

@implementation JYMyPersonalViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor purpleColor];
 
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"我的私信"];
    
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
     tableview.dataSource = self;
     tableview.delegate = self;
    
    [self.view addSubview:tableview];
    
    // 注册cell
   // [tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:ident];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (cell == nil) {
        
    

    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ident];

    }
    cell.textLabel.text = @"高考侠";
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    cell.detailTextLabel.text = @"我GV或删除记录卡数谷";
    
    cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 20, 20)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"12";
    label.font = [UIFont systemFontOfSize:9];
    label.textColor = [UIColor whiteColor];
    label.layer.cornerRadius = 10;
    label.layer.masksToBounds = YES;
    
    
    [cell addSubview:label];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}



-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
