
//
//  TongweiciViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TongweiciViewController.h"
#import "TongweiciModel.h"
#import "UIImageView+WebCache.h"
#define MAS_SHORTHAND
#import "Masonry.h"
#import "TongweiciView.h"
#import "TiaozhuanView.h"
#import "TongWeiAlertView.h"
#import "ShopServiceViewController.h"
#import "ShiyongViewController.h"

#define selfWith self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define selfBacground [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]

@interface TongweiciViewController ()<TongWeiAlertDelegate>

@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UIButton *btn2;
@property (nonatomic,strong) TongweiciView *tableview;
@property (nonatomic,assign) BOOL ISShow;
@property (nonatomic,strong) UIImageView *imageview;

@end

@implementation TongweiciViewController {
    
    TongWeiAlertView * alertView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    
}


#pragma mark -
#pragma mark - TongWeiAlertDelegate
-(void)pushController:(NSInteger)type{
    if(type){
        //跳转到查询页面
        ShiyongViewController *shiyong = [[ShiyongViewController alloc]init];
        [self.navigationController pushViewController:shiyong animated:YES];
        

    }else{
        //跳转到购买页面
        ShopServiceViewController * serviceController = [[ShopServiceViewController alloc]init];
        [self.navigationController pushViewController:serviceController animated:YES];
    }
}

- (void)buttonClick:(UIButton *)btn {
    self.tableview.hidden = YES;
    self.imageview.hidden = NO;
    btn.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn2.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    [self.btn2 setTitleColor:[UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1] forState:UIControlStateNormal];
}

- (void)button2Click:(UIButton *)btn {
    self.imageview.hidden = YES;
    self.tableview.hidden = NO;
    btn.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    [self.btn setTitleColor:[UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1] forState:UIControlStateNormal];
}

-(void)BuyClick:(UIButton *) btn{
    
    if (YES) {//登陆的情况
        //跳转到：同位次考生去向查询页面
        NSLog(@"跳转到：同位次考生去向查询页面");
        ShiyongViewController *shiyong = [[ShiyongViewController alloc]init];
        [self.navigationController pushViewController:shiyong  animated:YES];
        
    }else {//未登录的情况
        alertView.hidden = !alertView.hidden;
    }
    
}

- (void)setUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollview];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"同位次考生去向"];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KWIDTH, KWIDTH * 0.6)];
    [scrollview addSubview:imageview];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageview.frame) + 10, 25, 25)];
    image.image = [UIImage imageNamed:@"同位次考生去向等页面的纸张图标.png"];
    [scrollview addSubview:image];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(imageview.frame) + 10, 150, 20)];
    [scrollview addSubview:label];
    label.font = [UIFont systemFontOfSize:15];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(label.frame) + 10, KWIDTH - 2 * 10, 100)];
    label3.numberOfLines = 0;
    [scrollview addSubview:label3];
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(label3.frame) + 10, 100, 20)];
    [scrollview addSubview:label4];
    label4.textColor = [UIColor redColor];
    label4.font = [UIFont systemFontOfSize:14];
    
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label4.frame), CGRectGetMaxY(label3.frame) + 10, 100, 20)];
    label5.font = [UIFont systemFontOfSize:14];
    [scrollview addSubview:label5];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"产品介绍" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    self.btn = button;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:button];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, CGRectGetMaxY(label5.frame) + 10, KWIDTH * 0.5, 30);
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"使用评价" forState:UIControlStateNormal];
    self.btn2 = button2;
    button2.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    [button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    [scrollview addSubview:button2];
    [button2 setTitleColor:[UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1] forState:UIControlStateNormal];
    button2.frame = CGRectMake(CGRectGetMaxX(button.frame), CGRectGetMaxY(label5.frame) + 10, KWIDTH * 0.5, 30);
    
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame), KWIDTH, 450)];
    [scrollview addSubview:imageView2];
    self.imageview = imageView2;
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/service/view?id=3" parameters:nil callback:^(id responseObject, NSError *error) {
        
        TongweiciModel *same = [TongweiciModel mj_objectWithKeyValues:responseObject[@"data"]];
        
        NSURL *url = [NSURL URLWithString:same.thumb];
        [imageview sd_setImageWithURL:url placeholderImage:nil];
        label.text = same.title;
        label4.text = [NSString stringWithFormat:@"$%@/%@次",same.price,same.service_times];
        label5.text = [NSString stringWithFormat:@"原价%@元",same.original_price];
        NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[same.intro dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        label3.attributedText = attrStr;
        
        NSString *str = same.content_wap;
        str = [str substringFromIndex:13];
        str = [str substringToIndex:48];
        [imageView2 sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:nil];
        
    }];
    
    scrollview.contentSize = CGSizeMake(0, CGRectGetMaxY(imageView2.frame) + 50);
    
    UIButton *Buy = [UIButton buttonWithType:UIButtonTypeCustom];
    Buy.backgroundColor = [UIColor orangeColor];
    
    //判断是否登录了
    if (YES) { //登陆了
        [Buy setTitle:@"立即使用(可用次数17)" forState:UIControlStateNormal];
    }else {
        [Buy setTitle:@"立即购买(32.00元/30次)" forState:UIControlStateNormal];
    }
    
    [Buy setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Buy addTarget:self action:@selector(BuyClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Buy];
    
    [Buy mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_offset(50);
        
    }];
    
    TongweiciView *tableview = [[TongweiciView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(button2.frame), KWIDTH, 400)];
    [scrollview addSubview:tableview];
    self.tableview = tableview;
    tableview.hidden = YES;
    
    alertView = [[TongWeiAlertView alloc]initWithFrame:CGRectMake(20, 0.2*SCREEN_HEIGHT, SCREEN_WIDTH-40, 0.3*SCREEN_HEIGHT)];
    alertView.hidden = YES;
    alertView.title = @"温馨提示";
    alertView.message = @"购买VIP套餐性价比更高哦~";
    alertView.nextTitle = @"什么是VIP套餐";
    alertView.cancelTitle = @"暂时不考虑";
    alertView.delegate = self;
    [self.view addSubview:alertView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end


