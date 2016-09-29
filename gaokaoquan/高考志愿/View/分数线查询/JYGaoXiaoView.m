//
//  JYGaoXiaoView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYGaoXiaoView.h"
#import "STPickerArea.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"
@interface JYGaoXiaoView()<UITextFieldDelegate,STPickerAreaDelegate, STPickerSingleDelegate>

@property (weak, nonatomic) IBOutlet UITextField *city;

@property (weak, nonatomic) IBOutlet UITextField *PiCi;

@property (weak, nonatomic) IBOutlet UITextField *SchoolName;

@property (weak, nonatomic) IBOutlet UIButton *LIButton;

@property (weak, nonatomic) IBOutlet UIButton *WenButton;

@property (weak, nonatomic) IBOutlet UIButton *InquiryButton;



@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic,assign) BOOL IsWL;

@end
@implementation JYGaoXiaoView

+ (instancetype)loadNibView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JYGaoXiaoView" owner:nil options:nil]lastObject];
}

/// 查询按钮
- (IBAction)InquiryButtonClick:(UIButton *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(Cityfiled:::::)]) {
        
        [self.delegate Cityfiled:self.city :self.PiCi :self.SchoolName :self.label :self.IsWL];
        
    }
    
}

/// 文科按钮点击
- (IBAction)WenButtoncCick:(UIButton *)sender
{
    self.IsWL = YES;
    self.LIButton.backgroundColor = [UIColor whiteColor];
    [self.LIButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

/// 理科按钮点击
- (IBAction)LIButtonClick:(UIButton *)sender
{
    self.IsWL = NO;
    self.WenButton.backgroundColor = [UIColor whiteColor];
    [self.WenButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

// MARK:-textfiled的代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField == self.city) {
        
        [self.city resignFirstResponder];
        [[[STPickerArea alloc]initWithDelegate:self]show];
        
    }
    
    if (textField == self.PiCi) {
        [self.PiCi resignFirstResponder];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"本科一批",@"本科二批",@"本科三批",@"专科一批",@"专科二批", nil];
        STPickerSingle *single = [[STPickerSingle alloc]init];
        [single setArrayData:array];
        [single setTitle:@"请选择"];
        [single setDelegate:self];
        [single show];
        
    }
    
}

// MARK:-自定义代理方法
- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
{
    
    self.PiCi.text = selectedTitle;
    
    
}

// MARK:-选择地区的代理方法
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@" , province];
    self.city.text = text;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
