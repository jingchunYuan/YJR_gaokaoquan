//
//  JYTutorAnswerViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorAnswerViewController.h"
#import "JYMyAnswerView.h"
#import "JYTutorAnswerCountModel.h"
#import "JYTutorAnswerModel.h"
#import "JYTutorHDCountModel.h"
#import "JYTutorHDModel.h"
#define KTWURL  @"http://api.dev.gaokaoq.com/AdvisorCenter/ask"
#define KHDURL  @"http://api.dev.gaokaoq.com/AdvisorCenter/askAnswer"
@interface JYTutorAnswerViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

/// 提问的数组
@property (nonatomic,strong) NSMutableArray *Array;
/// 提问的总个数
@property (nonatomic,strong) NSMutableArray *CountArray;

/// 回答的数组
@property (nonatomic,strong) NSMutableArray *HDArray;

/// 记录回答按钮
@property (nonatomic ,strong) UIButton *button;

/// 记录提问按钮
@property (nonatomic,strong) UIButton *TWBtn;

@property (nonatomic,strong) UITableView *tableview;
@end

@implementation JYTutorAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [[UIButton alloc]init];
    
    self.button = button;
    
    [self.view addSubview:button];
    
    
    UIButton *TWbtn = [[UIButton alloc]init];
    
    self.TWBtn = TWbtn;
    
    [self.view addSubview:TWbtn];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    
    self.tableview = tableview;
    
    [self.view addSubview:tableview];
    
    tableview.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    self.tableView = tableview;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"我的提问"];
    
    
    JYMyAnswerView *answer = [JYMyAnswerView loadNib];
    
    answer.frame = CGRectMake(0, 0, KWIDTH, 60);
    
    [self.view addSubview:answer];

    
    
    
    [answer MyTWCilick:^{
        
        self.navigationItem.titleView = [self.view titleWithNavigat:@"我的提问"];
        
        answer.TWbtn.backgroundColor = [UIColor redColor];
        
        answer.HDbtn.backgroundColor = [UIColor lightGrayColor];
        
        answer.TDWbtn.backgroundColor = [UIColor lightGrayColor];
        
        self.TWBtn.selected = YES;
        self.button.selected = NO;
        
        [tableview.footer beginRefreshing];
        
        [tableview reloadData];
        
    }];
    
    
    [answer MyHDClick:^{
        
        
        self.navigationItem.titleView = [self.view titleWithNavigat:@"我的问答"];

        answer.HDbtn.backgroundColor = [UIColor redColor];
        
        answer.TWbtn.backgroundColor = [UIColor lightGrayColor];
        
        answer.TDWbtn.backgroundColor = [UIColor lightGrayColor];
        
        self.button.selected = YES;
        self.TWBtn.selected = NO;
         [tableview.footer beginRefreshing];
        [tableview reloadData];
        
        
    }];
    
    
    [answer MyClick:^{
        
        self.navigationItem.titleView = [self.view titleWithNavigat:@"提到我"];
        
        answer.TDWbtn.backgroundColor = [UIColor redColor];
        
        answer.HDbtn.backgroundColor = [UIColor lightGrayColor];
        
        answer.TWbtn.backgroundColor = [UIColor lightGrayColor];
        
    }];
    
    
    // 请求提问数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/AdvisorCenter/ask" parameters:nil callback:^(id responseObject, NSError *error) {
        
        JYTutorAnswerCountModel *countModel = [JYTutorAnswerCountModel mj_objectWithKeyValues:responseObject[@"data"]];
    
        [self.CountArray addObject:countModel];
        
        
        [self.Array addObjectsFromArray:countModel.list];
        
    
        
        [answer.TWbtn setTitle:[NSString stringWithFormat:@"提问(%d)",countModel.count] forState:UIControlStateNormal];
        
        
        [tableview reloadData];
        
        
    }];
    
    
    // 请求回答数据
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/AdvisorCenter/askAnswer" parameters:nil callback:^(id responseObject, NSError *error) {
       
         
        JYTutorHDCountModel *model = [JYTutorHDCountModel mj_objectWithKeyValues:responseObject[@"data"]];
        
        [self.HDArray addObjectsFromArray:model.list];
        
        
        [answer.HDbtn setTitle:[NSString stringWithFormat:@"回答(%d)",model.count] forState:UIControlStateNormal];
        
        [tableview reloadData];
        
        
    }];
    
   // 上拉加载
    tableview.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        if (self.TWBtn.selected) {
        
            [self updata:KTWURL];
            
        }else{
        
            [self updata:KHDURL];
        
        }
        
     
    }];
    
    
}

- (void)updata:(NSString *)urlstring
{
   
   [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:urlstring parameters:nil callback:^(id responseObject, NSError *error) {
      
       
       if (self.TWBtn.selected) {
           
           JYTutorAnswerCountModel *countModel = [JYTutorAnswerCountModel mj_objectWithKeyValues:responseObject[@"data"]];
           
           [self.CountArray addObject:countModel];
           
           
           [self.Array addObjectsFromArray:countModel.list];
           

           [self.tableview reloadData];
           
           [self.tableview.footer endRefreshing];
           
       }else{
       
       
           JYTutorHDCountModel *model = [JYTutorHDCountModel mj_objectWithKeyValues:responseObject[@"data"]];
           
           [self.HDArray addObjectsFromArray:model.list];
           
           [self.tableview reloadData];
           
           [self.tableview.footer endRefreshing];
       }
       
       
   }];


}


// MARK:-数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.button.selected) {
        
        return self.HDArray.count;
    }else{
    
    return self.Array.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    if (self.button.selected) {
        
        JYTutorHDModel *model = self.HDArray[indexPath.row];
        
        cell.textLabel.text = model.info;
        
        cell.textLabel.font = [UIFont systemFontOfSize:10];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
        
        label.text = [NSString stringWithFormat:@"%@条回复", model.comment_total];
        
        label.font = [UIFont systemFontOfSize:10];
        
        cell.accessoryView = label;

        
    }else{
    
    
    JYTutorAnswerModel *model = self.Array[indexPath.row];
    
    cell.textLabel.text = model.title;
    
    cell.textLabel.font = [UIFont systemFontOfSize:10];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
    
    label.text = [NSString stringWithFormat:@"%@条回复", model.comment_total];
    
    label.font = [UIFont systemFontOfSize:10];
    
    cell.accessoryView = label;
    
    }
    return cell;
}


- (NSMutableArray *)HDArray
{
    if (_HDArray == nil) {
        
        _HDArray = [NSMutableArray array];
        
    }


    return _HDArray;
}

- (NSMutableArray *)CountArray
{
    if (_CountArray == nil) {
        
        _CountArray = [NSMutableArray array];
        
    }


    return _CountArray;
}

- (NSMutableArray *)Array
{
    
    if (_Array == nil) {
        
        _Array = [NSMutableArray array];
        
        
    }
    
    return _Array;
}


-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}



@end
