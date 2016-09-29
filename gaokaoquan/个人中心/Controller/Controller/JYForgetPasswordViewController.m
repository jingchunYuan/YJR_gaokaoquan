//
//  ForgetPasswordViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/2.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYForgetPasswordViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"
@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    
    self.view.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    
       self.navigationItem.titleView = [self.view titleWithNavigat:@"忘记密码"];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回@2x.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    

    [self setupUI];
    
}


- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;


}

- (void)leftBarButtonItemClick
{

    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void)setupUI
{
    
    UIView *footline = [[UIView alloc]init];
    footline.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footline];
    [footline mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(160);
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(1);
        
    }];

    UIView *footline2 = [[UIView alloc]init];
    footline2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:footline2];
    [footline2 mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(230);
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(1);
        
    }];
    
    
    UIImageView *UserImage = [[UIImageView alloc]init];
    UserImage.image = [UIImage imageNamed:@"用户_1"];
    [self.view addSubview:UserImage];
    
    [UserImage mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline.bottom).offset(-23);
        make.leading.equalTo(footline);
        
    }];
    
    UITextField *userText = [[UITextField alloc]init];
    userText.borderStyle = UITextFieldViewModeNever;
    userText.placeholder = @"输入手机号/邮箱";
    userText.textColor = [UIColor whiteColor];
    userText.clearButtonMode = UITextFieldViewModeAlways;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    NSMutableAttributedString *placeHolder = [[NSMutableAttributedString alloc]initWithString:@"输入手机号/邮箱" attributes:attrs];
    userText.attributedPlaceholder = placeHolder;
    
    [self.view addSubview:userText];
    
    [userText mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline.bottom).offset(-20);
        make.left.equalTo(self.view).offset(80);
        make.right.equalTo(self.view).offset(-100);
        
    }];
    
    UITextField *userText2 = [[UITextField alloc]init];
    userText2.textColor = [UIColor whiteColor];
    userText2.clearButtonMode = UITextFieldViewModeAlways;
    userText2.borderStyle = UITextFieldViewModeNever;
    
    userText2.placeholder = @"短信/邮箱验证码";
    
    NSMutableDictionary *attrs2 = [NSMutableDictionary dictionary];
    
    attrs2[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs2[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    NSMutableAttributedString *placeHolder2 = [[NSMutableAttributedString alloc]initWithString:@"短信/邮箱验证码" attributes:attrs2];
    userText2.attributedPlaceholder = placeHolder2;
    [self.view addSubview:userText2];
    
    [userText2 mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline2.bottom).offset(-20);
        make.left.equalTo(footline2);
        make.right.equalTo(self.view).offset(-100);
        
    }];

    UIButton *texting = [[UIButton alloc]init];
    
    [texting setBackgroundImage:[UIImage imageNamed:@"圆角矩形-3.png"] forState:UIControlStateNormal];
    
    [texting setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [texting setTitle:@"获取验证码" forState:UIControlStateNormal];
    texting.titleLabel.font = [UIFont systemFontOfSize:10];
    [texting addTarget:self action:@selector(textingClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:texting];
    
    
    [texting mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(userText2).offset(-5);
        make.left.equalTo(userText2.right).offset(20);
        make.right.equalTo(self.view).offset(-25);
        
        
    }];
    
    UIButton *loginbtn = [[UIButton alloc]init];
    
    loginbtn.backgroundColor = [UIColor whiteColor];
    loginbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loginbtn setTitle:@"确定" forState:UIControlStateNormal];
    [loginbtn setTitleColor:[UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1]
                   forState:UIControlStateNormal];
    
    [loginbtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    loginbtn.layer.cornerRadius = 20;
    loginbtn.layer.masksToBounds = YES;
    
    [self.view addSubview:loginbtn];

    [loginbtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline2.bottom).offset(40);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.height.mas_equalTo(40);
        
    }];

}

-(void)loginClick:(UIButton*)loginClick
{


    NSLog(@"确定");

}

// MARK:-获取验证码点击
-(void)textingClick:(UIButton *)textingbtn
{
   
    __block int timeout = 10; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                [textingbtn setTitle:@"发送验证码" forState:UIControlStateNormal];
                textingbtn.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [textingbtn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                textingbtn.titleLabel.font = [UIFont systemFontOfSize:7];
                
                [UIView commitAnimations];
                textingbtn.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);




}

@end
