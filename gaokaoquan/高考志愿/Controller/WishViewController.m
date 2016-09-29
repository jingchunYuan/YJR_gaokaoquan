//
//  WishViewController.m
//  gaokaoquan
//
//  Created by 程伟利 on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "WishViewController.h"
#import "UIImageView+WebCache.h"
#import "WishBtnModel+Request.h"

#define ScrollViewHeight  200

@interface WishViewController (){
    UIScrollView *_scrollview;
    
}
//@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UIScrollView * scrollView;

@end

@implementation WishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self request];
    [self creatUIMethod];
    self.navigationItem.title = @"高考志愿";
    
}
-(void)request
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json",@"text/plain", nil, nil];
    [manager GET:@"http://api.dev.gaokaoq.com/index?text=0231" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",result);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",error);
    }];
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)creatUIMethod {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.scrollEnabled = YES;
    //大小
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_scrollView];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    imageView.image = [UIImage imageNamed:@"banner01"];
    [_scrollView addSubview:imageView];
    
    
    // 排版
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 150+5, SCREEN_WIDTH, 220)];
    view2.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:view2];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 120, 30)];
    label.text = @"查询服务";
    label.textColor = [UIColor darkGrayColor];
    label.font = [UIFont systemFontOfSize:22];
    [view2 addSubview:label];
    NSArray *titleArray1 = @[@[@"高校查询",@"专业查询",@"分数线查询",@"职业查询"],@[@"专业职业通",@"同位次考生去向",@"同分考生去向",@"大学排名"]];
    NSArray *imageArray = @[@[@"1@2x.png",@"jr2@2x.png",@"3@2x.png",@"4@2x.png"],@[@"5@2x.png",@"6@2x.png",@"7@2x.png",@"8@2x.png"]];
    
    
    int index = 0;
    for (int i = 0; i < 2; i++) {
        
        for (int j = 0; j < 4; j++) {
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            UILabel *label = [[UILabel alloc]init];
            
            float width = (SCREEN_WIDTH-30-3*30)/4;
            float height = (view2.frame.size.height-width*2-60);
            
            btn.frame = CGRectMake(15+j*(width*1.5), 20+i*(width+height), width, width);
            label.frame = CGRectMake(btn.frame.origin.x-30, btn.frame.origin.y+btn.frame.size.height+1, width+60, 10);
            
            [btn setImage:[UIImage imageNamed:imageArray[i][j]] forState:UIControlStateNormal];
            btn.layer.cornerRadius = width/2;
            btn.layer.masksToBounds = YES;
            btn.backgroundColor = [UIColor whiteColor];
            btn.tag = 100 +index;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    }

    
    
    [self buttonMakeOnView:view2 withTitleArray:titleArray1 andImageArray:imageArray];
   
    
    UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 150+220+10, SCREEN_WIDTH, 120)];
    view3.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:view3];
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, 100, 16)];
    label1.text = @"测试体系";
    label1.textColor = label.textColor;
    [view3 addSubview:label1];
    NSArray *titleArray2 = @[@[@"录取概率测试",@"MBTI职业测试",@"测适合专业",@"复读指数测试"]];
    NSArray *imageArray2 = @[@[@"1@2x.png",@"jr2@2x.png",@"3@2x.png",@"4@2x.png"]];
    
    [self buttonMakeOnView:view3 withTitleArray:titleArray2 andImageArray:imageArray2];
    
    
    
    UIView * view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 150+220+120+20, SCREEN_WIDTH, 220)];
    view4.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:view4];
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, 100, 16)];
    label2.text = @"智能填报";
    label2.textColor = label.textColor;
    [view4 addSubview:label2];
    NSArray *titleArray3 = @[@[@"成绩跟踪系统",@"志愿定制报告",@"vip系统",@"双人志愿系统"],@[@"模拟志愿填报",@"根据分数选大学"]];
    NSArray *imageArray3 = @[@[@"1@2x.png",@"jr2@2x.png",@"3@2x.png",@"4@2x.png"],@[@"1@2x.png",@"jr2@2x.png"]];
    
    [self buttonMakeOnView:view4 withTitleArray:titleArray3 andImageArray:imageArray3];
    // 重置大小
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 150+220+120+220+64+49);
    _scrollView.bounces = NO;
    
}
-(void)buttonMakeOnView:(UIView *)view withTitleArray:(NSArray*)titleArray andImageArray:(NSArray*)imageArray
{
    static int index = 0;
    for (int i=0; i<imageArray.count; i++) {
        
        for (int j=0; j<[imageArray[i] count]; j++) {
            //(width+20)+i*(width+39)
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            UILabel *label = [[UILabel alloc] init];
            
            float width = (SCREEN_WIDTH-60-3*50)/4;
            float height = (view.frame.size.height-width*2-60);
            
            btn.frame = CGRectMake(30+j*(width+50), 30+i*(width+height), width, width);
            label.frame = CGRectMake(btn.frame.origin.x-30, btn.frame.origin.y+btn.frame.size.height+1, width+60, 30);
            
            [btn setImage:[UIImage imageNamed:imageArray[i][j]] forState:UIControlStateNormal];
            btn.layer.cornerRadius = width/2;
            btn.layer.masksToBounds = YES;
            btn.backgroundColor = [UIColor whiteColor];
            btn.tag = 100+index;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            label.text = titleArray[i][j];
            label.font = [UIFont systemFontOfSize:11];
            label.textAlignment = NSTextAlignmentCenter;
            label.adjustsFontSizeToFitWidth = NO;
            
            [view addSubview:btn];
            [view addSubview:label];
            
            index ++;
            
        }
        
    }
    
}
- (void)btnClick:(UIButton *)btn {
    
    switch (btn.tag) {
        case 100:
            NSLog(@"高效查询 : %ld",btn.tag);
            
            break;
        case 101:
            NSLog(@"根据分数选大学 : %ld",btn.tag);
            
            break;
        case 102:
            NSLog(@"分数线查询 : %ld",btn.tag);
            
            break;
        case 103:
            NSLog(@"专业查询 : %ld",btn.tag);
            
            break;
        case 104:
            NSLog(@"录取概率测试 : %ld",btn.tag);
            
            break;
        case 105:
            NSLog(@"测适合专业 : %ld",btn.tag);
            
            break;
        case 106:
            NSLog(@"职业信息库 : %ld",btn.tag);
            
            break;
        case 107:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 108:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 109:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 110:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 111:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 112:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 113:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 114:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 115:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 116:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
        case 117:
            NSLog(@"高考攻略 : %ld",btn.tag);
            
            break;
            
        default:
            break;
            
    }
    
    
}@end
