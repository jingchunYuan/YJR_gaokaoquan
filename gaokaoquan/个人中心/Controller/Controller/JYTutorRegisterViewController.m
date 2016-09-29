//
//  TutorRegisterViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/1.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorRegisterViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"
@interface TutorRegisterViewController ()

@end

@implementation TutorRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithUIcontrol:@"注册考圈" leftBarButtonItemImage:@"返回@2x.png" title:@"返回" rightBarButtonItemTitle:nil];
    
    [self SetupUI];


}


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
    
}


-(void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)SetupUI
{
    // 横线
    UIView *footline = [[UIView alloc]init];
       UIView *footline2 = [[UIView alloc]init];
   
    UIImageView *UserImage = [[UIImageView alloc]init];
    
    UIImageView *PassWord = [[UIImageView alloc]init];
       // 文本框
    UITextField *userText = [[UITextField alloc]init];
       UITextField *userText2 = [[UITextField alloc]init];
    
       // 第三条线
    UIView *thildLine = [[UIView alloc]init];
      // 验证码文本框
    UITextField *testFiled = [[UITextField alloc]init];
    
    // 获取验证码
    UIButton *texting = [[UIButton alloc]init];
    
    
    // 隐私按钮
    UIButton *PersonalBtn = [[UIButton alloc]init];
    
    
    // 登录按钮
    UIButton *loginbtn = [[UIButton alloc]init];
       UIView *spView = [[UIView alloc]init];
    
    
    UIView *spView2 = [[UIView alloc]init];
    
    UILabel *Thild = [[UILabel alloc]init];
    
        // 第三方按钮
    UIButton *weixin = [[UIButton alloc]init];
    
    
    UIButton *QQ = [[UIButton alloc]init];
    
    UIButton *weibo = [[UIButton alloc]init];

    
     [self setUpUIWithView:footline footline2:footline2 UserImage:UserImage PassWord:PassWord userText:userText userText2:userText2 thildLine:thildLine testFiled:testFiled texting:texting PersonalBtn:PersonalBtn regisiterBtn:nil forgetBtn:nil forgetImage:nil loginbtn:loginbtn loginbtnTitle:nil stduentBtn:nil spView:spView spView2:spView2 Thild:Thild weixin:weixin QQ:QQ weibo:weibo zhuceTitle:@"大学生/导师注册"];
    
    
}

-(void)loginbtnClick:(UIButton *)loginbtn
{
    
    NSLog(@"大学生/导师注册");
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
