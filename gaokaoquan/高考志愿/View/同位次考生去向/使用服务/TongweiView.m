
//
//  TongweiView.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/19.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TongweiView.h"
#import "STPickerArea.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"

@interface TongweiView ()<UITextFieldDelegate,STPickerAreaDelegate, STPickerSingleDelegate>

@property (weak, nonatomic) IBOutlet UITextField *City;
@property (weak, nonatomic) IBOutlet UITextField *Weici;
@property (weak, nonatomic) IBOutlet UIButton *LIBtn;
@property (weak, nonatomic) IBOutlet UIButton *WENBtn;
@property (weak, nonatomic) IBOutlet UIButton *CheckBtn;

@property (nonatomic,assign) BOOL IsWL;

@end
@implementation TongweiView

+ (instancetype)loadNibView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"TongweiView" owner:nil options:nil]lastObject];
}

//理科按钮
- (IBAction)LIBtnClick:(UIButton *)sender {
    self.IsWL = NO;
    self.WENBtn.backgroundColor = [UIColor whiteColor];
    [self.WENBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
//文科按钮
- (IBAction)WenBtnClick:(UIButton *)sender {
    self.IsWL = YES;
    self.LIBtn.backgroundColor = [UIColor whiteColor];
    [self.LIBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
//查询按钮
- (IBAction)CheckBtnClick:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(Cityfiled:::)]) {
        [self.delegate Cityfiled:self.City :self.Weici :self.IsWL];
    }
    
}


// MARK:-textfiled的代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField == self.City) {
        
        [self.City resignFirstResponder];
        [[[STPickerArea alloc]initWithDelegate:self]show];
        
    }
    
    
}


//// MARK:-自定义代理方法
//- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
//{
//    
//    self.PiCi.text = selectedTitle;
//    
//    
//}
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
