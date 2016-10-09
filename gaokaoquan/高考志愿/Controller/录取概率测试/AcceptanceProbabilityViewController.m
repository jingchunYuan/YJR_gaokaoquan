//
//  AcceptanceProbabilityViewController.m
//  gaokaoquan
//
//  Created by Nevis on 2016/10/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AcceptanceProbabilityViewController.h"

@interface AcceptanceProbabilityViewController ()

//目标大学
@property (weak, nonatomic) IBOutlet UITextField *collegeTxt;
//北京 (地址)
@property (weak, nonatomic) IBOutlet UIButton *adrBtn;
//批次
@property (weak, nonatomic) IBOutlet UIButton *batchBtn;
//预估分数
@property (weak, nonatomic) IBOutlet UITextField *scoreTxt;
//理科
@property (weak, nonatomic) IBOutlet UIButton *subjectBtn;




@end

@implementation AcceptanceProbabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}
-(void)layoutUI{
////    self.automaticallyAdjustsScrollViewInsets = NO;
////    self.edgesForExtendedLayout = UIRectEdgeNone;
//
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"录取概率测试"];
//    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    scrollView.scrollEnabled = YES;

    _collegeTxt.borderStyle = UITextBorderStyleLine;
    _collegeTxt.layer.masksToBounds = YES;
    _collegeTxt.layer.borderColor = [UIColor whiteColor].CGColor;
    _collegeTxt.layer.borderWidth = 1;
    _scoreTxt.borderStyle = UITextBorderStyleLine;
    _scoreTxt.layer.borderColor = [UIColor whiteColor].CGColor;
    _scoreTxt.layer.masksToBounds = YES;
    _scoreTxt.layer.borderColor = [UIColor whiteColor].CGColor;
    _scoreTxt.layer.borderWidth = 1;
    _adrBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _adrBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _batchBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _batchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _subjectBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _subjectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    
    
}


- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
