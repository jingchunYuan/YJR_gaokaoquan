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

#define MENU_HEIGHT 40
#define MENU_BUTTON_WIDTH  80
#define MIN_MENU_FONT  13.f
#define MAX_MENU_FONT  15.f


@interface UniversityViewController ()<UITableViewDelegate,UITableViewDataSource,CollegeDongtaiCellDelegate>


//@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic,strong) NSMutableArray * dataArr;
@property (strong, nonatomic)  UITableView *table;
@end

@implementation UniversityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self loadData];
    
}



-(void)layoutUI{
    [self.view addSubview:self.table];
    
}
-(UITableView *)table{
    if (!_table) {
        _table =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _table.delegate =self;
        _table.dataSource =self;
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_table registerNib:[UINib nibWithNibName:@"CollegeCell" bundle:nil] forCellReuseIdentifier:@"CollgeCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeDongtaiCell" bundle:nil] forCellReuseIdentifier:@"CollegeDongtaiCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeMajorCell" bundle:nil] forCellReuseIdentifier:@"CollegeMajorCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeScoreCell" bundle:nil] forCellReuseIdentifier:@"CollegeScoreCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeFirstCell" bundle:nil] forCellReuseIdentifier:@"CollegeFirstCell"];
        [_table registerNib:[UINib nibWithNibName:@"CollegeMajorFirstCell" bundle:nil] forCellReuseIdentifier:@"CollegeMajorFirstCell"];
    
    }
    return _table;
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
        
        CollegeDongtaiCell *dongCell = [tableView dequeueReusableCellWithIdentifier:@"CollegeDongtaiCell"];
        dongCell.delegate = self;

        if (!dongCell) {
            dongCell = [[CollegeDongtaiCell alloc]init];
            dongCell.delegate = self;
        }
        dongCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return dongCell;
        
    }else if(indexPath.section == 2){
        if (indexPath.row) {
            CollegeScoreCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollegeScoreCell"];
            if(!cell){
                cell = [[CollegeScoreCell alloc] init];
            }
            [cell setModel:_dataArr[indexPath.section-2][indexPath.row]];
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
        if (indexPath.row) {
            CollegeMajorCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CollegeMajorCell"];
            if(!cell){
                cell = [[CollegeMajorCell alloc] init];
            }
            [cell setModel:_dataArr[indexPath.section-2][indexPath.row]];
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
    return nil;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArr.count) {
        
        if (section == 0 || section == 1) {
            return 1;
        }else {
            
            return [self.dataArr[section-2] count];
        }
        
    }
    return 1;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
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











@end
