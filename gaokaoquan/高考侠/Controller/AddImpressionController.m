//
//  AddImpressionController.m
//  gaokaoquan
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AddImpressionController.h"

@interface AddImpressionController ()

@end

@implementation AddImpressionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"添加印象";
    
    //设置UI
    [self createUI];

}

- (void)createUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.bgView.backgroundColor = [UIColor lightGrayColor];
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
    
    self.whiteView.backgroundColor = [UIColor whiteColor];
    self.whiteView.layer.cornerRadius = 5;
    self.whiteView.layer.masksToBounds = YES;
    
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.borderWidth = 0.5;
    self.textView.textColor = [UIColor lightGrayColor];
    
    self.saveBtn.backgroundColor = [UIColor orangeColor];
    self.saveBtn.layer.cornerRadius = 5;
    self.saveBtn.layer.masksToBounds = YES;
    
}

- (IBAction)savaBtnClick:(id)sender {
    NSLog(@"保存印象的按钮点击事件");
    
}

- (IBAction)tapClick:(id)sender {
    // 回收键盘
    [self.textView resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
