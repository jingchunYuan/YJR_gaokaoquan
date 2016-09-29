//
//  PersonalViewController.m
//  gaokaoquan
//
//  Created by 程伟利 on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYPersonalViewController.h"
#import "JYTutorViewController.h"
#import "JYRegisterViewController.h"
#import "JYStudentCenterTableViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"
@interface JYPersonalViewController ()

@end

@implementation JYPersonalViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    [self initWithUIcontrol:@"登录高考圈" leftBarButtonItemImage:@"返回.png" title:nil rightBarButtonItemTitle:@"导师入口"];

    // 设置界面
    [self SetupUI];
    
}


// MARK:-重写父类左BarButtonItem点击
-(void)leftBarButtonItemClick
{
    self.tabBarController.selectedIndex = 0;
 
}

// MARK:-重写父类右BarButtonItem点击
- (void)rightBarButtonItemClick
{
    TutorViewController *tutor = [[TutorViewController alloc]init];
  
    [self.navigationController pushViewController:tutor animated:YES];

}

// MARK:-设置界面
- (void)SetupUI
{
   
       
//    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(50, 40, 129, 45)];
//    
//    imageview.image = [UIImage imageNamed:@"图层-10"];
//    
//    [self.view addSubview:imageview];
    
//    
//    [imageview mas_updateConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(self).offset(70);
//        //        make.centerX.equalTo(self);
//        
//        make.left.equalTo(self).offset(50);
//        
//        make.width.mas_equalTo(125);
//        make.height.mas_equalTo(45);
//        
//        
//    }];
//    
    
     // 横线
    UIView *footline = [[UIView alloc]init];
    
    UIView *footline2 = [[UIView alloc]init];

    UIImageView *UserImage = [[UIImageView alloc]init];

    UIImageView *PassWord = [[UIImageView alloc]init];

    // 文本框
    UITextField *userText = [[UITextField alloc]init];
    

    
    UITextField *userText2 = [[UITextField alloc]init];

    
    // 注册账号
    UIButton *regisiterBtn = [[UIButton alloc]init];
    
    // 忘记密码
    UIButton *forgetBtn = [[UIButton alloc]init];
    
    // 忘记密码图片
    UIImageView *forgetImage = [[UIImageView alloc]init];
    
    // 登录按钮
    UIButton *loginbtn = [[UIButton alloc]init];

    
    UIView *spView = [[UIView alloc]init];
    
  
    UIView *spView2 = [[UIView alloc]init];
    
    UILabel *Thild = [[UILabel alloc]init];

    // 第三方按钮
    UIButton *weixin = [[UIButton alloc]init];
    
    UIButton *QQ = [[UIButton alloc]init];

    UIButton *weibo = [[UIButton alloc]init];
    
    [self setUpUIWithView:footline footline2:footline2 UserImage:UserImage PassWord:PassWord userText:userText userText2:userText2 thildLine:nil testFiled:nil texting:nil PersonalBtn:nil regisiterBtn:regisiterBtn forgetBtn:forgetBtn forgetImage:forgetImage loginbtn:loginbtn loginbtnTitle:@"登录" stduentBtn:nil spView:spView spView2:spView2 Thild:Thild weixin:weixin QQ:QQ weibo:weibo zhuceTitle:nil];
    

}
// MARK:-x学生登录
-(void)loginbtnClick:(UIButton *)loginbtn
{
    
    StudentCenterTableViewController *student = [[StudentCenterTableViewController alloc]init];
    
    [self.navigationController pushViewController:student animated:NO];
  
    
    return;
#warning 测试
   //  [self alertViewVC];
    
    if ([self.UserText.text isEqualToString:@""] && [self.passWord.text isEqualToString:@""]) {
//
#warning 如有需要适配ios7
        
        [self AlertViewWith:@"http://ios.gaokaoq.com" message:@"手机号或邮箱不能为空" actionTitle:@"好"];
        
        return;
        
    }else if ([self.UserText.text isEqualToString:@""] && self.passWord.text != nil){
        
        [self AlertViewWith:@"http://ios.gaokaoq.com" message:@"手机号或邮箱不能为空" actionTitle:@"好"];
        
        return;
        
    }else if ([self IsPnone:self.UserText.text] == NO && [self IsMail:self.UserText.text] == NO){
        
        
        [self AlertViewWith:@"http://ios.gaokaoq.com" message:@"手机号码或邮箱格式不正确" actionTitle:@"好"];
        return;
        
    }else if (self.UserText.text != nil && [self.passWord.text isEqualToString:@""]){
        
        [self AlertViewWith:@"http://ios.gaokaoq.com" message:@"密码不能为空" actionTitle:@"好"];
        
        return;
        
    }
    
    if ([self.UserText.text isEqualToString:@"13522226666"] && [self.passWord.text isEqualToString:@"123"]) {

        StudentCenterTableViewController *student = [[StudentCenterTableViewController alloc]init];
        
        [self.navigationController pushViewController:student animated:NO];
        
    }else{
    
        [self IsfalsePasswordWithUser];
        
    }
    
}
// MARK:-弹框
-(void)AlertViewWith:(NSString *)alertTitle message:(NSString *)message actionTitle:(NSString *)actionTitle
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:alertTitle message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction: [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)IsfalsePasswordWithUser
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您输入的账号或密码不正确" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
// MARK:-注册按钮
-(void)regisiterBtnClick:(UIButton *)regisiterBtn
{
    RegisterViewController *Register = [[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:Register animated:YES];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
