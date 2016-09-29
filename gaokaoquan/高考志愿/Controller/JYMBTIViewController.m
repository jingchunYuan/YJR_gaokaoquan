//
//  JYMBTIViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMBTIViewController.h"
#import "JYMBTIModel.h"
#import "JYMBTIModel2.h"
#import "JYMBTIVie.h"
#define MAS_SHORTHAND
#import "Masonry.h"
@interface JYMBTIViewController ()

@property (nonatomic,copy) NSString *Title;

@property (nonatomic,copy) NSString *label;

@property (nonnull,copy) NSString *label2;

@property (nonatomic,copy) NSString *label3;

@end

@implementation JYMBTIViewController

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
    self.navigationItem.titleView = [self.view titleWithNavigat:@"MBTI性格测试"];
    
    [[JYNetWorkTool sharedTools]request:JYRequestMethodGET urlString:@"http://api.dev.gaokaoq.com/Mbti" parameters:nil callback:^(id responseObject, NSError *error) {
       
        JYMBTIModel *model = [JYMBTIModel mj_objectWithKeyValues:responseObject[@"data"]];
        self.Title = model.test_num;
        self.label = model.content.title;
        self.label2 = model.content.titles;
        self.label3 = model.content.test;
        
    }];
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scroll];
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 15, KWIDTH - 2 * 5, 100)];
    
    [scroll addSubview:label1];
    label1.numberOfLines = 0;
    label1.font = [UIFont systemFontOfSize:13];
    
    JYMBTIVie *MBTI = [JYMBTIVie loadNibView];
    MBTI.frame = CGRectMake(5, CGRectGetMaxY(label1.frame) + 20, KWIDTH - 2 * 5, 230);
    [scroll addSubview:MBTI];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(MBTI.frame) + 10, KWIDTH - 2 * 5, 70)];
    [scroll addSubview:label2];
    label2.numberOfLines = 0;
    label2.font = [UIFont systemFontOfSize:13];
    
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(label2.frame) + 10, KWIDTH - 2 * 5, 200)];
    [scroll addSubview:label3];
    label3.numberOfLines = 0;
    label3.font = [UIFont systemFontOfSize:13];
    
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[self.label2 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    NSAttributedString * attrStr2 = [[NSAttributedString alloc] initWithData:[self.label3 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:nil highlightedImage:nil title:[NSString stringWithFormat:@"已有%@人测试",self.Title] target:nil action:nil];
        label1.text = self.label;
        label2.attributedText = attrStr;
        label3.attributedText = attrStr2;
        
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
    
    
    scroll.contentSize = CGSizeMake(0, CGRectGetMaxY(label3.frame) + 50);
    
    
}

- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
