//
//  JYTutorInformTableViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorInformTableViewController.h"
#import "JYTutorinformHeadView.h"
#import "TagsFrame.h"
#import "TagsViewCell.h"
#import "JYTutorInformFootView.h"
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@interface JYTutorInformTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tagsTable;

@property (nonatomic, strong) NSArray *tagsArray;

@property (nonatomic, strong) NSMutableArray *tagsFrames;

@property (nonatomic, strong) NSArray *colorArray;

@end

@implementation JYTutorInformTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItem)];
    
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"个人资料"];
    
    JYTutorinformHeadView *head = [[JYTutorinformHeadView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 750)];
    
    UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    self.tagsTable = tableview;
    
    tableview.dataSource = self;
    tableview.delegate = self;
    
    [self.view addSubview:tableview];
    
    self.tagsTable.tableHeaderView = head;
    
    
    JYTutorInformFootView *foot = [[JYTutorInformFootView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, 260)];
    
    self.tagsTable.tableFooterView= foot;
    
    _tagsArray = @[
                   @[@"数学",@"语文",@"英语",@"化学",@"物理",@"生物",@"政治",@"历史",@"地理",@"港澳申请",@"出国留学",@"志愿填报",@"自主招生",@"专业咨询",@"考研",@"学习态度调整",@"考前心态",@"情感问题",@"美术",@"音乐",@"体育",@"高考政策",@"高考录取规则",@"填报技巧",@"职业规划",@"高考数据分析",@"报考政策",@"专业设置",@"招生动态"],
                                    
                   ];
    
    _tagsFrames = [NSMutableArray array];
    _colorArray = @[RGBColor(241, 241, 241),RGBColor(124, 124, 124),RGBColor(150, 150, 150),RGBColor(200, 200, 200),RGBColor(111, 111, 111)];
    
    [_tagsArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        TagsFrame *frame = [[TagsFrame alloc] init];
        
        if (idx == 1) {
            frame.tagsMinPadding = 5;
            frame.tagsMargin = 20;
            frame.tagsLineSpacing = 10;
        }else if (idx == 3){
            frame.tagsMinPadding = 15;
            frame.tagsMargin = 40;
            frame.tagsLineSpacing = 20;
        }
        
        frame.tagsArray = obj;
        
        [_tagsFrames addObject:frame];
    }];

    
}


#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tagsFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TagsViewCell *cell = [TagsViewCell cellWithTableView:tableView];
    cell.tagsFrame = _tagsFrames[indexPath.row];
    cell.contentView.backgroundColor = _colorArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%f",[_tagsFrames[indexPath.row] tagsHeight]);
    return [_tagsFrames[indexPath.row] tagsHeight];
}

- (void)leftBarButtonItem
{

    [self.navigationController popViewControllerAnimated:YES];

}
@end
