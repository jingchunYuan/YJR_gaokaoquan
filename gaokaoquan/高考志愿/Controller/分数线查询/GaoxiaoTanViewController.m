//
//  GaoxiaoTanViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/23.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoxiaoTanViewController.h"

@interface GaoxiaoTanViewController ()

@property (weak, nonatomic) IBOutlet UITableView *zjCell;

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *addArray;

@end

@implementation GaoxiaoTanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)createUI {
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
