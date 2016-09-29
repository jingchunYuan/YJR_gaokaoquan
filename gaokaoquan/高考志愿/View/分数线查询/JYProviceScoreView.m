//
//  JYProviceScoreView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYProviceScoreView.h"
#import "STPickerArea.h"
#import "STPickerSingle.h"
@interface JYProviceScoreView()<UITextFieldDelegate,STPickerAreaDelegate, STPickerSingleDelegate>
@property (weak, nonatomic) IBOutlet UITextField *City;
@property (weak, nonatomic) IBOutlet UITextField *PICi;
@property (weak, nonatomic) IBOutlet UIButton *LIBtn;
@property (weak, nonatomic) IBOutlet UIButton *WENBtn;
@property (nonatomic,assign) BOOL ISwl;
@end
@implementation JYProviceScoreView

+ (instancetype)loadNibView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JYProviceScoreView" owner:nil options:nil]lastObject];
}

// 理科按钮点击
- (IBAction)LIBtnClick:(UIButton *)sender
{   self.ISwl = NO;
    self.WENBtn.backgroundColor = [UIColor whiteColor];
    [self.WENBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}

// 文科按钮点击
- (IBAction)WenBtnClick:(UIButton *)sender
{
    self.ISwl = YES;
    self.LIBtn.backgroundColor = [UIColor whiteColor];
    [self.LIBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    
}
- (IBAction)CheckBtnClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(ckeckClicK:PICIFiled:ISwl:)]) {
        
        [self.delegate ckeckClicK:self.City PICIFiled:self.PICi ISwl:self.ISwl];
    }
    
}

// MARK:-textfiled的代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField == self.City) {
        
        [self.City resignFirstResponder];
        [[[STPickerArea alloc]initWithDelegate:self]show];
        
    }
    
    if (textField == self.PICi) {
        [self.PICi resignFirstResponder];
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
    
    self.PICi.text = selectedTitle;
    
    
}

// MARK:-选择地区的代理方法
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@" , province];
    self.City.text = text;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

@end
