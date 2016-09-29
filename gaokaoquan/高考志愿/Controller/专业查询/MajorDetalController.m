//
//  MajorDetalController.m
//  gaokaoquan
//
//  Created by admin on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalController.h"

@interface MajorDetalController ()

@end

@implementation MajorDetalController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.name;
    
    //创建UI
    [self createUI];
    
    
}




-(void)createUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];


}

-(void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
