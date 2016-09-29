//
//  GKBaseViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/1.
//  Copyright © 2016年 袁静茹. All rights reserved.


#import "JYGKBaseViewController.h"
#import "JYForgetPasswordViewController.h"
#import "JYStudentCenterTableViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"
@interface GKBaseViewController ()<UITextFieldDelegate>

// 需要记录的选中按钮
@property(nonatomic,strong)UIButton *personalBtn;

// 注册按钮
@property(nonatomic,strong)UIButton *registerBtn;



@end

@implementation GKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

-(void)initWithUIcontrol:(NSString *)navLetm leftBarButtonItemImage:(NSString *)leftBarButtonItemImage title:(NSString *)title rightBarButtonItemTitle:(NSString *)rightBarButtonItemTitle
{
    
    self.view.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:navLetm];
 
    if (leftBarButtonItemImage) {
        
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:leftBarButtonItemImage highlightedImage:nil title:title target:self action:@selector(leftBarButtonItemClick)];
    }
    
    
    if (rightBarButtonItemTitle) {
        
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:nil highlightedImage:nil title:rightBarButtonItemTitle target:self action:@selector(rightBarButtonItemClick)];
        
    }
    

}

-(void)rightBarButtonItemClick
{

    


}
- (void)leftBarButtonItemClick
{
    
   
    
    
}

// MARK:-设置控件
-(void)setUpUIWithView:(UIView *)footline footline2:(UIView *)footline2 UserImage:(UIImageView *)UserImage PassWord:(UIImageView *)PassWord userText:(UITextField *)userText userText2:(UITextField *)userText2 thildLine:(UIView *)thildLine testFiled:(UITextField *)testFiled texting:(UIButton *)texting PersonalBtn:(UIButton *)PersonalBtn regisiterBtn:(UIButton *)regisiterBtn forgetBtn:(UIButton *)forgetBtn forgetImage:(UIImageView *)forgetImage loginbtn:(UIButton *)loginbtn loginbtnTitle:(NSString *)loginbtnTitle stduentBtn:(UIButton *)stduentBtn spView:(UIView *)spView spView2:(UIView *)spView2 Thild:(UILabel *)Thild weixin:(UIButton *)weixin QQ:(UIButton *)QQ weibo:(UIButton *)weibo zhuceTitle:(NSString *)zhuceTitle
{
    

    
     footline.backgroundColor = [UIColor whiteColor];
    
     [self.view addSubview:footline];
    
    [footline mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(120);
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(1);
        
    }];
    
      footline2.backgroundColor = [UIColor whiteColor];
    
      [self.view addSubview:footline2];
    
    [footline2 mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(170);
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(1);
        
    }];
    
    UserImage.image = [UIImage imageNamed:@"用户_1"];
    
    [self.view addSubview:UserImage];
    
    [UserImage mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline.bottom).offset(-23);
        make.leading.equalTo(footline);
        
    }];
  
    PassWord.image = [UIImage imageNamed:@"密码锁"];
    [self.view addSubview:PassWord];
    
    [PassWord mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline2).offset(-23);
        make.leading.equalTo(footline2);
        
    }];

    self.UserText = userText;
    
    userText.textColor = [UIColor whiteColor];
    userText.borderStyle = UITextFieldViewModeNever;
    userText.placeholder = @"请输入手机号/邮箱";
    userText.clearButtonMode = UITextFieldViewModeAlways;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    NSMutableAttributedString *placeHolder = [[NSMutableAttributedString alloc]initWithString:@"请输入手机号/邮箱" attributes:attrs];
    userText.attributedPlaceholder = placeHolder;
    
    [self.view addSubview:userText];
    
    [userText mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline.bottom).offset(-24);
        make.left.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(-80);
        
    }];
    
    
    // 可视化密码按钮
    UIButton *seePassword = [[UIButton alloc]init];
    
    [seePassword setImage:[UIImage imageNamed:@"密码可视按钮"] forState:UIControlStateNormal];
    
    [self.view addSubview:seePassword];
    
    [seePassword mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(PassWord.top);
        make.right.equalTo(footline2);
    
    }];
    
    [seePassword addTarget:self action:@selector(seePasswordClick:) forControlEvents:UIControlEventTouchUpInside];
    
    userText2.borderStyle = UITextFieldViewModeNever;
    userText2.placeholder = @"请输入密码";
    userText2.secureTextEntry = YES;
    
    self.passWord = userText2;
    
    userText2.delegate = self;
    userText2.textColor = [UIColor whiteColor];
    NSMutableDictionary *attrs2 = [NSMutableDictionary dictionary];
    
    attrs2[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs2[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    NSMutableAttributedString *placeHolder2 = [[NSMutableAttributedString alloc]initWithString:@"请输入密码" attributes:attrs2];
    userText2.attributedPlaceholder = placeHolder2;
    [self.view addSubview:userText2];
    
    [userText2 mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline2.bottom).offset(-24);
        make.left.equalTo(self.view).offset(100);
        make.right.equalTo(self.view).offset(-80);
        
    }];
    
    
    if (thildLine) {
        
        seePassword.hidden = YES;
        
        thildLine.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:thildLine];
        
        [thildLine mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(footline2.bottom).offset(50);
            make.left.equalTo(self.view).offset(40);
            make.right.equalTo(self.view).offset(-40);
            make.height.mas_equalTo(1);
            
        }];

        testFiled.borderStyle = UITextFieldViewModeNever;
        
        testFiled.delegate = self;
        testFiled.clearButtonMode = UITextFieldViewModeAlways;
        NSMutableDictionary *attrs3 = [NSMutableDictionary dictionary];
        
        attrs3[NSForegroundColorAttributeName] = [UIColor whiteColor];
        attrs3[NSFontAttributeName] = [UIFont systemFontOfSize:13];
        NSMutableAttributedString *placeHolder3 = [[NSMutableAttributedString alloc]initWithString:@"请输入手机验证码" attributes:attrs3];
        testFiled.attributedPlaceholder = placeHolder3;
        
        [self.view addSubview:testFiled];
        
        [testFiled mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(thildLine.top).offset(-20);
            make.left.equalTo(thildLine.left).offset(10);
            make.right.equalTo(self.view).offset(-150);
            
        }];

        [texting setBackgroundImage:[UIImage imageNamed:@"圆角矩形-3"] forState:UIControlStateNormal];
        
        [texting setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [texting setTitle:@"获取验证码" forState:UIControlStateNormal];
        texting.titleLabel.font = [UIFont systemFontOfSize:10];
        [self.view addSubview:texting];
        
        [texting addTarget:self action:@selector(textingClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [texting mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(userText2).offset(-5);
            make.left.equalTo(userText2.right).offset(15);
            make.right.equalTo(self.view).offset(-10);
           
        }];
        
        self.personalBtn = PersonalBtn;
        
    [PersonalBtn setImage:[UIImage imageNamed:@"框"] forState:UIControlStateNormal];
        
        [PersonalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [PersonalBtn setTitle:@"使用条款和隐私政策" forState:UIControlStateNormal];

        [PersonalBtn addTarget:self action:@selector(PersonalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [PersonalBtn setImage:[UIImage imageNamed:@"√"] forState:UIControlStateSelected];
        
        PersonalBtn.titleLabel.font = [UIFont systemFontOfSize:9];
        
        [self.view addSubview:PersonalBtn];
        
        [PersonalBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(thildLine.bottom).offset(20);
            make.centerX.equalTo(thildLine.centerX);
            
        }];
        
        
        spView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:spView];
        
        [spView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(userText2.bottom).offset(180);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view).offset(-250);
            make.height.mas_equalTo(0.5);
            
        }];
        
        spView2.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:spView2];
        
        [spView2 mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(userText2.bottom).offset(180);
            make.right.equalTo(self.view);
            make.left.equalTo(self.view).offset(250);
            make.height.mas_equalTo(0.5);
            
        }];
        
        Thild.font = [UIFont systemFontOfSize:13];
        
        Thild.textColor = [UIColor whiteColor];
        
        Thild.text = @"第三方登录";
        
        Thild.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:Thild];
        
        [Thild mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(spView2.bottom).offset(-10);
            make.right.equalTo(spView2.left);
            make.left.equalTo(spView.right);
            
        }];
        
        [weixin setImage:[UIImage imageNamed:@"第三方－微信.png"] forState:UIControlStateNormal];
        
        [weixin addTarget:self action:@selector(weixinClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.view addSubview:weixin];
        
        [weixin mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(Thild.bottom).offset(100);
            make.left.equalTo(self.view).offset(50);
            
        }];
        
        [weibo setImage:[UIImage imageNamed:@"第三方－新浪.png"] forState:UIControlStateNormal];
        
        [weibo addTarget:self action:@selector(weiboClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:weibo];
        
        [weibo mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(Thild.bottom).offset(100);
            make.right.equalTo(self.view).offset(-50);
            
        }];
        
        [QQ setImage:[UIImage imageNamed:@"第三方－ＱＱ.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:QQ];
        
        // 点击qq
        [QQ addTarget:self action:@selector(QQClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [QQ mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(Thild.bottom).offset(100);
            make.centerX.equalTo(Thild.centerX);
            make.top.equalTo(weibo.top);
            
        }];
        
    }else
    {
    
        spView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:spView];
        
        [spView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(userText2.bottom).offset(120);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view).offset(-250);
            make.height.mas_equalTo(0.5);
            
        }];
        
        spView2.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:spView2];
        
        [spView2 mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(userText2.bottom).offset(120);
            make.right.equalTo(self.view);
            make.left.equalTo(self.view).offset(250);
            make.height.mas_equalTo(0.5);
            
        }];
        
        Thild.font = [UIFont systemFontOfSize:13];
        
        Thild.textColor = [UIColor whiteColor];
        
        Thild.text = @"第三方登录";
        
        Thild.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:Thild];
        
        [Thild mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(spView2.bottom).offset(-10);
            make.right.equalTo(spView2.left);
            make.left.equalTo(spView.right);
            
        }];
        
        [weixin setImage:[UIImage imageNamed:@"第三方－微信.png"] forState:UIControlStateNormal];
        
        [weixin addTarget:self action:@selector(weixinClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.view addSubview:weixin];
        
        [weixin mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(Thild.bottom).offset(50);
            make.left.equalTo(self.view).offset(50);
            
        }];
        
        [weibo setImage:[UIImage imageNamed:@"第三方－新浪.png"] forState:UIControlStateNormal];
        
        [weibo addTarget:self action:@selector(weiboClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:weibo];
        
        [weibo mas_updateConstraints:^(MASConstraintMaker *make) {
            
//            make.bottom.equalTo(self.view).offset(-100);
                        make.top.equalTo(Thild.bottom).offset(50);
            make.right.equalTo(self.view).offset(-50);
            
        }];
        
        [QQ setImage:[UIImage imageNamed:@"第三方－ＱＱ.png"] forState:UIControlStateNormal];
        
        [self.view addSubview:QQ];
        
        // 点击qq
        [QQ addTarget:self action:@selector(QQClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [QQ mas_updateConstraints:^(MASConstraintMaker *make) {
            

            make.top.equalTo(Thild.bottom).offset(50);
            make.centerX.equalTo(Thild.centerX);
            make.top.equalTo(weibo.top);
            
        }];
    
    }
 
    [regisiterBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    
    [regisiterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    regisiterBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    
    [regisiterBtn addTarget:self action:@selector(regisiterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:regisiterBtn];
    
    [regisiterBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline2.bottom).offset(15);
        make.leading.equalTo(footline2);
        
    }];

    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    
    [forgetBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:forgetBtn];
    
    [forgetBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline2.bottom).offset(15);
        make.right.equalTo(self.view).offset(-46);
        
    }];
    
    forgetImage.image = [UIImage imageNamed:@"忘记密码.png"];

    [self.view addSubview:forgetImage];
    
    [forgetImage mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(footline2.bottom).offset(17);
        make.right.equalTo(self.view).offset(-25);
        
    }];
    
    self.registerBtn = loginbtn;
    
    if (texting) {
        
        loginbtn.enabled = NO;
    }

    loginbtn.backgroundColor = [UIColor whiteColor];
    loginbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [loginbtn setTitle:loginbtnTitle forState:UIControlStateNormal];
    [loginbtn setTitleColor:[UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1]
                   forState:UIControlStateNormal];
    [loginbtn addTarget:self action:@selector(loginbtnClick:) forControlEvents:UIControlEventTouchUpInside];

    loginbtn.layer.cornerRadius = 20;
    loginbtn.layer.masksToBounds = YES;
    
    
    [self.view addSubview:loginbtn];
    
    
    if (thildLine) {
        
        [loginbtn setTitle:zhuceTitle forState:UIControlStateNormal];
        
        [loginbtn mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(thildLine.bottom).offset(50);
            make.left.equalTo(self.view).offset(30);
            make.right.equalTo(self.view).offset(-30);
            make.height.mas_equalTo(40);
            
        }];

        
    }else{
    
    [loginbtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(forgetBtn.bottom).offset(10);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.height.mas_equalTo(40);
        
        
        }];
        
        
    }
    

    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //⭐️使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 100, self.view.frame.size.width, self.view.frame.size.height);
    //设置动画结束
    [UIView commitAnimations];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 100, self.view.frame.size.width, self.view.frame.size.height);
    //设置动画结束
    [UIView commitAnimations];
}
// MARK:-textfiled的代理方法点击return操作
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //⭐️使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    //设置动画结束
    [UIView commitAnimations];
    
    [textField resignFirstResponder];
    
    return YES;
}



-(void)loginbtnClick:(UIButton *)loginbtn
{

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // 得到输入框的内容
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (textField == self.passWord && textField.isSecureTextEntry ) {
        
        textField.text = toBeString;
        
        return NO;
    }
    
    return YES;
}

// MARK:-记录按钮
-(void)PersonalBtnClick:(UIButton *)PersonalBtn
{
    PersonalBtn.selected = !PersonalBtn.selected;
    self.registerBtn.enabled = PersonalBtn.selected;
    
}

// MARK:-跳转QQ
- (void)QQClick:(UIButton *)QQbtn
{
    
    NSLog(@"跳转qq");
    
}

// MARK:-跳转微信
-(void)weixinClick:(UIButton *)weinxinBtn
{
    NSLog(@"跳转微信");
    
    
}
// MARK:-跳转微博
-(void)weiboClick:(UIButton *)weiboBtn
{
    
    
    NSLog(@"跳转微博");
    
}

-(void)seePasswordClick:(UIButton *)seePassword
{

    self.passWord.secureTextEntry = !self.passWord.secureTextEntry;


}

// MARK:-忘记密码点击
-(void)forgetBtnClick:(UIButton *)forgetBtn
{
    
    ForgetPasswordViewController *forget = [[ForgetPasswordViewController alloc]init];
    
    [self.navigationController pushViewController:forget animated:YES];
    
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];

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


// MARK:-手机号判断
-(BOOL)IsPnone:(NSString *)phone
{
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

// MARK:-邮箱判断
-(BOOL)IsMail:(NSString *)mail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:mail];
}

-(void)regisiterBtnClick:(UIButton *)regisiterBtn
{




}


@end
