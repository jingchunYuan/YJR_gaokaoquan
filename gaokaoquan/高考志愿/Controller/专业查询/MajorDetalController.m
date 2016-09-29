//
//  MajorDetalController.m
//  gaokaoquan
//
//  Created by admin on 16/9/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "MajorDetalController.h"
#import "DetalHeaderCell.h"

@interface MajorDetalController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MajorDetalController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.name;
    
    //创建UI
    [self createUI];
    
    
}


#pragma mark - 
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"DetalHeaderCell";
    DetalHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.backgroundColor = VIEWCONTROLLERBGCOLOR;
    if (!cell) {
        cell = [[DetalHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}




-(void)createUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    [self.view addSubview:self.tableView];

}

-(void)leftBarButtonItemClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark - Getter and Setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = VIEWCONTROLLERBGCOLOR;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DetalHeaderCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([DetalHeaderCell class])];
    }
    return _tableView;
}

@end
