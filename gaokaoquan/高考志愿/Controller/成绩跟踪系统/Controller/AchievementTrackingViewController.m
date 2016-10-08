//
//  AchievementTrackingViewController.m
//  gaokaoquan
//
//  Created by Nevis on 2016/10/5.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AchievementTrackingViewController.h"
#import "BLBrokenLineRunChartTool.h"
#import "ScoreModel+Request.h"
@interface AchievementTrackingViewController ()<BLBrokenLineRunChartToolDelegate>

@end

@implementation AchievementTrackingViewController
{
    NSArray * arrays;
    BLBrokenLineRunChartTool * blbchartTool;
    UIButton * ContrastBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self loadData];
}
-(void)layoutUI{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"成绩跟踪系统";
    self.view.backgroundColor = UIColorRGBA(245, 245, 245, 1);
    UIButton * provinceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    provinceBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH/2, 40);
    [provinceBtn setTitle:@"对比省控线" forState:UIControlStateNormal];
    provinceBtn.backgroundColor = UIColorRGB(26, 178, 254);
    [provinceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:provinceBtn];
    
    UIButton * UniversitiesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UniversitiesBtn.frame = CGRectMake( SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 40);
    [UniversitiesBtn setTitle:@"对比院校分数线" forState:UIControlStateNormal];
    UniversitiesBtn.backgroundColor = [UIColor whiteColor];
    [UniversitiesBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:UniversitiesBtn];
    
    UIButton * adrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    adrBtn.frame = CGRectMake(20, 40+provinceBtn.y+10, SCREEN_WIDTH-40, 40);
    [adrBtn setTitle:@"北京" forState:UIControlStateNormal];
    adrBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    adrBtn.contentEdgeInsets = UIEdgeInsetsMake(0,20, 0, 0);
    adrBtn.backgroundColor = [UIColor whiteColor];
    
    [adrBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:adrBtn];
    
    UIButton * subjectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    subjectBtn.frame = CGRectMake(20, 40+adrBtn.y+10, SCREEN_WIDTH-40, 40);
    [subjectBtn setTitle:@"文科" forState:UIControlStateNormal];
    subjectBtn.backgroundColor = [UIColor whiteColor];
    subjectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    subjectBtn.contentEdgeInsets = UIEdgeInsetsMake(0,20, 0, 0);
    [subjectBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:subjectBtn];
    
    ContrastBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ContrastBtn.frame = CGRectMake(20, 40+subjectBtn.y+10, SCREEN_WIDTH-40, 40);
    [ContrastBtn setTitle:@"立即对比" forState:UIControlStateNormal];
    ContrastBtn.backgroundColor = UIColorRGBA(66,179,227,1);
    [ContrastBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:ContrastBtn];
    
    blbchartTool = [[BLBrokenLineRunChartTool alloc]init];
    blbchartTool.brokenLineRunChartToolDelegate = self;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadData{
    __weak typeof(self) weakSelf = self;
    [ScoreModel RequestWithUrl:@"http://api.dev.gaokaoq.com/track/scores.html?city=1&type=2" andPara:nil andCallBack:^(NSArray *arr, NSError *err) {
        if (!err) {
            arrays = arr;
            [weakSelf.view addSubview: [blbchartTool getChatLineViewWithFrame:CGRectMake(0, ContrastBtn.y+40+10, weakSelf.view.frame.size.width, 300)]];
//            [blbchartTool setData];
        }
    }];
}
-(NSArray *)brokenLineRunChartDataResource{
   
    return arrays;
}
-(int)brokenLineRunChartYNum{
    return 6;
}
-(NSArray *)brokenLineRunChartColor{
    return @[[UIColor blackColor],[UIColor greenColor],[UIColor orangeColor]];
}
-(NSArray *)brokenLineRunChartYearArr{
    return nil;
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
