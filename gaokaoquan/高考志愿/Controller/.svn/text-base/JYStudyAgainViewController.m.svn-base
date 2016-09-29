//
//  JYStudyAgainViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYStudyAgainViewController.h"
#import "JYStudyAgainModel.h"
#import "JYStudyAnswerViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"
@interface JYStudyAgainViewController ()

@property (nonatomic,copy) NSString *string;

@property (nonatomic,copy) NSString *string2;

@property (nonatomic,copy) NSAttributedString *attar;

@end

@implementation JYStudyAgainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)setUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"复读测试"];
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/test/view?key=fudu" parameters:nil callback:^(id responseObject, NSError *error) {
        
        JYStudyAgainModel *model = [JYStudyAgainModel mj_objectWithKeyValues:responseObject[@"data"][@"test"]];
        
        self.string = model.test_num;
        self.string2 = model.content;
        NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[self.string2 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        self.attar = attrStr;
        
    }];
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scroll];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, KWIDTH - 2 * 10, 650)];
    
    [scroll addSubview:label1];
    label1.numberOfLines = 0;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:nil highlightedImage:nil title:[NSString stringWithFormat:@"已有%@人测试",self.string] target:nil action:nil];
        label1.attributedText = self.attar;

    });

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(50);
        
    }];
    
    button.backgroundColor = [UIColor orangeColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"立即测试" forState:UIControlStateNormal];
    
    scroll.contentSize = CGSizeMake(0, CGRectGetMaxY(label1.frame) + 50);
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)btn
{
    JYStudyAnswerViewController *answer = [[JYStudyAnswerViewController alloc]init];
    [self.navigationController pushViewController:answer animated:YES];

}

- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
