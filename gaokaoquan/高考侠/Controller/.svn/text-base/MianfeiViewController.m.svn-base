//
//  MianfeiViewController.m
//  gaokaoquan
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MianfeiViewController.h"

@interface MianfeiViewController ()

@end

@implementation MianfeiViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"initWithNibName");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.true_name;
    
    //设置UI
    [self createUI];
    
}

- (void)createUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //设置
    self.scrollView.contentSize = CGSizeMake(0, 470-64-49);
    [self.headImageView setImage:[UIImage imageNamed:@"笔记"]];
    self.sendBtn.backgroundColor = [UIColor orangeColor];
    self.sendBtn.tintColor = [UIColor whiteColor];
    self.sendBtn.layer.cornerRadius = 5.0;
    self.sendBtn.layer.masksToBounds = YES;
    
    self.textView.textColor = [UIColor lightGrayColor];
    self.textView.layer.cornerRadius = 5.0;
    self.textView.layer.masksToBounds = 5.0;
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.borderWidth = 0.5;
    
}

- (IBAction)tapBgView:(id)sender {
    NSLog(@"回收键盘");
    [self.textView resignFirstResponder];
}

- (IBAction)sendBtnClick:(id)sender {
    NSLog(@"发送私信按钮点击事件");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
