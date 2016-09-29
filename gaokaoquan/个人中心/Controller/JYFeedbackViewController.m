//
//  JYFeedbackViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYFeedbackViewController.h"
#import "JYTextFiled.h"
@interface JYFeedbackViewController ()<UITextFieldDelegate>

@end

@implementation JYFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.titleView = [self.view titleWithNavigat:@"意见反馈"];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self setUI];
    
    

}


- (void)setUI
{

   
    UILabel *tel = [[UILabel alloc]initWithFrame:CGRectMake(30, 20, 200, 20)];
    
    tel.text = @"客服电话:010-82539928";
    
    tel.font = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:tel];
    
    UILabel *QQ = [[UILabel alloc]initWithFrame:CGRectMake(30, 50, 200, 20)];
    
    QQ.text = @"QQ:3240902064";
    
    QQ.font = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:QQ];

    
    JYTextFiled *idea = [[JYTextFiled alloc]initWithFrame:CGRectMake(30, 80, KWIDTH - 2 * 30, 150)];
    
    idea.placeholder = @"请输入你的意见或者建议";
    
    [idea setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    
    idea.layer.borderUIColor = [UIColor lightGrayColor];
    
    idea.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:idea];
    
    
    UITextField *Contact = [[UITextField alloc]initWithFrame:CGRectMake(30, 240, KWIDTH - 2 * 30, 40)];
    
    Contact.placeholder = @"请输入您的联系方式 (QQ/邮箱/手机)";
    
    Contact.delegate = self;
    
    
    [Contact setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    
    Contact.layer.borderUIColor = [UIColor lightGrayColor];
    
    Contact.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:Contact];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:@"提交" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor colorWithRed:250/255.0 green:111/255.0 blue:87/255.0 alpha:1];

    
    button.frame = CGRectMake(30, 290, KWIDTH - 2 * 30, 40);
    
    [self.view addSubview:button];
    

    
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
    //⭐️使用当前正在运行的状态开始下一段动画
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
- (void)leftBarButtonItemClick
{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   
    [self.view endEditing:YES];

}
@end
