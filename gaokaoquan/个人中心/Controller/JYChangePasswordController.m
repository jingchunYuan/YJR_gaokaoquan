//
//  JYChangePasswordController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/14.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYChangePasswordController.h"

@interface JYChangePasswordController ()

@end

@implementation JYChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = [self.view titleWithNavigat:@"修改密码"];
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    [self setUI];
    
    
    
}

// MARK:-UI搭建
- (void)setUI
{
   
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.center.x - 57, 40, 115, 45)];
    
    
    imageview.image = [UIImage imageNamed:@"图层-10"];
    
    
    [self.view addSubview:imageview];
    
    
    UITextField *OldPassword = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, KWIDTH - 2 * 50, 30)];
    
    OldPassword.placeholder = @"原密码";
    
    
    [OldPassword setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];

    
    OldPassword.layer.borderUIColor = [UIColor lightGrayColor];
    
    OldPassword.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:OldPassword];
    
    UITextField *newPassword = [[UITextField alloc]initWithFrame:CGRectMake(50, 140, KWIDTH - 2 * 50, 30)];
    
    newPassword.placeholder = @"新密码";
    
    [newPassword setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];

    
    newPassword.layer.borderUIColor = [UIColor lightGrayColor];
    
    newPassword.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:newPassword];
    
    UITextField *UpdataPassword = [[UITextField alloc]initWithFrame:CGRectMake(50, 180, KWIDTH - 2 * 50, 30)];
    
    UpdataPassword.placeholder = @"确认新密码";
    
     [UpdataPassword setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    
    UpdataPassword.layer.borderUIColor = [UIColor lightGrayColor];
    
    UpdataPassword.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:UpdataPassword];

    
    
    UIButton *SaveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    SaveBtn.frame = CGRectMake(80, 220, KWIDTH - 2 * 80, 30);
    
    [SaveBtn setTitle:@"保存" forState:UIControlStateNormal];
    
    SaveBtn.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    
    [self.view addSubview:SaveBtn];
    
    [SaveBtn addTarget:self action:@selector(SaveBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    


}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self.view endEditing:YES];
    
    
}

// MARK:-保存

- (void)SaveBtnClick:(UIButton *)saveBtn
{

    NSLog(@"保存");

}

- (void)leftBarButtonItemClick
{

    [self.navigationController popViewControllerAnimated:YES];


}

@end
