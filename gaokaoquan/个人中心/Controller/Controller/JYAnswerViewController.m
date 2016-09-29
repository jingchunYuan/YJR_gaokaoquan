//
//  JYAnswerViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYAnswerViewController.h"
#import "JYMyAnswerView.h"
#import "JYAnswerModel.h"
#import "JYAnswerCountModel.h"
#import "JYHDCountModel.h"
#import "JYHDModel.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#define KTWURL @"http://api.dev.gaokaoq.com/user_center/ask?p=1&pageSize=20"
#define KHDURL @"http://api.dev.gaokaoq.com/user_center/askAnswer?p=1&pageSize=20"
@interface JYAnswerViewController()<UITableViewDataSource,UITableViewDelegate>

/// 存放提问数据数组
@property (nonatomic,strong) NSMutableArray *Array;

@property (nonatomic,strong)NSMutableArray *ArrayCount;

/// 存放回答数据
@property (nonatomic,strong) NSMutableArray *HDArray;

/// 存放count数组
@property (nonatomic,strong) NSMutableArray *HDCount;

/// 记录提问按钮
@property (nonatomic,strong) UIButton *TWButton;

@property (nonatomic,strong) UIButton *HDButton;

@property (nonatomic,strong) UIButton *TDWButton;

@property (nonatomic,strong) UITableView *tableView;

@end
@implementation JYAnswerViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIButton *but = [[UIButton alloc]init];
    
    self.HDButton = but;
    
    [self.view addSubview:but];
    
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tableview];
    
    tableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    self.tableView = tableview;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"我的提问"];
    

    JYMyAnswerView *answer = [JYMyAnswerView loadNib];
    
    answer.frame = CGRectMake(0, 0, KWIDTH, 60);
    
    [self.view addSubview:answer];
    
    // 请求数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:KTWURL parameters:nil callback:^(id responseObject, NSError *error) {
        
        // NSArray *arr = responseObject[@"data"][@"list"];
        
        JYAnswerCountModel *AnswerCount = [JYAnswerCountModel mj_objectWithKeyValues:responseObject[@"data"]];
        
        
        [self.ArrayCount addObject:AnswerCount];
        
        
        [self.Array addObjectsFromArray:AnswerCount.list];
        
        
        
        JYAnswerCountModel *model = self.ArrayCount[0];
        
        [answer.TWbtn setTitle:[NSString stringWithFormat:@"提问(%d)",model.count] forState:UIControlStateNormal];
        
        // 刷新
        [tableview reloadData];
        
        
    }];
    

   
        
    
    // 请求数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:KHDURL parameters:nil callback:^(id responseObject, NSError *error) {
        
        JYHDCountModel *count = [JYHDCountModel mj_objectWithKeyValues:responseObject[@"data"]];
        
        
        [self.HDCount addObject:count];
        

        [self.HDArray addObjectsFromArray:count.list];
        
        JYHDCountModel *count1 = self.HDCount[0];
        
        NSString *str = [NSString stringWithFormat:@"回答(%d)",count1.count];
        
        [answer.HDbtn setTitle:str forState:UIControlStateNormal];

        
        [tableview reloadData];
        
    }];
    

    
    
    // 执行回调
    __weak typeof(self)weakself = self;
    
      [answer MyTWCilick:^{
          
        weakself.navigationItem.titleView = [self.view titleWithNavigat:@"我的提问"];
          
         answer.TWbtn.backgroundColor = [UIColor redColor];
          
          answer.HDbtn.backgroundColor = [UIColor lightGrayColor];
          
          answer.TDWbtn.backgroundColor = [UIColor lightGrayColor];
          
          
          
      }];
    
    
    [answer MyHDClick:^{
        
        
        
        weakself.navigationItem.titleView = [self.view titleWithNavigat:@"我的回答"];
        
//        self.HDButton.backgroundColor = [UIColor redColor];


        answer.HDbtn.backgroundColor = [UIColor redColor];

        answer.TWbtn.backgroundColor = [UIColor lightGrayColor];

        answer.TDWbtn.backgroundColor = [UIColor lightGrayColor];

        
//        answer.HDbtn = self.HDButton;
        
        weakself.HDButton.selected = YES;

        [tableview reloadData];
        
    }];
    
    
    [answer MyClick:^{
        weakself.navigationItem.titleView = [weakself.view titleWithNavigat:@"提到我的"];
        
        answer.TDWbtn.backgroundColor = [UIColor redColor];
       
        answer.HDbtn.backgroundColor = [UIColor lightGrayColor];
        
        answer.TWbtn.backgroundColor = [UIColor lightGrayColor];
        
    }];
    
    
    
}

// MARK:-更新数据
- (void)upData: (NSString *)urlstring
{

        [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
            
            NSArray *dataArray = [JYAnswerModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
            
                for (JYAnswerModel *model in dataArray) {
                
                [self.Array addObject:model];
            
            // 刷新
            [self.tableView reloadData];
            }
            [self.tableView.footer endRefreshing];
        
    }];

}

// MARK:-数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.HDButton.selected) {
        
        
        return self.HDArray.count;
        
    }else{
        
    
  return self.Array.count;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    
    if (self.HDButton.selected) {
        
        
        JYHDModel *model = self.HDArray[indexPath.row];
        
        cell.textLabel.text = model.info;
        
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
        
        label.text = [NSString stringWithFormat:@"%@条回复", model.comment_total];
        
        label.font = [UIFont systemFontOfSize:10];
        
        cell.accessoryView = label;

        
        
    }else{
    
    JYAnswerModel *model = self.Array[indexPath.row];
        
    cell.textLabel.text = model.title;
    
    cell.textLabel.font = [UIFont systemFontOfSize:13];
   
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    
    label.text = [NSString stringWithFormat:@"%@条回复", model.comment_total];
    
    label.font = [UIFont systemFontOfSize:10];
    
    cell.accessoryView = label;
        
     }
    return cell;
}

-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (NSMutableArray *)HDCount
{

    if (_HDCount == nil) {
        
        _HDCount = [NSMutableArray array];
        
    }


    return _HDCount;
}
- (NSMutableArray *)HDArray
{

    if (_HDArray == nil) {
        
        
        _HDArray = [NSMutableArray array];
    }

    return _HDArray;
}

- (NSMutableArray *)ArrayCount
{
    if (_ArrayCount == nil) {
        
        
        _ArrayCount = [NSMutableArray array];
    }


return _ArrayCount;
}

- (NSMutableArray *)Array
{

    if (_Array == nil) {
        
        _Array = [NSMutableArray array];
        
        
    }

    return _Array;
}

@end
