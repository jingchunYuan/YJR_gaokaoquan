//
//  MajorViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorViewController.h"
#import "JobListModel+Request.h"
#import "JobListModel.h"
#import "MajorModel.h"
#import "SubMajorModel.h"
#import "RATableViewCell.h"

@interface MajorViewController ()<RATreeViewDelegate,RATreeViewDataSource>

@property (strong, nonatomic)  RATreeView *treeView;
@property (strong, nonatomic)  NSMutableArray *dataArr;

@end

@implementation MajorViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取网络数据
    [self loadData];
    
    // 创建UI
    [self createUI];
    
}

#pragma mark - 
#pragma mark - RATreeViewDelegate,RATreeViewDataSource
- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(nullable id)item {
    if (item == nil) {
        return [self.dataArr count];
    }
    
    if ([treeView levelForCellForItem:item] == 0) {
        JobListModel *model = item;
        NSArray *array = model.jobCategory;
        return [array count];
    }
    else if ([treeView levelForCellForItem:item] == 1) {
        MajorModel *model = item;
        NSArray *array = model.majorCategory;
        return [array count];
    }
    else {
        return 0;
    }
}

- (BOOL)treeView:(RATreeView *)treeView canEditRowForItem:(id)item {
    return NO;
}
- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(nullable id)item {
    
    JobListModel *dataObject = item;
    
    NSInteger level = [treeView levelForCellForItem:item];
    BOOL expanded = [treeView isCellForItemExpanded:item];

    RATableViewCell *cell = [treeView dequeueReusableCellWithIdentifier:NSStringFromClass([RATableViewCell class])];
    [cell setupWithTitle:dataObject.name detailText:@"" level:level additionButtonHidden:!expanded];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(nullable id)item {
    if (item == nil) {
        return [self.dataArr objectAtIndex:index];
    }
    
    if ([treeView levelForCellForItem:item] == 0) {
        JobListModel *model = item;
        NSArray *array = model.jobCategory;
        return array[index];
    }
    else if ([treeView levelForCellForItem:item] == 1) {
        MajorModel *model = item;
        NSArray *array = model.majorCategory;
        return array[index];
    }else {
        return 0;
    }
}

- (void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item {
    
}

- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item {
    return 44;
}

- (BOOL)treeView:(RATreeView *)treeView shouldExpandRowForItem:(id)item {
    return YES;
}

#pragma mark - 
#pragma mark - 数据加载
- (void)loadData {
    
    NSString * url = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/major?level=1"];
    __weak typeof(self) weakSelf = self;
    
    [JobListModel RequestWithUrl:url andPara:nil andCallBack:^(NSArray *arr, NSError *err) {
        if(!err){
            NSLog(@"专业查询 arr = %@", arr);
            [weakSelf.dataArr addObjectsFromArray:arr];
            [weakSelf.treeView reloadData];
        }
        
    }];
    
}

-(void)createUI {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"搜索" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"专业查询"];
    
    // 创建三级列表
    [self.view addSubview:self.treeView];

}

-(void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 
#pragma mark - Getter and Setter
-(RATreeView *)treeView{
    if (!_treeView) {
        _treeView =[[RATreeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _treeView.delegate =self;
        _treeView.dataSource =self;
        [_treeView registerNib:[UINib nibWithNibName:NSStringFromClass([RATableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RATableViewCell class])];
        _treeView.separatorStyle = RATreeViewCellSeparatorStyleNone;
        _treeView.backgroundColor = [UIColor clearColor];
    }
    return _treeView;
}
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

@end
