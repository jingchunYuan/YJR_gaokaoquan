//
//  AcceptanceProbabilityViewController.m
//  gaokaoquan
//
//  Created by Nevis on 2016/10/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AcceptanceProbabilityViewController.h"
#import "LuquShowView.h"

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

@property (strong, nonatomic)  LuquShowView *showView;
@property (assign, nonatomic)  BOOL  isShow;


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
    
    
    
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]){
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"功能介绍"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(rightBarButtonItemClick)];
    
    
    __weak typeof(self) weakSelf = self;
    [self.showView setSelectBlock:^(LuquShowView *view, NSInteger index) {
        weakSelf.isShow = NO;
        NSLog(@"点击第%ld个item",index+1);
    }];
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:nil highlightedImage:nil title:[NSString stringWithFormat:@"功能介绍"] target:nil action:@selector(rightBarButtonItemClick)];
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _isShow = NO;
    [self.showView dismissView];
}

- (LuquShowView *)showView{
    
    if (_showView) {
        return _showView;
    }
    
    _showView = [[LuquShowView alloc]initWithFrame:(CGRect){CGRectGetWidth(self.view.frame)-100-10,64+5,200,0}
                                               items:@[@"item1",@"item2",@"item3",@"item4",@"item5"]
                                           showPoint:(CGPoint){CGRectGetWidth(self.view.frame)-25,10}];
    _showView.backGroundColor = [UIColor whiteColor];
    [self.view addSubview:_showView];
    return _showView;
}


- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBarButtonItemClick
{
    _isShow = !_isShow;
    
    if (_isShow) {
        [self.showView showView];
        
    }else{
        [self.showView dismissView];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
