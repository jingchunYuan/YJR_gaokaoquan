//
//  OccupationController.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "OccupationController.h"
#import "OccupationCell.h"
#import "JobListModel+Request.h"


@interface OccupationController ()<RATreeViewDelegate,RATreeViewDataSource>

@property (nonatomic, strong)  NSMutableArray *dataArr;
@property (strong, nonatomic)  RATreeView *treeView;

@end

@implementation OccupationController
{
    UIImageView *banner;
    UITableView *table;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取网络数据
    [self loadData];
    // 创建UI
    [self createUI];

}

-(void)createUI{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"搜索" highlightedImage:nil title:nil target:self action:@selector(rightBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"职业查询"];
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    imageView.image = [UIImage imageNamed:@"banner01"];
    [_treeView addSubview:imageView];
    // 添加表格
    [self.view addSubview:self.treeView];
    
}

-(void)loadData{
    __weak typeof(self) weakSelf = self;
    [JobListModel RequestWithUrl:@"http://api.dev.gaokaoq.com/job/index" andPara:nil andCallBack:^(NSArray *arr, NSError *err) {
        if (!err) {
            [weakSelf.dataArr addObjectsFromArray:arr];
            [weakSelf.treeView reloadData];
        }
    }];
    
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
    else {
        return 0;
    }
}

- (BOOL)treeView:(RATreeView *)treeView canEditRowForItem:(id)item {
    return NO;
}
- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(nullable id)item {
    
    JobListModel *dataObject = item;
    NSLog(@"dataObject.name=%@", dataObject.name);
    
    NSInteger level = [treeView levelForCellForItem:item];
    BOOL expanded = [treeView isCellForItemExpanded:item];
    NSLog(@"level=%ld", (long)level);

    OccupationCell *cell = [treeView dequeueReusableCellWithIdentifier:NSStringFromClass([OccupationCell class])];
    if (level == 0) {
        [cell setupWithTitle:dataObject.job.name detailText:@"" level:level additionButtonHidden:!expanded];
        cell.bgView.layer.borderColor = [UIColor grayColor].CGColor;
        cell.bgView.layer.borderWidth = 1;
    }else {
        [cell setupWithTitle:dataObject.name detailText:@"" level:level additionButtonHidden:!expanded];
        cell.bgView.layer.borderColor = [UIColor clearColor].CGColor;
        cell.bgView.layer.borderWidth = 1;
    }
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
    else {
        return 0;
    }
}

- (void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item {
    
}

- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item {
    return 60;
}

- (BOOL)treeView:(RATreeView *)treeView shouldExpandRowForItem:(id)item {
    return YES;
}


#pragma mark -
#pragma mark - Getter and Setter
-(RATreeView *)treeView{
    if (!_treeView) {
        
        _treeView =[[RATreeView alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH-20, SCREEN_HEIGHT-164)];
        _treeView.delegate =self;
        _treeView.dataSource =self;
        [_treeView registerNib:[UINib nibWithNibName:NSStringFromClass([OccupationCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([OccupationCell class])];
        _treeView.separatorStyle = RATreeViewCellSeparatorStyleNone;
        _treeView.layer.borderColor = [UIColor grayColor].CGColor;
        _treeView.layer.borderWidth = 1;
        
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
