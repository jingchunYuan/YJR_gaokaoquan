
//
//  GenjufenshuViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/8.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GenjufenshuViewController.h"

@interface GenjufenshuViewController ()
//北京
@property (weak, nonatomic) IBOutlet UIButton *cityBtn;
//文科理科
@property (weak, nonatomic) IBOutlet UIButton *kemuBtn;
//批次
@property (weak, nonatomic) IBOutlet UIButton *piciBtn;
//选大学
@property (weak, nonatomic) IBOutlet UITextField *textLb;
- (IBAction)shiyongBtn:(id)sender;

@end

@implementation GenjufenshuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
}

-(void)layoutUI{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
     self.navigationItem.titleView = [self.view titleWithNavigat:@"估分选大学"];
    
//    _collegeTxt.borderStyle = UITextBorderStyleLine;
//    _collegeTxt.layer.masksToBounds = YES;
//    _collegeTxt.layer.borderColor = [UIColor whiteColor].CGColor;
//    _collegeTxt.layer.borderWidth = 1;
    _textLb.borderStyle = UITextBorderStyleLine;
    _textLb.layer.borderColor = [UIColor whiteColor].CGColor;
    _textLb.layer.masksToBounds = YES;
    _textLb.layer.borderColor = [UIColor whiteColor].CGColor;
    _textLb.layer.borderWidth = 1;
    _cityBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _cityBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _piciBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _piciBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _kemuBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _kemuBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    

    
}

- (void)leftBarButtonItemClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)shiyongBtn:(id)sender {
}
@end
