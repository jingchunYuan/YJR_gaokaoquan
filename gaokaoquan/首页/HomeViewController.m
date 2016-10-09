//
//  HomeViewController.m
//  gaokaoquan
//
//  Created by 程伟利 on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "HomeViewController.h"
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"
#import "HotTeacherView.h"
#import "FengyunViewController.h"


#define ScrollViewHeight  200


@interface HomeViewController ()<SGFocusImageFrameDelegate,HotTeacherViewDelegate> {
    
    UIScrollView *_scrollView;
    SGFocusImageFrame *_focusImage;
    UIView *_view3;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"高考圈";
    
    // 创建UI
    [self creatUIMethod];
    
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CGRect rect = self . navigationController . navigationBar . frame ;
    self . navigationController . navigationBar . frame = CGRectMake ( rect . origin . x , rect . origin . y , rect . size . width , 20 ) ;
}
#pragma mark - 轮播图点击事件
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(SGFocusImageItem *)item {
    NSLog(@"轮播图 tag = %d", item.tag);
    
}

- (void)btnClick:(UIButton *)btn {
    
    switch (btn.tag) {
        case 100:
            NSLog(@"高效查询 : %d",btn.tag);
            
            break;
        case 101:
            NSLog(@"根据分数选大学 : %d",btn.tag);
            
            break;
        case 102:
            NSLog(@"分数线查询 : %d",btn.tag);
            
            break;
        case 103:
            NSLog(@"专业查询 : %d",btn.tag);
            
            break;
        case 104:
            NSLog(@"录取概率测试 : %d",btn.tag);
            
            break;
        case 105:
            NSLog(@"测适合专业 : %d",btn.tag);
            
            break;
        case 106:
            NSLog(@"职业信息库 : %d",btn.tag);
            
            break;
        case 107:
            NSLog(@"高考攻略 : %d",btn.tag);
            
            break;
            
        default:
            break;
            
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imageClick:(UIButton *)sender {
    
    switch (sender.tag) {
        case 200:
            NSLog(@"第一张：%d", sender.tag);
            break;
        case 201:
            NSLog(@"第二张：%d", sender.tag);
            break;
            
        default:
            break;
    }
    
    
}


- (void)creatUIMethod {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.scrollEnabled = YES;
    _scrollView.bounces = NO;
    //大小
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_scrollView];
    
    // 轮播图
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:5];
    SGFocusImageItem *imageItem_last = [[SGFocusImageItem alloc] initWithTitle:nil image:@"banner_3" tag:-1];
    [itemArray addObject:imageItem_last];
    SGFocusImageItem *imageItem2 = [[SGFocusImageItem alloc] initWithTitle:nil image:@"banner_1" tag:0];
    [itemArray addObject:imageItem2];
    SGFocusImageItem *imageItem3 = [[SGFocusImageItem alloc] initWithTitle:nil image:@"banner_2" tag:1];
    [itemArray addObject:imageItem3];
    SGFocusImageItem *imageItem4 = [[SGFocusImageItem alloc] initWithTitle:nil image:@"banner_3" tag:2];
    [itemArray addObject:imageItem4];
    SGFocusImageItem *imageItem_first = [[SGFocusImageItem alloc] initWithTitle:nil image:@"banner_1" tag:-1];
    [itemArray addObject:imageItem_first];
    
    _focusImage = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.25) delegate:self imageItems:itemArray isAuto:YES];
    [_scrollView addSubview:_focusImage];
    [_focusImage scrollToIndex:0];
    
    
    // 排版
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, _focusImage.frame.origin.y+SCREEN_HEIGHT*0.25+1, SCREEN_WIDTH, 200)];
    view2.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:view2];
    NSArray *titleArray = @[@[@"高校查询",@"根据分数选大学",@"分数线查询",@"专业查询"],@[@"录取概率测试",@"测适合专业",@"职业信息库",@"高考攻略"]];
    NSArray *imageArray = @[@[@"高校查询@2x.png",@"根据分数选大学@2x.png",@"分数线查询@2x.png",@"专业查询1@2x.png"],@[@"测录取概率@2x.png",@"专业测评报告@2x.png",@"职业信息库@2x.png",@"高考攻略@2x.png"]];
    
    int index = 0;
    for (int i=0; i<2; i++) {
        
        for (int j=0; j<4; j++) {

            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            UILabel *label = [[UILabel alloc] init];
            
            float width = (SCREEN_WIDTH-30-3*30)/4;
            float height = (view2.frame.size.height-(width+10+20)*2);
            
            btn.frame = CGRectMake(15+j*(width+30), 15+i*(width+10+height), width, width);
            label.frame = CGRectMake(btn.frame.origin.x-30, btn.frame.origin.y+btn.frame.size.height+1, width+60, 10);
            
            [btn setImage:[UIImage imageNamed:imageArray[i][j]] forState:UIControlStateNormal];
            btn.layer.cornerRadius = width/2;
            btn.layer.masksToBounds = YES;
            btn.backgroundColor = [UIColor whiteColor];
            btn.tag = 100+index;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            if (btn.tag == 101 && btn.tag == 105) {
                UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(btn.x+btn.width, btn.y-20, 30, 20)];
                img.image = [UIImage imageNamed:@"hot@2x.png"];
                [view2 addSubview:img];
            }
            
            label.text = titleArray[i][j];
            label.font = [UIFont systemFontOfSize:11];
            label.textAlignment = NSTextAlignmentCenter;
            label.adjustsFontSizeToFitWidth = NO;
            
            [view2 addSubview:btn];
            [view2 addSubview:label];
            
            index ++;

        }
        
    }
    
    _view3 = [[UIView alloc] initWithFrame:CGRectMake(0, view2.frame.origin.y+view2.frame.size.height, SCREEN_WIDTH, 0.23*SCREEN_HEIGHT)];
    _view3.backgroundColor = [UIColor clearColor];
    [_scrollView addSubview:_view3];
    NSArray *bigImageArray = @[@"vip@2x.png",@"shuangrenzhiyuan@2x.png"];
    // 排版2
    for (int i=0; i<2; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10+i*((SCREEN_WIDTH-20-30)/2+30), 17, (SCREEN_WIDTH-20-30)/2, 0.18*SCREEN_HEIGHT);
        [btn setBackgroundImage:[UIImage imageNamed:bigImageArray[i]] forState:UIControlStateNormal];
        btn.imageEdgeInsets = UIEdgeInsetsMake(-10, -10, -10, -10);
        [btn addTarget:self action:@selector(imageClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 200+i;
        btn.layer.cornerRadius = 10;
        btn.layer.masksToBounds = YES;
        [_view3 addSubview:btn];
        
    }
    
    // hotView
    HotTeacherView *hotTeacherView = [[HotTeacherView alloc] init];
    hotTeacherView.frame = CGRectMake(10, _view3.frame.origin.y+_view3.frame.size.height, SCREEN_WIDTH-20, 150);
    hotTeacherView.backgroundColor = [UIColor orangeColor];
    hotTeacherView.delegate = self;
    [_scrollView addSubview:hotTeacherView];
    _scrollView.backgroundColor = UIColorRGBA(245,245,245,1);
    // 重置大小
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, hotTeacherView.frame.origin.y+hotTeacherView.frame.size.height+64+49);
    
    
    //设置风云榜的点击事件
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    // 2. 将点击事件添加到label上
    [label1 addGestureRecognizer:labelTapGestureRecognizer];
    label1.userInteractionEnabled = YES; // 打开label与用户交互权限
    NSLog(@"%@",label1.text);
    
}

#pragma mark -  HotTeacherViewDelegate
- (void)labelClick {
    NSLog(@"风云榜被点击了");
}

- (void)moreBtnMethod:(HotTeacherView *)hotTeacherView {
    NSLog(@"更多按钮的点击事件");
    
}
-(void)pushController:(FengyunViewController *)FYVC{
    [self.navigationController pushViewController:FYVC animated:YES];
}

-(void)fengyunMethod:(HotTeacherView *)fengyunView
{
    NSLog(@"风云榜被点击了");
    FengyunViewController *fy = [[FengyunViewController alloc] init];
    [self.navigationController pushViewController:fy animated:YES];
    
}
@end
