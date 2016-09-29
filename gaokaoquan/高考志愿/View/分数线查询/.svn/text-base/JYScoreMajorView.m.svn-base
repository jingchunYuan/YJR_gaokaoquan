//
//  JYScoreMajorView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYScoreMajorView.h"
#import "STPickerArea.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"
@interface JYScoreMajorView()<UITextFieldDelegate,STPickerAreaDelegate, STPickerSingleDelegate>

@property (weak, nonatomic) IBOutlet UITextField *WLFiled;

@property (weak, nonatomic) IBOutlet UITextField *cityFiled;

@property (weak, nonatomic) IBOutlet UITextField *PICI;

@property (weak, nonatomic) IBOutlet UITextField *NIAN;

@property (nonatomic,strong) UITextField *textFiled;

@property (weak, nonatomic) IBOutlet UITextField *School;

@end

@implementation JYScoreMajorView
- (IBAction)CheckClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(WLFiled:::::)]) {
        
        [self.delegate WLFiled:self.WLFiled :self.cityFiled :self.PICI :self.NIAN :self.School];
    }
    
    
}

// MARK:-textfiled的代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    self.textFiled = textField;
    if (textField == self.cityFiled) {
        
        [self.cityFiled resignFirstResponder];
        [[[STPickerArea alloc]initWithDelegate:self]show];
        
    }
    
    if (textField == self.PICI) {
        [self.PICI resignFirstResponder];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"本科一批",@"本科二批",@"本科三批",@"专科一批",@"专科二批", nil];
        STPickerSingle *single = [[STPickerSingle alloc]init];
        [single setArrayData:array];
        [single setTitle:@"请选择"];
        [single setDelegate:self];
        [single show];
        
    }
    
    if (textField == self.WLFiled) {
        [self.WLFiled resignFirstResponder];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"文科",@"理科", nil];
        STPickerSingle *single = [[STPickerSingle alloc]init];
        [single setArrayData:array];
        [single setTitle:@"请选择"];
        [single setDelegate:self];
        [single show];
        
    }
    
    if (textField == self.NIAN) {
        [self.NIAN resignFirstResponder];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2015",@"2014", nil];
        STPickerSingle *single = [[STPickerSingle alloc]init];
        [single setArrayData:array];
        [single setTitle:@"请选择"];
        [single setDelegate:self];
        [single show];
        
    }
    
    
    if (textField == self.School) {
        
        //设置动画的名字
        [UIView beginAnimations:@"Animation" context:nil];
        //设置动画的间隔时间
        [UIView setAnimationDuration:0.20];
        //⭐️使用当前正在运行的状态开始下一段动画
        [UIView setAnimationBeginsFromCurrentState: YES];
        //设置视图移动的位移
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - 100, self.frame.size.width, self.frame.size.height);
        //设置动画结束
        [UIView commitAnimations];
    }

    
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.School) {

    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    //设置动画结束
    [UIView commitAnimations];
        
    }
    
}
// MARK:-textfiled的代理方法点击return操作
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}

// MARK:-自定义代理方法
- (void)pickerSingle:(STPickerSingle *)pickerSingle selectedTitle:(NSString *)selectedTitle
{
    
    self.textFiled.text = selectedTitle;
    
    
}

// MARK:-选择地区的代理方法
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@" , province];
    self.cityFiled.text = text;
    
}



+ (instancetype)loadNibView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JYScoreMajorView" owner:nil options:nil]lastObject];
}


@end

