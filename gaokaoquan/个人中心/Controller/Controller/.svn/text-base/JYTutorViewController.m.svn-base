//
//  TutorViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/1.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorViewController.h"
#import "JYTutorCenterTableViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"
@interface TutorViewController ()

@end

@implementation TutorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWithUIcontrol:@"导师入口" leftBarButtonItemImage:@"返回.png" title:nil rightBarButtonItemTitle:nil];

    // 设置界面
    [self SetupUI];

    
    

}


- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
    
}


// MARK:-返回登录界面
-(void)leftBarButtonItemClick
{
   
    [self.navigationController popViewControllerAnimated:YES];


}

// MARK:-设置控件
- (void)SetupUI
{
    
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
  
    // 学生登录按钮
    UIButton *stduentBtn = [[UIButton alloc]init];

    UIView *spView = [[UIView alloc]init];

    
    UIView *spView2 = [[UIView alloc]init];
    

    UILabel *Thild = [[UILabel alloc]init];

    
    // 第三方按钮
    UIButton *weixin = [[UIButton alloc]init];
    

    UIButton *QQ = [[UIButton alloc]init];
    
 
    UIButton *weibo = [[UIButton alloc]init];
    

       [self setUpUIWithView:footline footline2:footline2 UserImage:UserImage PassWord:PassWord userText:userText userText2:userText2 thildLine:nil testFiled:nil texting:nil PersonalBtn:nil regisiterBtn:regisiterBtn forgetBtn:forgetBtn forgetImage:forgetImage loginbtn:loginbtn loginbtnTitle:@"登录" stduentBtn:stduentBtn spView:spView spView2:spView2 Thild:Thild weixin:weixin QQ:QQ weibo:weibo zhuceTitle:nil];
    
    
}

// MARK:-导师登录
-(void)loginbtnClick:(UIButton *)loginbtn
{
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"JYTutorCenterTableViewController" bundle:[NSBundle mainBundle]];
    
    JYTutorCenterTableViewController *tutor = [board instantiateViewControllerWithIdentifier:@"story"];
    
    [self.navigationController pushViewController:tutor animated:YES];
    
    return;
    
#warning 测试
    // [self alertViewVC];
    
#warning 判断是不是真的账号密码
    if ([self.UserText.text isEqualToString:@""] && [self.passWord.text isEqualToString:@""]) {
        
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
    
    if ([self.UserText.text isEqualToString:@"13522226666"] && [self.passWord.text isEqualToString:@"123"]){
    
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"JYTutorCenterTableViewController" bundle:[NSBundle mainBundle]];
    
        JYTutorCenterTableViewController *tutor = [board instantiateViewControllerWithIdentifier:@"story"];
    
        [self.navigationController pushViewController:tutor animated:YES];
        
      }else{
    
    
        [self IsfalsePasswordWithUser];
    
    }
    
}

// MARK:-弹框
-(void)IsfalsePasswordWithUser
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您输入的账号或密码不正确" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
-(void)AlertViewWith:(NSString *)alertTitle message:(NSString *)message actionTitle:(NSString *)actionTitle
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:alertTitle message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction: [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
#warning 重写学生登录按钮
//-(void)stduentLoginClick:(UIButton *)stduentLogin
//{
//
//
//    [self.navigationController popViewControllerAnimated:YES];
//
//
//}

@end
