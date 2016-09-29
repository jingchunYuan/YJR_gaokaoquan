//
//  YuyueViewController.m
//  gaokaoquan
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "YuyueViewController.h"

@interface YuyueViewController ()<UIPickerViewDataSource,UIPickerViewDelegate> {
    
    NSMutableArray *_dataArray; // 日期
    NSMutableArray *_timeDataArray; // 时间

    UIView *_bottomView;
    UIPickerView *_pickerView;
    
    BOOL _flag;
    
    NSString *_dataString;
    NSString *_timeString;
    
}
@end

@implementation YuyueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.true_name;
    
    //初始化数据
    _dataArray = [[NSMutableArray alloc] init];
    _timeDataArray = [[NSMutableArray alloc] init];
    
    //添加数据
    [self addPickerViewData];
    
    //创建UI
    [self createUI];
    
}

- (void)addPickerViewData {
    NSArray *array = @[ @"请选择上课日期",@"2016-09-08",@"2016-09-09",@"2016-09-10",
                        @"2016-09-11",@"2016-09-12",@"2016-09-13",@"2016-09-14"
                      ];
    [_dataArray addObjectsFromArray:array];
    NSArray *timeArray = @[@"请选择上课时间",@"10:00",@"10:30",@"11:00",@"11:30",@"12:00",
                           @"12:30",@"13:00",@"13:30",@"14:00",@"14:30",@"15:00",@"15:30",
                           @"16:00",@"16:30",@"17:00",@"17:30",@"18:00",@"18:30",@"19:00",
                           @"19:30",@"20:00",@"20:30",@"21:00",@"21:30",@"22:00",@"22:30"];
    [_timeDataArray addObjectsFromArray:timeArray];
}

- (void)createUI {
    
    _flag = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.headImage.image = [UIImage imageNamed:@"用户"];
    
    self.wenTiMiaoShuTextView.layer.cornerRadius = 5;
    self.wenTiMiaoShuTextView.layer.masksToBounds = YES;
    self.wenTiMiaoShuTextView.layer.borderWidth = 0.5;
    self.wenTiMiaoShuTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.wenTiMiaoShuTextView.textColor = [UIColor lightGrayColor];
    
    self.dateBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.dateBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self.dateBtn setTitle:@"2016-09-14" forState:UIControlStateNormal];
    self.dateBtn.backgroundColor = [UIColor orangeColor];
    self.dateBtn.layer.cornerRadius = 5;
    self.dateBtn.layer.masksToBounds = YES;
    
    self.timeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.timeBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [self.timeBtn setTitle:@"20:00" forState:UIControlStateNormal];
    self.timeBtn.backgroundColor = [UIColor orangeColor];
    self.timeBtn.layer.cornerRadius = 5;
    self.timeBtn.layer.masksToBounds = YES;
    
    self.yuYueSubmitBtn.layer.cornerRadius = 5;
    self.yuYueSubmitBtn.layer.masksToBounds = YES;
    self.yuYueSubmitBtn.backgroundColor = [UIColor orangeColor];
    
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

- (IBAction)dateClick:(id)sender {
    _flag = YES;
    _bottomView.alpha = 1.0;
    [_pickerView reloadAllComponents];
}

#pragma mark - 
#pragma mark - UIPickerViewDataSource,UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (_flag) {
        return [_dataArray count];
    }else {
        return [_timeDataArray count];
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return self.view.frame.size.width;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (_flag) {
        return _dataArray[row];
    }else {
        return _timeDataArray[row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (_flag) {
        _dataString = _dataArray[row];
    }else {
        _timeString = _timeDataArray[row];
    }
}


- (IBAction)timeClick:(id)sender {
    _flag = NO;
    _bottomView.alpha = 1.0;
    [_pickerView reloadAllComponents];
}
- (void)finishClick:(UIButton *)sender {
    if (_flag) {
        [self.dateBtn setTitle:_dataString forState:UIControlStateNormal];
    }else {
        [self.timeBtn setTitle:_timeString forState:UIControlStateNormal];
    }
    _bottomView.alpha = 0.0; //隐藏
}
- (IBAction)submitClick:(id)sender {
    NSLog(@"预约按钮的点击事件");
    
}

- (IBAction)tapClick:(id)sender {
    //回收键盘
    [self.ziXunZhuTiTextFeild resignFirstResponder];
    [self.wenTiMiaoShuTextView resignFirstResponder];
    [self.phoneTextField resignFirstResponder];
    _bottomView.alpha = 0.0; //隐藏
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
