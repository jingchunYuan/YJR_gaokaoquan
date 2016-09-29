//
//  AskQuestionsController.m
//  gaokaoquan
//
//  Created by admin on 16/9/10.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AskQuestionsController.h"

@interface AskQuestionsController ()<UIPickerViewDataSource,UIPickerViewDelegate>{
    NSMutableArray *_dataArray;
    UIView *_bottomView;
    UIPickerView *_pickerView;
    NSString *_dataString;
}

@end

@implementation AskQuestionsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提问";
    
    //初始化数据
    _dataArray = [[NSMutableArray alloc] init];
    //添加数据
    [self addPickerViewData];
    //创建UI
    [self createUI];
    
}
- (void)addPickerViewData {
    NSArray *array = @[ @"请选择话题",@"学习方法",@"经验分享",@"校园爱情",
                        @"高考专区",@"志愿填报",@"爱上大学"];
    [_dataArray addObjectsFromArray:array];
}
- (void)createUI {
    self.huaTiBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.huaTiBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self.huaTiBtn setTitle:@"请选择话题" forState:UIControlStateNormal];
    self.huaTiBtn.backgroundColor = [UIColor clearColor];
    self.huaTiBtn.layer.cornerRadius = 5;
    self.huaTiBtn.layer.masksToBounds = YES;
    self.huaTiBtn.tintColor = [UIColor blackColor];
    
    self.shuoMingTextField.layer.cornerRadius = 5;
    self.shuoMingTextField.layer.masksToBounds = YES;
    self.shuoMingTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.shuoMingTextField.layer.borderWidth = 0.5;
    self.shuoMingTextField.text = @"问题说明";
    self.shuoMingTextField.textColor = [UIColor lightGrayColor];
    
    //UIPickerView
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-240, SCREEN_WIDTH, 240)];
    _bottomView.backgroundColor = UIColorFromRGB(0xEFEFF4);
    [window addSubview:_bottomView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(SCREEN_WIDTH-60, 5, 50, 30);
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(finishClick:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:btn];
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 200)];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    _pickerView.showsSelectionIndicator = NO;
    _pickerView.backgroundColor = [UIColor lightGrayColor];
    [_bottomView addSubview:_pickerView];
    //隐藏
    _bottomView.alpha = 0.0;
}

- (IBAction)faBuBtnClick:(id)sender {
    NSLog(@"发布提问按钮的点击事件");
    
}
- (IBAction)biaoQingBtnClick:(id)sender {
    //添加表情按钮
    
}
- (IBAction)niMingBtnClick:(id)sender {
    if (self.niMingBtn.selected) {
        //未选中
        [self.niMingBtn setSelected:NO];
    }else {
        //选中
        [self.niMingBtn setSelected:YES];
    }
}
- (void)finishClick:(UIButton *)sender {
    [self.huaTiBtn setTitle:_dataString forState:UIControlStateNormal];
    _bottomView.alpha = 0.0; //隐藏
}
//选择话题
- (IBAction)biaoTiBtnClick:(id)sender {
    _bottomView.alpha = 1.0;
    [_pickerView reloadAllComponents];
}

#pragma mark -
#pragma mark - UIPickerViewDataSource,UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_dataArray count];
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.view.frame.size.width;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _dataArray[row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _dataString = _dataArray[row];
}

//回收键盘
- (IBAction)tapClick:(id)sender {
    [self.shuoMingTextField resignFirstResponder];
    [self.biaoTiLabel resignFirstResponder];
    _bottomView.alpha = 0.0; //隐藏
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
