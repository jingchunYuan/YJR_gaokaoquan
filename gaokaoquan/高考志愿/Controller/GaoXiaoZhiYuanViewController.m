//
//  GaoXiaoZhiYuanViewController.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/17.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoXiaoZhiYuanViewController.h"
#import "WishCell.h"
#import "ZhiYuanModel+Request.h"
#import "UIImageView+WebCache.h"
#import "HeaderView.h"
//#import "GaoxiaochaxunViewController.h"
#import "GaoxiaochaxunModel+Request.h"
#import "GaoXiaoSearchViewController.h"
#import "JYCollegeRankingsViewController.h"
#import "FenshuViewController.h"
#import "JYJobViewController.h"
#import "MajorViewController.h"
#import "OccupationController.h"
#import "JYMBTIViewController.h"
#import "JYStudyAgainViewController.h"
#import "JYSameNumViewController.h"
#import "TongweiciViewController.h"
#import "TestViewController.h"
#import "AcceptanceProbabilityViewController.h"
#import "AchievementTrackingViewController.h"
#import "ZhiyuanViewController.h"
#import "GenjufenshuViewController.h"

#import "GaoXiaoCollgeViewController.h"

@interface GaoXiaoZhiYuanViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView * clcView;
@property (nonatomic,strong)NSMutableArray * dataArr;
@end

@implementation GaoXiaoZhiYuanViewController
{
    UIImageView * banner;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutUI];
    [self loadData];
    
}

-(void)createHeader:(NSNotification *)text{
    float pointY = [text.userInfo[@"y"] floatValue];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, pointY+10, SCREEN_WIDTH, 10)];
    label.backgroundColor = UIColorRGBA(245, 245, 245, 1);
    [self.view addSubview:label];
}

-(void)layoutUI{
    self.navigationItem.title = @"高校志愿";
    banner = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.2)];
    [self.view addSubview:banner];
    [self createCollectionView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

-(void)loadData{
    [super loadData];
    NSString * url = @"http://api.dev.gaokaoq.com/service/index";
    [ZhiYuanModel RequestWithUrl:url andPara:nil andCallBack:^(ZhiYuanModel *model, NSError *err) {
        if (!err) {
            [banner sd_setImageWithURL:[NSURL URLWithString:model.banner.img]];
            [_dataArr addObjectsFromArray:model.service];
            [_clcView reloadData];
            
        }
        [super stopLoadData];
        
    }];
    
}
#pragma mark - 懒加载
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createCollectionView {
    
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.2+10, SCREEN_WIDTH, SCREEN_HEIGHT*0.8-114)];
    bgView.backgroundColor = [UIColor whiteColor];

    UICollectionViewFlowLayout * flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    self.clcView=[[UICollectionView alloc]initWithFrame:
                  CGRectMake(0,SCREEN_HEIGHT*0.2, SCREEN_WIDTH, SCREEN_HEIGHT*0.8-114) collectionViewLayout:flowLayout];
    self.clcView.dataSource=self;
    self.clcView.delegate=self;
    self.clcView.backgroundColor=[UIColor whiteColor];
    
    //注册cell
    [self.clcView registerNib:[UINib nibWithNibName:@"WishCell" bundle:nil] forCellWithReuseIdentifier:@"WishCell"];
    [self.clcView registerNib:[UINib nibWithNibName:@"HeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.view addSubview:self.clcView];
    
}

#pragma mark -clc协议方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    ServiceModel * service = self.dataArr[section];
    return service.list.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WishCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WishCell" forIndexPath:indexPath];
    ServiceModel * service = _dataArr[indexPath.section];
    WishBtnModel * model =  service.list[0];
    NSLog(@"%@",model.img)
    [cell setModel:service.list[indexPath.item]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //第一组（查询服务）
    if (!indexPath.section&&!indexPath.item) {
        /*
        //高校查询
        GaoXiaoSearchViewController * gxVc = [[GaoXiaoSearchViewController alloc]init];
        ServiceModel * service = _dataArr[indexPath.section];
        WishBtnModel * model = service.list[indexPath.item];
        gxVc.url = model.url;
        [self.navigationController pushViewController:gxVc animated:YES];
        */
        
        GaoXiaoCollgeViewController *gxVC = [[GaoXiaoCollgeViewController alloc] init];
        ServiceModel * service = _dataArr[indexPath.section];
        WishBtnModel * model = service.list[indexPath.item];
        gxVC.url = model.url;
        [self.navigationController pushViewController:gxVC animated:YES];
        
        
    }else if (!indexPath.section && indexPath.item == 1 ){
        NSLog(@"专业查询");
        MajorViewController *major = [[MajorViewController alloc]init];
        [self.navigationController pushViewController:major animated:YES];
    }else if (!indexPath.section && indexPath.item == 2){
        //分数线查询
        FenshuViewController *fenshu = [[FenshuViewController alloc]init];
        [self.navigationController pushViewController:fenshu  animated:YES];
    }else if (!indexPath.section && indexPath.item == 3){
        NSLog(@"职业查询");
        OccupationController *occ = [[OccupationController alloc]init];
        [self.navigationController pushViewController:occ animated:YES];
    }else if (!indexPath.section && indexPath.item == 4){
        //专业职业通
        JYJobViewController *job = [[JYJobViewController alloc]init];
        [self.navigationController pushViewController:job animated:YES];
    }else if (!indexPath.section && indexPath.item == 5){
        //同位次考生去向
        TongweiciViewController *tongwei = [[TongweiciViewController alloc]init];
        [self.navigationController pushViewController:tongwei animated:YES];
    }else if (!indexPath.section && indexPath.item == 6){
        //同分考生去向
        JYSameNumViewController *same = [[JYSameNumViewController alloc]init];
        [self.navigationController pushViewController:same animated:YES];
    }else if (!indexPath.section && indexPath.item == 7){
        //大学排名
        JYCollegeRankingsViewController *college = [[JYCollegeRankingsViewController alloc]init];
        [self.navigationController pushViewController:college animated:YES];
    }
    
    // 第二组（测试体系）
    if (indexPath.section == 1 && indexPath.row == 0) {
        //录取概率测试
        AcceptanceProbabilityViewController *acceptance = [[AcceptanceProbabilityViewController alloc]init];
        [self.navigationController pushViewController:acceptance animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 1){
        //MBTI职业测试
        JYMBTIViewController *MBTI = [[JYMBTIViewController alloc]init];
        [self.navigationController pushViewController:MBTI animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 2){
        //测适合专业
        TestViewController *test = [[TestViewController alloc]init];
        [self.navigationController pushViewController:test animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 3){
        //复读指数测试
        JYStudyAgainViewController *again = [[JYStudyAgainViewController alloc]init];
        [self.navigationController pushViewController:again animated:YES];
    }
    
    //第三组（智能填报）
    else if(indexPath.section == 2 && indexPath.row==0){
        //成绩跟踪系统
        AchievementTrackingViewController * achieveController = [[AchievementTrackingViewController alloc]init];
        [self.navigationController pushViewController:achieveController animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 1){
        //志愿定制报告
        ZhiyuanViewController *zhiyuan = [[ZhiyuanViewController alloc]init];
        [self.navigationController pushViewController:zhiyuan animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 2){
        //vip系统
        
    }else if (indexPath.section == 2 && indexPath.row == 3){
        //双人志愿系统
        
    }else if (indexPath.section == 2 && indexPath.row == 4){
        //模拟志愿填报
        
    }else if (indexPath.section == 2 && indexPath.row == 5){
        //根据分数选大学
        GenjufenshuViewController *genju = [[GenjufenshuViewController alloc]init];
        [self.navigationController pushViewController:genju animated:YES];
    }
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH*0.2, SCREEN_WIDTH*0.28);
}

#pragma mark 有关头脚视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderView * header = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    }
    ServiceModel * model = self.dataArr[indexPath.section];
    header.serviceName.text = model.title;
    return header;

}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 50);
}

//设置cell与边缘的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 20, 10, 20);
    return inset;
}

@end
