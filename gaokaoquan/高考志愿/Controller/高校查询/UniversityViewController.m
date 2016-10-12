//
//  UniversityViewController.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "UniversityViewController.h"
#import "CollegeCell.h"
#import "CollegeMajorCell.h"
#import "CollegeScoreCell.h"
#import "UIImageView+WebCache.h"
#import "CollegeFirstCell.h"
#import "Masonry.h"
#import "CollegeModel+Request.h"
#import "CollegeMajorFirstCell.h"
#import "TouchPropagatedScrollView.h"
#import "CollegeDongtaiCell.h"
#import "CollegeYinxiangView.h"
#import "CollegeAdmissionPlanCell.h"
#import "CollegeAdmissionPlanFirstCell.h"

#define MENU_HEIGHT 40
#define MENU_BUTTON_WIDTH  80
#define MIN_MENU_FONT  13.f
#define MAX_MENU_FONT  15.f


@interface UniversityViewController ()<UITableViewDelegate,UITableViewDataSource,CollegeDongtaiCellDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UITableView *table;

@end

@implementation UniversityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    
    //创建UI
    [self layoutUI];
    //加载数据
    [self loadData];
    
}

-(void)layoutUI{
    
    self.navigationItem.leftBarButtonItem= [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    //加载表格试图
    [self.view addSubview:self.table];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    
    //院校分数线
    NSString * url1 = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/college/score?id=%@&city_id=1&type=1",_university.Id];
    //专业分数线
    NSString * url2 = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/college/majorScore?id=%@&city=1&type=1&year=2015&p=1&pageSize=20",_university.Id];
    //招生计划
    NSString * url3 = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/college/plan?id=%@&city_id=1&type=1&year=2015&p=1&pageSize=20",_university.Id];
    NSLog(@"高校查询-高校详情 url1=%@, url2=%@ , url3=%@", url1, url2, url3);
    
    __weak typeof(self) weakSelf = self;
    [CollegeModel RequestWithUrl:@[url1,url2,url3] andPara:nil andCallBack:^(NSMutableArray *arr, NSError *err) {
        if(!err){
            
            NSLog(@"loadData = %@, count=%ld", arr, [arr count]);
            
            [weakSelf.dataArr addObjectsFromArray:arr];
            [weakSelf.table reloadData];
        }
    }];
    
}

#pragma makr -
#pragma mark - UITableViewDelegate,UITableViewDataSource
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"section :%ld, row : %ld", (long)indexPath.section, (long)indexPath.row);
    
    if (indexPath.section==0) {
        
        CollegeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollgeCell"];
        if (!cell) {
            cell = [[CollegeCell alloc] init];
        }
        [cell.HeadImage sd_setImageWithURL:[NSURL URLWithString:_university.logo]];
        cell.CollegLb.text = _university.name;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if(indexPath.section == 1){
        
        //录取、概括、校友印象、校园风光
        CollegeDongtaiCell *dongCell = [tableView dequeueReusableCellWithIdentifier:@"CollegeDongtaiCell"];
        dongCell.delegate = self;
        if (!dongCell) {
            dongCell = [[CollegeDongtaiCell alloc]init];
            dongCell.delegate = self;
        }
        dongCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return dongCell;
        
    }else if(indexPath.section == 2){
        
        //院校分数线
        if (indexPath.row) {
            
            CollegeScoreCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollegeScoreCell"];
            if(!cell){
                cell = [[CollegeScoreCell alloc] init];
            }
            [cell setModel:_dataArr[indexPath.section-2][indexPath.row - 1]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }else{
            
            CollegeFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:@"CollegeFirstCell"];
            if (!firstCell) {
                firstCell = [[CollegeFirstCell alloc]init];
            }
            firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return firstCell;
        }
        
    }
    else if(indexPath.section == 3){
        
        //专业分数线
        if (indexPath.row) {
            CollegeMajorCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollegeMajorCell"];
            if(!cell){
                cell = [[CollegeMajorCell alloc] init];
            }
            [cell setModel:_dataArr[indexPath.section-2][indexPath.row - 1]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            
            CollegeMajorFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:@"CollegeMajorFirstCell"];
            if (!firstCell) {
                firstCell = [[CollegeMajorFirstCell alloc]init];
            }
            firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return firstCell;
        }
        
    }
    else if (indexPath.section == 4) {
        
        //招生计划
        if (indexPath.row) {
            CollegeAdmissionPlanCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollegeAdmissionPlanCell"];
            if(!cell){
                cell = [[CollegeAdmissionPlanCell alloc] init];
            }
            [cell setModel:_dataArr[indexPath.section-2][indexPath.row - 1]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else {
            CollegeAdmissionPlanFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:@"CollegeAdmissionPlanFirstCell"];
            if (!firstCell) {
                firstCell = [[CollegeAdmissionPlanFirstCell alloc]init];
            }
            firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return firstCell;
        }
        
    }
    
    return nil;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArr.count) {
        
        if (section == 0 || section == 1) {
            return 1;
        }else {
            
            return [self.dataArr[section-2] count] + 1;
        }
        
    }
    return 1;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        return 200;
    }
    if (indexPath.section==2) {
        if (indexPath.row) {
            return 32;
        }else {
            return 100;
        }
    }
    if (indexPath.section==3) {
        if (indexPath.row) {
            return 30;
        }else {
            return 100;
        }
    }
    if (indexPath.section==4) {
        if (indexPath.row) {
            return 30;
        }else {
            return 100;
        }
    }
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectZero];
    view.backgroundColor = UIColorRGBA(245, 245, 245, 1);
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}

#pragma mark - 
#pragma mark - CollegeDongtaiCellDelegate
- (void)buttonClickAction:(CollegeDongtaiCell *)cell btnTag:(int)tag {
    NSLog(@"UniversityViewController tag = %d", tag);
    
    switch (tag) {
        case 101:
            //录取
            
            break;
        case 102:
            //概括
            
            break;
        case 103:
            //校友印象
            
            break;
        case 104:
            //校园风光
            
            break;
            
        default:
            break;
    }
    
}

- (void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 
#pragma mark -  Getter and Setter
-(UITableView *)table{
    if (!_table) {
        _table =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
        _table.delegate =self;
        _table.dataSource =self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_table registerNib:[UINib nibWithNibName:@"CollegeCell" bundle:nil] forCellReuseIdentifier:@"CollgeCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeDongtaiCell" bundle:nil] forCellReuseIdentifier:@"CollegeDongtaiCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeMajorCell" bundle:nil] forCellReuseIdentifier:@"CollegeMajorCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeScoreCell" bundle:nil] forCellReuseIdentifier:@"CollegeScoreCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeFirstCell" bundle:nil] forCellReuseIdentifier:@"CollegeFirstCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeMajorFirstCell" bundle:nil] forCellReuseIdentifier:@"CollegeMajorFirstCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeAdmissionPlanCell" bundle:nil] forCellReuseIdentifier:@"CollegeAdmissionPlanCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeAdmissionPlanFirstCell" bundle:nil] forCellReuseIdentifier:@"CollegeAdmissionPlanFirstCell"];
    }
    return _table;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

@end
