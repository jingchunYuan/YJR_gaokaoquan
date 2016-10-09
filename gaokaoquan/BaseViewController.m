//
//  BaseViewController.m
//  gaokaoquan
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
{
    UIView * navView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.view.backgroundColor = UIColorRGBA(242, 242, 242, 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    


    // Dispose of any resources that can be recreated.
}
#pragma mark - 加载数据相关的
//下拉刷新
-(void)refreshData
{
    self.page = 1;
    [self loadData];
}
//上拉加载更多
-(void)loadMoreData
{
    self.page ++;
    [self loadData];
}
-(void)loadData
{
    //开始加载数据
    [HDManager startLoading];
}
//加载结束之后，停止刷新
-(void)stopLoadData
{
    [HDManager stopLoading];
}

@end
