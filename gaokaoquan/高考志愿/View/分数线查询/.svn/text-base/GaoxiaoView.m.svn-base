//
//  GaoxiaoView.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/23.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoxiaoView.h"
#import "STPickerArea.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"
@interface GaoxiaoView()<UITextFieldDelegate,STPickerAreaDelegate,STPickerSingleDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityText;

@property (weak, nonatomic) IBOutlet UITextField *zhuanyeText;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;

@property (weak, nonatomic) IBOutlet UIButton *wenkeBtn;

@property (weak, nonatomic) IBOutlet UITextField *clooegeText;



- (IBAction)chaxunBtn:(id)sender;
/// 全局变量textfiled
@property (nonnull,strong) UITextField *textfiled;


@end
@implementation GaoxiaoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return  [[[NSBundle mainBundle]loadNibNamed:@"GaoxiaoView" owner:nil options:nil]lastObject];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.textfiled = textField;
    
    if (textField == self.cityText) {
        
        [self.cityText resignFirstResponder];
        
        [[[STPickerArea alloc]initWithDelegate:self]show];
        
    }

    if (textField == self.zhuanyeText) {
        
        [self.zhuanyeText resignFirstResponder];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"本科一批",@"本科二批",@"本科三批",@"专科一批",@"专科二批", nil];
        
        STPickerSingle *single = [[STPickerSingle alloc]init];
        [single setArrayData:array];
        [single setTitle:@"请选择"];
        [single setDelegate:self];
        [single show];
        
    }

    if (textField == self.clooegeText) {
        [self.zhuanyeText resignFirstResponder];
        STPickerSingle *sg = [[STPickerSingle alloc]init];
        
    }
    
}

// MARK:-自定义代理方法
- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
{
    
    self.textfiled.text = selectedTitle;
    
    
}

// MARK:-选择地区的代理方法
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@ ", province];
    
    self.cityText.text = text;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self endEditing:YES];
    
    
}



- (IBAction)chaxunBtn:(id)sender {
}
@end
