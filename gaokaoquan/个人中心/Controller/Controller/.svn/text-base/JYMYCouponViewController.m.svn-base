//
//  JYMYCouponViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMYCouponViewController.h"

@interface JYMYCouponViewController ()

@property (nonatomic,strong) UIScrollView *scrollview;

@end

@implementation JYMYCouponViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"优惠券"];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:@"返回" target:self action:@selector(leftBarButtonItemClick)];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    
    self.scrollview = scroller;
    
    [self.view addSubview:scroller];
    
    
    [self setUI];
    
  
}

- (void)setUI
{

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 150, 20)];
    
    label.text = @"没有找到优惠券";
    
    [self.scrollview addSubview:label];
    
    label.font = [UIFont systemFontOfSize:14];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 150, 50)];
    
    label2.text = @"获取优惠券";
    
    label2.textColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    
    label2.font = [UIFont systemFontOfSize:18];
    
    [self.scrollview  addSubview:label2];
    
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 170, KWIDTH - 2 * 20, 40)];
    
    label3.numberOfLines = 0;
    
    label3.text = @"1)您可以通过关注高考圈微信平台,获取优惠券";
    
    label3.font = [UIFont systemFontOfSize:14];
    
    [self.scrollview  addSubview:label3];
    
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 230, KWIDTH - 2 * 20, 40)];
    
    label4.text = @"2)通过朋友的分享获得优惠券";
    label4.font = [UIFont systemFontOfSize:14];
    
    [self.scrollview  addSubview:label4];
    
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, 150, 50)];
    
    label5.text = @"使用优惠券";
    
    label5.textColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    
    label5.font = [UIFont systemFontOfSize:18];
    
    [self.scrollview  addSubview:label5];
    
    
    UILabel *Userlabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 340, KWIDTH - 2 * 20, 30)];
    
    Userlabel.text = @"1)支付的时候选择使用优惠券即可";
    
    Userlabel.font = [UIFont systemFontOfSize:14];
    
    [self.scrollview addSubview:Userlabel];
    
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(50, 390, 129, 129)];
    
    imageview.image = [UIImage imageNamed:@"qrcode_app_1"];
    
    [self.scrollview addSubview:imageview];
    
    
    self.scrollview.contentSize = CGSizeMake(0, 390 + 129 + 100);

}

-(void)leftBarButtonItemClick
{

    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
