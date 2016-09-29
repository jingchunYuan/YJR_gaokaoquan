
//
//  GaoxiaoXqViewController.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/23.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoxiaoXqViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"
#import "STPickerArea.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"

@interface GaoxiaoXqViewController ()<UITextFieldDelegate,STPickerAreaDelegate, STPickerSingleDelegate>
//城市
@property (nonatomic,strong) UITextField *cityFiled;
//本科专科
@property (nonatomic,strong) UITextField *collegeFiled;

@property (nonatomic,strong) UITextField *textFiled;


@end

@implementation GaoxiaoXqViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = YES;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"高校分数线"];
    
    self.tableView.rowHeight = 70;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
      
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

#pragma mark - Table view data source




// MARK:-textfiled的代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.textFiled = textField;
    
    if (textField == self.cityFiled) {
        
        [self.textFiled resignFirstResponder];
        [self.cityFiled resignFirstResponder];
        [[[STPickerArea alloc]initWithDelegate:self]show];
        
    }
    
    if (textField == self.collegeFiled) {
        [self.collegeFiled resignFirstResponder];
        [self.textFiled resignFirstResponder];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"本科一批",@"本科二批",@"本科三批",@"专科一批",@"专科二批", nil];
        
        STPickerSingle *single = [[STPickerSingle alloc]init];
        [single setArrayData:array];
        [single setTitle:@"请选择"];
        [single setDelegate:self];
        [single show];
        
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return YES;
}


// MARK:-自定义代理方法
- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
{
    
    self.textFiled.text = selectedTitle;
    
    
}

// MARK:-选择地区的代理方法
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@", province];
    
    self.cityFiled.text = text;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}

- (void)Click:(UIButton *)btn
{
    
    NSLog(@"123");
    
}


@end
