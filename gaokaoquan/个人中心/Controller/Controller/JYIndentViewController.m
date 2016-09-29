//
//  JYIndentViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.

#import "JYIndentViewController.h"
#import "JYMyIndentView.h"
#import "JYMYIndentModel.h"
#import "MJExtension.h"
#import "JYIndentDetailsViewController.h"
@interface JYIndentViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *DataArray;

@end

@implementation JYIndentViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor darkTextColor];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"我的订单"];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    [self.view addSubview:tableview];
    
    tableview.rowHeight = 100;
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/user_center/order" parameters:nil callback:^(id responseObject, NSError *error) {
       
        
        NSArray *array = [JYMYIndentModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        
        
        for (JYMYIndentModel *model in array) {
            
            [self.DataArray addObject:model];
            
        }
        
        [tableview reloadData];
        
    }];
    
    
    
}


// MARK:-数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (self.DataArray == nil) {
        
        
        return 1;
        
    }else{
   
        return self.DataArray.count;
    
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#warning 富文本设置???字体能点击
    
     static NSString *inder = @"Cell";
    
    JYMyIndentView *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYMyIndentView" owner:nil options:nil]lastObject];
    }
    
    
    if (self.DataArray == nil) {
        
        // 创建富文本字符
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"您还没有购买任何服务,立即购买"];
  
        [attrString addAttribute:NSForegroundColorAttributeName
                           value:[UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1]
                        range:NSMakeRange(11, 4)];
        
        [attrString addAttribute:NSUnderlineStyleAttributeName
                        value:@(NSUnderlineStyleSingle)
                        range:NSMakeRange(11, 4)];
        
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",attrString];
        
        
    }

    
    
    // 取消cell的选中样式
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    JYMYIndentModel *model = self.DataArray[indexPath.section];
    
    cell.Model = model;
    

    __weak typeof (self)Weakself = self;
    
    [cell indentDteail:^{
        
        JYIndentDetailsViewController *datail = [[JYIndentDetailsViewController alloc]init];
        
        [Weakself.navigationController pushViewController:datail animated:YES];
        
        
        datail.Model = model;
        
        
    }];
    

    return cell;
}

// MARK:-调整section之间的间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{


    return 3;
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
