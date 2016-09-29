//
//  JYView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/23.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYView.h"
@interface JYView()

@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (weak, nonatomic) IBOutlet UIView *headview;

@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (weak, nonatomic) IBOutlet UITextField *textfiled;

@property (weak, nonatomic) IBOutlet UIButton *checkButton;

@property (weak, nonatomic) IBOutlet UILabel *sectionlabel;

@property (weak, nonatomic) IBOutlet UILabel *rightlabel;

@property (weak, nonatomic) IBOutlet UILabel *leftlabel;

@end
@implementation JYView
- (IBAction)leftButtonClick:(UIButton *)sender
{
    self.rightButton.backgroundColor = [UIColor whiteColor];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    sender.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.textfiled.placeholder = @"请输入专业名称";
    [self.checkButton setTitle:@"查看对口职业" forState:UIControlStateNormal];
    
    
}
- (IBAction)rightButtonClick:(UIButton *)sender
{
    
    self.leftButton.backgroundColor = [UIColor whiteColor];
    [self.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor colorWithRed:85/255.0 green:193/255.0 blue:231/255.0 alpha:1];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.textfiled.placeholder = @"请输入职业名称";
    [self.checkButton setTitle:@"查看对口专业" forState:UIControlStateNormal];
    
}

- (void)checkBlock:(Checkblock)block
{
    self.block = block;
}

- (IBAction)checkButtonClick:(UIButton *)sender
{
    
    self.block(self.textfiled,self.sectionlabel,self.leftlabel,self.rightlabel,self.headview);
    
}

+ (instancetype)loadNibName
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JYView" owner:nil options:nil]lastObject];
}

@end
