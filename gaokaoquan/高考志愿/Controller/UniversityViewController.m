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
@interface UniversityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic,strong) NSMutableArray * dataArr;
@end

@implementation UniversityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self loadData];
}
-(void)layoutUI{
    _table.delegate = self;
    _table.dataSource = self;
    _table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_table registerNib:[UINib nibWithNibName:@"CollegeCell" bundle:nil] forCellReuseIdentifier:@"CollgeCell"];
    [_table registerNib:[UINib nibWithNibName:@"CollegeMajorCell" bundle:nil] forCellReuseIdentifier:@"CollegeMajorCell"];
    [_table registerNib:[UINib nibWithNibName:@"CollegeScoreCell" bundle:nil] forCellReuseIdentifier:@"CollegeScoreCell"];
    [_table registerNib:[UINib nibWithNibName:@"CollegeFirstCell" bundle:nil] forCellReuseIdentifier:@"CollegeFirstCell"];
    [_table registerNib:[UINib nibWithNibName:@"CollegeMajorFirstCell" bundle:nil] forCellReuseIdentifier:@"CollegeMajorFirstCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}
-(void)loadData{
    NSString * url1 = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/college/score?id=%@&city_id=1&type=1",_university.Id];
    NSString * url2 = [NSString stringWithFormat:@"http://api.dev.gaokaoq.com/college/majorScore?id=%@&city=1&type=1&year=2015&p=1&pageSize=20",_university.Id];
    
    __weak typeof(self) weakSelf = self;
    [CollegeModel RequestWithUrl:@[url1,url2] andPara:nil andCallBack:^(NSMutableArray *arr, NSError *err) {
        if(!err){
            [weakSelf.dataArr addObjectsFromArray:arr];
            [weakSelf.table reloadData];
        }
    }];
    
}
#pragma mark - table delegate
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        CollegeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollgeCell"];
        if (!cell) {
            cell = [[CollegeCell alloc] init];
        }
        [cell.HeadImage sd_setImageWithURL:[NSURL URLWithString:_university.logo]];
        cell.CollegLb.text = _university.name;
        return cell;
        
        
    }else if(indexPath.section == 1){
        if (indexPath.row) {
            CollegeScoreCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollegeScoreCell"];
            if(!cell){
                cell = [[CollegeScoreCell alloc] init];
            }
            [cell setModel:_dataArr[indexPath.section-1][indexPath.row]];
            return cell;
        }else{
            
            CollegeFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:@"CollegeFirstCell"];
            if (!firstCell) {
                firstCell = [[CollegeFirstCell alloc]init];
            }
            return firstCell;
        }
        
    }
    else if(indexPath.section == 2){
        if (indexPath.row) {
            CollegeMajorCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollegeMajorCell"];
            if(!cell){
                cell = [[CollegeMajorCell alloc] init];
            }
            [cell setModel:_dataArr[indexPath.section-1][indexPath.row]];
            return cell;
        }else{
            
            CollegeMajorFirstCell * firstCell = [tableView dequeueReusableCellWithIdentifier:@"CollegeMajorFirstCell"];
            if (!firstCell) {
                firstCell = [[CollegeMajorFirstCell alloc]init];
            }
            return firstCell;
        }
        
    }
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArr.count) {
        return section? [self.dataArr[section-1] count]:1;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 200;
    }
    return 50;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView * containerView = [[UIView alloc] init];
//    if (section == 1) {
//        containerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 300);
//        containerView.backgroundColor = [UIColor grayColor];
//        NSArray * btnTitles = @[@"录取",@"概况",@"校园印象",@"校园风光"];
//        float width = SCREEN_WIDTH/4;
//        UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, width, 1)];
//        line.backgroundColor = [UIColor blueColor];
//        for (int i = 0; i<4; i++) {
//            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            
//            btn.frame = CGRectMake(width*i, 10, width, 30);
//            [btn setTitle:btnTitles[i] forState:UIControlStateNormal];
//            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//            btn.backgroundColor = [UIColor whiteColor];
//            [containerView addSubview:btn];
//        }
//        UIView * tagView = [[UIView alloc]initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, 70)];
//        UILabel * lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 63, 15)];
//        lb.text = @"院校分数线";
//        [tagView addSubview:lb];
//        NSArray * titles = @[@"理科  ▽",@"北京  ▽"];
//        for (int i=0; i<2; i++) {
//            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            btn.frame = CGRectMake(SCREEN_WIDTH-150, 5, 60, 30);
//            [btn setTitle:titles[i] forState:UIControlStateNormal];
//            [containerView addSubview:btn];
//        }
//        
//        [containerView addSubview:line];
//        
//    }
//    return containerView;
//}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectZero];
    view.backgroundColor = UIColorRGBA(245, 245, 245, 1);
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0f;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
