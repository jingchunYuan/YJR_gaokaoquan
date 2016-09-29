//
//  JYStudyAnswerViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYStudyAnswerViewController.h"

@interface JYStudyAnswerViewController ()//<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIProgressView *progress;
/// 记录需要改变的label
@property (nonatomic,strong) UILabel *textlabel;

//@property (nonatomic,strong) UITableView *tableview;

@property (nonatomic,strong) UIButton *btn;

@property (nonatomic,strong) UIButton *btn1;

@property (nonatomic,strong) UIButton *btn2;

@property (nonatomic,strong) UIButton *btn3;

@property (nonatomic,strong) UIButton *btn4;

@property (nonatomic,assign) int page;

@end

@implementation JYStudyAnswerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
    self.page = 0;
}

- (void)setUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"复读测试"];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25, 10, 70, 20)];
    [self.view addSubview:label];
    label.text = @"答题进度";
    label.font = [UIFont systemFontOfSize:15];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label.frame), 10, 80, 20)];
    [self.view addSubview:label2];
    label2.text = @"(共计31题)";
    label2.font = [UIFont systemFontOfSize:12];
    
    UIProgressView *progress = [[UIProgressView alloc]initWithFrame:CGRectMake(25, 50, KWIDTH - 2 * 25, 20)];
    [self.view addSubview:progress];
    self.progress = progress;
    progress.trackTintColor = [UIColor lightGrayColor];
    progress.progressTintColor = [UIColor orangeColor];

    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(45, CGRectGetMaxY(progress.frame) + 20,200, 20)];
    [self.view addSubview:label3];
    label3.font = [UIFont systemFontOfSize:12];
    label3.text = @"1/31  我很了解本测试的说明";
    label3.numberOfLines = 0;
    self.textlabel = label3;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label3.frame) + 25, KWIDTH, KHEIGHT)];
    [self.view addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"是的" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setImage:[UIImage imageNamed:@"tuoyuan"] forState:UIControlStateNormal];
    [view addSubview:btn];
    btn.frame = CGRectMake(50, 0, 100, 20);
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"tuoyuanxuanzhong"] forState:UIControlStateSelected];
    self.btn = btn;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"不是" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn1 setImage:[UIImage imageNamed:@"tuoyuan"] forState:UIControlStateNormal];
    [view addSubview:btn1];
    btn1.frame = CGRectMake(50, CGRectGetMaxY(btn.frame) + 30, 100, 20);
    [btn1 setImage:[UIImage imageNamed:@"tuoyuanxuanzhong"] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    self.btn1 = btn1;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"不是" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn2 setImage:[UIImage imageNamed:@"tuoyuan"] forState:UIControlStateNormal];
    [view addSubview:btn2];
    btn2.frame = CGRectMake(50, CGRectGetMaxY(btn1.frame) + 30, 100, 20);
    [btn2 setImage:[UIImage imageNamed:@"tuoyuanxuanzhong"] forState:UIControlStateSelected];
    [btn2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    self.btn2 = btn2;
    btn2.hidden = YES;
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTitle:@"不是" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn3 setImage:[UIImage imageNamed:@"tuoyuan"] forState:UIControlStateNormal];
    [view addSubview:btn3];
    btn3.frame = CGRectMake(50, CGRectGetMaxY(btn2.frame) + 30, 100, 20);
    [btn3 setImage:[UIImage imageNamed:@"tuoyuanxuanzhong"] forState:UIControlStateSelected];
    [btn3 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    self.btn3 = btn3;
    btn3.hidden = YES;
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 setTitle:@"不是" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn4 setImage:[UIImage imageNamed:@"tuoyuan"] forState:UIControlStateNormal];
    [view addSubview:btn4];
    btn4.frame = CGRectMake(50, CGRectGetMaxY(btn3.frame) + 30, 100, 20);
    [btn4 setImage:[UIImage imageNamed:@"tuoyuanxuanzhong"] forState:UIControlStateSelected];
    [btn4 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    self.btn4 = btn4;
    btn4.hidden = YES;
  //  UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label3.frame) + 25, KWIDTH, KHEIGHT)];
  //  [self.view addSubview:tableview];
   // tableview.dataSource = self;
   // tableview.delegate = self;
   // self.tableview = tableview;
    

}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 1;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
   
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
 //       return cell;
//}

- (void)click:(UIButton *)btn
{
    self.page++;
  
    switch (self.page) {
        case 1:
            
            break;
        case 2:
            
            [self.btn setTitle:@"300分以下" forState:UIControlStateNormal];
            [self.btn1 setTitle:@"300-400分" forState:UIControlStateNormal];
            [self.btn2 setTitle:@"400-500分" forState:UIControlStateNormal];
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;

            }
    
      self.progress.progress = (float)(self.page) / 31.0f;
    
}
- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
