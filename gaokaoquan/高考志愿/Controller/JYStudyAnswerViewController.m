//
//  JYStudyAnswerViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYStudyAnswerViewController.h"

@interface JYStudyAnswerViewController ()

@property (nonatomic,strong) UIProgressView *progress;

@end

@implementation JYStudyAnswerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"复读测试"];
    UIProgressView *progress = [[UIProgressView alloc]initWithFrame:CGRectMake(25, 50, KWIDTH - 2 * 25, 20)];
    [self.view addSubview:progress];
    progress.trackTintColor = [UIColor darkGrayColor];
    progress.progressTintColor = [UIColor orangeColor];
    progress.progress = 3.0 / 31.0;


}

- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
