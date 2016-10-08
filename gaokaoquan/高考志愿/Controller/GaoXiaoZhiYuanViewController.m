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

//#import "OccupationViewController.h"
@interface GaoXiaoZhiYuanViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView * clcView;
@property (nonatomic,strong)NSMutableArray * dataArr;
@end

@implementation GaoXiaoZhiYuanViewController
{
    UIImageView * banner;
    //    UILabel *lab;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self loadData];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createHeader:) name:@"header" object:nil];
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
// MARK:-嘉悦
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
-(void)createCollectionView
{
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.2+10, SCREEN_WIDTH, SCREEN_HEIGHT*0.8-114)];
    bgView.backgroundColor = [UIColor whiteColor];
    //    [self.view addSubview:bgView];
    UICollectionViewFlowLayout * flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    //    flowLayout.minimumInteritemSpacing=10;
    //    flowLayout.minimumLineSpacing=10;
    
    self.clcView=[[UICollectionView alloc]initWithFrame:
                  CGRectMake(0,SCREEN_HEIGHT*0.2, SCREEN_WIDTH, SCREEN_HEIGHT*0.8-114) collectionViewLayout:flowLayout];
    self.clcView.dataSource=self;
    self.clcView.delegate=self;
    self.clcView.backgroundColor=[UIColor whiteColor];
    
    //注册cell
    [self.clcView registerNib:[UINib nibWithNibName:@"WishCell" bundle:nil] forCellWithReuseIdentifier:@"WishCell"];
    //注册组头组尾
    //
    //    //注册脚视图
    
        [self.clcView registerNib:[UINib nibWithNibName:@"HeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    //注册重复使用的headerView和footerView
//    [self.clcView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
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

//-(void)collectionView:(UICollectionView *)collectionView
//    GaoxiaochaxunViewController *vc = [[GaoxiaochaxunViewController alloc]init];
//
//    [self.navigationController pushViewController:vc animated:YES];
//    
//
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (!indexPath.section&&!indexPath.item) {
       
        GaoXiaoSearchViewController * gxVc = [[GaoXiaoSearchViewController alloc]init];
        ServiceModel * service = _dataArr[indexPath.section];
        WishBtnModel * model = service.list[indexPath.item];
        gxVc.url = model.url;
        [self.navigationController pushViewController:gxVc animated:YES];

    }else if (!indexPath.section && indexPath.item == 1 ){
    
        NSLog(@"专业查询");
        MajorViewController *major = [[MajorViewController alloc]init];
        [self.navigationController pushViewController:major animated:YES];
    
    }else if (!indexPath.section && indexPath.item == 2){
    
        FenshuViewController *fenshu = [[FenshuViewController alloc]init];
        
        [self.navigationController pushViewController:fenshu  animated:YES];

    
    
    
    }else if (!indexPath.section && indexPath.item == 3){
    
        NSLog(@"职业查询");
        OccupationController *occ = [[OccupationController alloc]init];
        [self.navigationController pushViewController:occ animated:YES];
    
    
    }else if (!indexPath.section && indexPath.item == 4){
    
        JYJobViewController *job = [[JYJobViewController alloc]init];
        [self.navigationController pushViewController:job animated:YES];
        
    }else if (!indexPath.section && indexPath.item == 5){
    
        TongweiciViewController *tongwei = [[TongweiciViewController alloc]init];
        [self.navigationController pushViewController:tongwei animated:YES];
    
    
    }else if (!indexPath.section && indexPath.item == 6){
    
        JYSameNumViewController *same = [[JYSameNumViewController alloc]init];
        [self.navigationController pushViewController:same animated:YES];
    
    }else if (!indexPath.section && indexPath.item == 7){
    
        JYCollegeRankingsViewController *college = [[JYCollegeRankingsViewController alloc]init];
        
        [self.navigationController pushViewController:college animated:YES];
        
    
    }
    
    // 第二组
    if (indexPath.section == 1 && indexPath.row == 0) {
        
        AcceptanceProbabilityViewController *acceptance = [[AcceptanceProbabilityViewController alloc]init];
        [self.navigationController pushViewController:acceptance animated:YES];
        
    }else if (indexPath.section == 1 && indexPath.row == 1){
    
        JYMBTIViewController *MBTI = [[JYMBTIViewController alloc]init];
        [self.navigationController pushViewController:MBTI animated:YES];
     
    }else if (indexPath.section == 1 && indexPath.row == 2){
      
        TestViewController *test = [[TestViewController alloc]init];
        [self.navigationController pushViewController:test animated:YES];
    
    }else if (indexPath.section == 1 && indexPath.row == 3){
    
        JYStudyAgainViewController *again = [[JYStudyAgainViewController alloc]init];
        [self.navigationController pushViewController:again animated:YES];
       
    }
    //第三组
    else if(indexPath.row==0){
        AchievementTrackingViewController * achieveController = [[AchievementTrackingViewController alloc]init];
        [self.navigationController pushViewController:achieveController animated:YES];
    }else if (indexPath.row == 1){
        ZhiyuanViewController *zhiyuan = [[ZhiyuanViewController alloc]init];
        [self.navigationController pushViewController:zhiyuan animated:YES];
        
    }else if (indexPath.row == 2){
        
        
    }else if (indexPath.row == 3){
        
        
    }else if (indexPath.row == 4){
        
        
    }else if (indexPath.row == 5){
        
        GenjufenshuViewController *genju = [[GenjufenshuViewController alloc]init];
        [self.navigationController pushViewController:genju animated:YES];
    }
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(SCREEN_WIDTH*0.2, SCREEN_WIDTH*0.28);
}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    return 20;
//}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    return 200;
//}


#pragma mark 有关头脚视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderView * header = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"header" object:nil userInfo:@{@"y":@(header.y)}];
    }
    ServiceModel * model = self.dataArr[indexPath.section];
    header.serviceName.text = model.title;
    return header;

}
//设置headerView和footerView
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    UICollectionReusableView *reusableView = nil;
//    
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        UILabel * lab = [[UILabel alloc] init];
//        reusableView = [self.clcView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
//        lab.tag = indexPath.section;
//        ServiceModel * model = self.dataArr[indexPath.section];
//        lab.font = [UIFont systemFontOfSize:20];
//        lab.textColor = UIColorRGBA(64, 64, 64, 1);
//        lab.text = model.title;
//        [reusableView addSubview:lab];
//        UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
//        line.backgroundColor = UIColorRGBA(245, 245, 245, 1);
//        [reusableView addSubview:line];
//        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(reusableView).offset(15);
//            make.top.equalTo(reusableView).offset(25);
//        }];
//    }
//
//    
//    return reusableView;
//}


//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return CGSizeMake(_clcView.width, 100);
//}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 50);
}

//设置cell与边缘的间隔
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 20, 10, 20);
    return inset;
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
