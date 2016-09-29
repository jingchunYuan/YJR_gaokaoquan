//
//  JYInformationViewController.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYInformationViewController.h"
#define MAS_SHORTHAND
#import "Masonry.h"
#import "STPickerArea.h"
#import "STPickerSingle.h"
#import "STPickerDate.h"
@interface JYInformationViewController()<UITextFieldDelegate,STPickerAreaDelegate, STPickerSingleDelegate>
/// 性别的textfiled
@property (nonatomic,strong) UITextField *sexFiled;

/// 省市的textfiled
@property (nonatomic,strong) UITextField *CityFiled;

/// 年级的textfiled
@property (nonatomic,strong) UITextField *gradeFiled;

@property (nonatomic,strong) UITextField *textFiled;

@end
@implementation JYInformationViewController
- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.tabBarController.tabBar.hidden = YES;
   
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"返回.png" highlightedImage:nil title:nil target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.titleView = [self.view titleWithNavigat:@"个人资料"];
    
    self.tableView.rowHeight = 70;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];

    
}


-(void)leftBarButtonItemClick
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

// MARK:-数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 13;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(50, 30, 40, 10)];
 
    name.font = [UIFont systemFontOfSize:15];
    
    [cell addSubview:name];
    
    if (indexPath.row == 0) {
        

        name.text = @"账号:";
        
        UILabel *num = [[UILabel alloc]initWithFrame:CGRectMake(100, 25, 120, 20)];
        
        num.font = [UIFont systemFontOfSize:15];
        
        num.text = @"13521087083";
        
        [cell addSubview:num];
        
        
    }else if (indexPath.row == 1){
        
        name.text = @"头像:";

        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(100, 13, 40, 40)];
        
        imageview.image = [UIImage imageNamed:@"高考侠2戴眼镜默认头像.jpg"];
        
        imageview.layer.cornerRadius = 20;
        imageview.layer.masksToBounds = YES;
        
        [cell addSubview:imageview];
    
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:@"上传头像" forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        btn.frame = CGRectMake(140, 18, 100, 30);
        
        [btn setTitleColor:[UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1] forState:UIControlStateNormal];
    
        [cell addSubview:btn];
        
    
    }else if (indexPath.row == 2){
        
        name.text = @"姓名:";
    
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(100, 18, KWIDTH - 150, 35)];
        
        text.delegate = self;
        
        [text setFont:[UIFont systemFontOfSize:15]];
        text.text = @"高考侠";
        
        text.layer.borderColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1].CGColor;
        
        text.layer.cornerRadius = 5;
        
        text.layer.borderWidth = 1.0f;

        [cell addSubview:text];
        
    
    }else if (indexPath.row == 3){

        name.text = @"*性别:";
        name.x = 43;
        name.width = 50;
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(100, 18, KWIDTH - 200, 35)];
        
        self.sexFiled = text;
        
        text.delegate = self;
        
        text.placeholder = @"请选择";
        text.tag = 10;
        [text setFont:[UIFont systemFontOfSize:15]];
        text.layer.cornerRadius = 5;
        text.layer.borderWidth = 1.0f;
        text.layer.borderColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1].CGColor;
        
        [cell addSubview:text];

    }else if (indexPath.row == 4){
       
      //  UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 100, 10)];
        name.x = 25 - 9;
        name.width = 100;
        name.text = @"*所在省市:";
        
        [cell addSubview:name];
        
        
        UITextField *city = [[UITextField alloc]initWithFrame:CGRectMake(100, 18, KWIDTH-150, 35)];
    
        self.CityFiled = city;
        city.delegate = self;
        city.font = [UIFont systemFontOfSize:14];
        city.placeholder = @"请选择";
        city.layer.cornerRadius = 5;
        city.layer.masksToBounds = YES;
        city.layer.borderWidth = 1;
        city.layer.borderColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1].CGColor;
        
        [cell addSubview:city];
        
      
        
    
    }else if (indexPath.row == 5){
    
        
        name.text = @"科目:";
      
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(110, 25, 20, 20);
        
        [btn setImage:[UIImage imageNamed:@"weixuanzhong.png"] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:@"xuanzhong.png"] forState:UIControlStateSelected];
        
        [cell addSubview:btn];

        UILabel *li = [[UILabel alloc]initWithFrame:CGRectMake(130, 15, 40, 40)];
        
        li.text = @"理科";
        
        li.font = [UIFont systemFontOfSize:15];
        
        [cell addSubview:li];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn2.frame = CGRectMake(190, 25, 20, 20);
        
        [btn2 setImage:[UIImage imageNamed:@"weixuanzhong.png"] forState:UIControlStateNormal];
        
        [btn2 setImage:[UIImage imageNamed:@"xuanzhong.png"] forState:UIControlStateSelected];
        
        [cell addSubview:btn2];
        
        UILabel *li2 = [[UILabel alloc]initWithFrame:CGRectMake(210, 15, 40, 40)];
        
        li2.font = [UIFont systemFontOfSize:15];
        
        li2.text = @"文科";
        
        [cell addSubview:li2];

        
    
    
    }else if (indexPath.row == 6){

        name.text = @"年级:";

        UITextField *grade = [[UITextField alloc]initWithFrame:CGRectMake(100, 20, KWIDTH - 150, 35)];
        self.gradeFiled = grade;
        grade.delegate = self;
        grade.placeholder = @"请选择";
        grade.tag = 20;
      //  [grade setFont:[UIFont systemFontOfSize:14]];
        grade.font = [UIFont systemFontOfSize:13];
        grade.layer.cornerRadius = 5;
        grade.layer.borderWidth = 1.0f;
        grade.layer.borderColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1].CGColor;
        
        [cell addSubview:grade];

    
    }else if (indexPath.row == 7){
        
        name.x = 25 - 9;
        name.width = 100;
        name.text = @"*高中学校:";
  
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(100, 20, KWIDTH - 150, 35)];
         text.delegate = self;
        [text setFont:[UIFont systemFontOfSize:15]];
        text.layer.cornerRadius = 5;
        text.layer.borderWidth = 1.0f;
        text.layer.borderColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1].CGColor;
        
        [cell addSubview:text];
        
    
    }else if (indexPath.row == 8){
        
        name.x = 25;
        name.width = 100;
        name.text = @"目标大学:";
        
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(100, 20, KWIDTH - 150, 35)];
         text.delegate = self;
        [text setFont:[UIFont systemFontOfSize:15]];
        text.layer.cornerRadius = 5;
        text.layer.borderWidth = 1.0f;
        text.layer.borderColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1].CGColor;
        
        [cell addSubview:text];

  
    
    }else if (indexPath.row == 9){
    
        name.x = 25 ;
        name.width = 100;
        name.text = @"目标专业:";
        
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(100, 20, KWIDTH - 150, 35)];
         text.delegate = self;
        [text setFont:[UIFont systemFontOfSize:15]];
        text.layer.cornerRadius = 5;
        text.layer.borderWidth = 1.0f;
        text.layer.borderColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1].CGColor;
        
        [cell addSubview:text];

    
    }else if (indexPath.row == 10){
        
        name.x = 25;
        name.width = 100;
        name.text = @"QQ号码:";
        
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(100, 20, KWIDTH - 150, 35)];
        text.delegate = self;
        [text setFont:[UIFont systemFontOfSize:15]];
        text.layer.cornerRadius = 5;
        text.layer.borderWidth = 1.0f;
        text.layer.borderColor = [UIColor colorWithRed:182/255.0 green:182/255.0 blue:182/255.0 alpha:1].CGColor;
        
        [cell addSubview:text];

    
    
    
    }else if (indexPath.row == 11){
    
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(20, 20, KWIDTH - 2 * 20 , 30);
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [btn setTitle:@"确认保存" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        btn.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
        
        [cell addSubview:btn];
        
    
    
    }else if (indexPath.row == 12){
    
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(55, 0, 24   , 24)];
        
        imageview.image = [UIImage imageNamed:@"gerenzhongxin-gerenziliao"];
        
        [cell addSubview:imageview];
    
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 2, KWIDTH - 2 * 50, 20)];
        
        
        label.textAlignment = 1;
        
        label.font = [UIFont systemFontOfSize:15];
        
         label.text = @"带*号的一旦提交不可更改";
        
        [cell addSubview:label];
        
    
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
 return cell;

}

// MARK:-textfiled的代理方法
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.textFiled = textField;
    
    if (textField == self.CityFiled) {
        
        [self.textFiled resignFirstResponder];
        [self.CityFiled resignFirstResponder];
        [[[STPickerArea alloc]initWithDelegate:self]show];
        
    }
    
    if (textField == self.sexFiled) {
        [self.sexFiled resignFirstResponder];
        [self.textFiled resignFirstResponder];
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"男",@"女", nil];
        
        STPickerSingle *single = [[STPickerSingle alloc]init];
        [single setArrayData:array];
        [single setTitle:@"请选择"];
        [single setDelegate:self];
        [single show];
        
    }
    
    
    if (textField == self.gradeFiled) {
        [self.textFiled resignFirstResponder];
        [self.gradeFiled  resignFirstResponder];
        
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级",@"初一",@"初二",@"初三",@"高一",@"高二",@"高三", nil];
        
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
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    
    self.CityFiled.text = text;
    
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
