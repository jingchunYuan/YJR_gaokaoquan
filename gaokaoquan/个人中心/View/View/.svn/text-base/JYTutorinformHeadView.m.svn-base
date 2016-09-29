//
//  JYTutorinformHeadView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorinformHeadView.h"
#import "STPickerArea.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"
@interface JYTutorinformHeadView()<UITextFieldDelegate,STPickerAreaDelegate, STPickerSingleDelegate>

@property (weak, nonatomic) IBOutlet UIButton *Girl;
/// 星座textfiled
@property (weak, nonatomic) IBOutlet UITextField *Constellation;

@property (weak, nonatomic) IBOutlet UIButton *Boy;
/// 学历textfiled
@property (weak, nonatomic) IBOutlet UITextField *StudyFiled;

/// 籍贯textfiled
@property (weak, nonatomic) IBOutlet UITextField *native;

/// 全局变量textfiled
@property (nonnull,strong) UITextField *textfiled;

@end

@implementation JYTutorinformHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
       
       
        
}

    return  [[[NSBundle mainBundle]loadNibNamed:@"JYTutorinformHeadView" owner:nil options:nil]lastObject];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.textfiled = textField;
    
    if (textField == self.native) {
        
        [self.native resignFirstResponder];
        [[[STPickerArea alloc]initWithDelegate:self]show];
        
    }
    
    if (textField == self.Constellation) {
        
        [self.Constellation resignFirstResponder];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座",@"水瓶座",@"双鱼座", nil];
        
        STPickerSingle *single = [[STPickerSingle alloc]init];
        [single setArrayData:array];
        [single setTitle:@"请选择"];
        [single setDelegate:self];
        [single show];
        
    }
    
    if (textField == self.StudyFiled) {
        
        [self.StudyFiled  resignFirstResponder];
        
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"博士",@"硕士",@"本科",@"大专",@"中专",@"中技",@"高中",@"初中",@"其他", nil];
        
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
    
    self.textfiled.text = selectedTitle;
    
    
}

// MARK:-选择地区的代理方法
- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    
    self.native.text = text;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self endEditing:YES];


}


- (IBAction)Girl:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    
    self.Boy.selected = NO;
    
    
}

- (IBAction)Boy:(UIButton *)sender {
    

    sender.selected = !sender.selected;
    
    self.Girl.selected = NO;
    
}
- (IBAction)Math:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}
- (IBAction)YW:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}
- (IBAction)YY:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)HX:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)WL:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)SW:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}
- (IBAction)ZZ:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)LL:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)DL:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)GA:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)CG:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)ZY:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)ZZZ:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)ZYZX:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}

- (IBAction)BaoY:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)XXTD:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)KQXT:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)QGWT:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)MS:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)Music:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)Sport:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)GKZC:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)GKLQGZ:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)TBJQ:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)ZYGH:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)GKSJFX:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)BKZC:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}

- (IBAction)ZYSZ:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)ZSDT:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
- (IBAction)Save:(UIButton *)sender {
    
    sender.selected = !sender.selected;
}
@end
