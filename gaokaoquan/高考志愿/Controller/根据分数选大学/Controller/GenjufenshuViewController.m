
//
//  GenjufenshuViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/8.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GenjufenshuViewController.h"

@interface GenjufenshuViewController ()

@property (weak, nonatomic) IBOutlet UIButton *cityBtn;

@property (weak, nonatomic) IBOutlet UIButton *kemuBtn;

@property (weak, nonatomic) IBOutlet UIButton *piciBtn;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)shiyongBtn:(id)sender {
}
@end
