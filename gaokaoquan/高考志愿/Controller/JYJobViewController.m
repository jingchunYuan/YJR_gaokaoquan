//
//  JYJobViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/23.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYJobViewController.h"
#import "JYMajorTableViewCell.h"
#import "JYMajorModel.h"
#import "JYJobModel.h"
#import "JYView.h"
@interface JYJobViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableview;
/// 根据专业选职业的数据
@property (nonatomic,strong) NSMutableArray *DataArray;
/// 根据职业选专业的数据
@property (nonatomic,strong) NSMutableArray *DataArray1;
/// tableview根据它去加载不同的数据
@property (nonatomic,assign) BOOL ISMajor;

@end
static NSString *inder = @"majorcell";

@implementation JYJobViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)setUI
{
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
        self.navigationItem.titleView = [self.view titleWithNavigat:@"专业职业通"];
        JYView *major = [JYView loadNibName];
        UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableview.dataSource = self;
        tableview.delegate = self;
        self.tableview = tableview;
        [self.view addSubview:tableview];
        tableview.tableHeaderView = major;
        tableview.showsVerticalScrollIndicator = NO;
        tableview.scrollEnabled = NO;
        tableview.rowHeight = 230;

        __weak typeof(self)weakself = self;
        [major checkBlock:^(UITextField *filed, UILabel *sectionlabel, UILabel *leftlabel, UILabel *rightlabel,UIView *headview) {
            
           tableview.showsVerticalScrollIndicator = YES;
            if ([filed.text isEqualToString:@""]) {
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"http://ios.gaokaoq.com" message:@"请输入专业或职业名" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil]];
                [weakself presentViewController:alert animated:YES completion:nil];
                
            }else{
                
                // 选的是按专业选职业
                if ([filed.placeholder isEqualToString:@"请输入专业名称"]) {
                    self.ISMajor = NO;
                    tableview.scrollEnabled = YES;
                    headview.hidden = NO;
                    sectionlabel.hidden = NO;
                    sectionlabel.text = @"为您推荐对应职业如下:";
                    leftlabel.text = @"职业名称";
                    rightlabel.text = @"职业介绍";
                    // 发送请求
                    NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/job/major2job?q=%@&p=1&pageSize=20",filed.text];
                    urlstring = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
                       
                        NSArray *array = [JYMajorModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
                        [self.DataArray removeAllObjects];
                        [self.DataArray addObjectsFromArray:array];
                        [self.tableview reloadData];
                        
                    }];
                    
                    [filed resignFirstResponder];
    
                }else{// 选的是按职业选专业
                    self.ISMajor = YES;
                    tableview.scrollEnabled = YES;
                    headview.hidden = NO;
                    sectionlabel.hidden = NO;
                    sectionlabel.text = @"为您推荐对应专业如下:";
                    leftlabel.text = @"专业名称";
                    rightlabel.text = @"专业介绍";
                    
                    // 发送请求
                    NSString *urlstring = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/job/job2major?q=%@&p=1&pageSize=20",filed.text];
                    urlstring = [urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
                        
                        NSArray *array = [JYJobModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
                        
                        [self.DataArray1 removeAllObjects];
                        [self.DataArray1 addObjectsFromArray:array];
                        [self.tableview reloadData];
                        
                    }];
                    
                    [filed resignFirstResponder];
                    
            }
                
        }
    
    }];
    
}

// MARK:-数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.ISMajor) {
        
        return self.DataArray1.count;
    }else{
    
        return self.DataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
       JYMajorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JYMajorTableViewCell" owner:nil options:nil]lastObject];
        
    }
    if (self.ISMajor) {
        
        JYJobModel *model = self.DataArray1[indexPath.row];
        cell.model1 = model;
        
    }else{
        
        JYMajorModel *model = self.DataArray[indexPath.row];
        cell.model = model;
    }
    
    
    return cell;
}

- (void)leftBarButtonItemClick
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

- (NSMutableArray *)DataArray1
{
    if (_DataArray1 == nil) {
        
        _DataArray1 = [NSMutableArray array];
    }
  
    return _DataArray1;
}
@end
