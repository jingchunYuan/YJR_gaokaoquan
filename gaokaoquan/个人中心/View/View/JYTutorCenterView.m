//
//  JYTutorCenterView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/5.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorCenterView.h"
#import "UIButton+WebCache.h"
@interface JYTutorCenterView()
/// 签到
@property (weak, nonatomic) IBOutlet UIButton *CheckBtn;
/// 头像
@property (weak, nonatomic) IBOutlet UIButton *iconImage;
/// 名字
@property (weak, nonatomic) IBOutlet UILabel *name;
/// 点赞
@property (weak, nonatomic) IBOutlet UILabel *up_total;
/// 粉丝
@property (weak, nonatomic) IBOutlet UILabel *follow_total;
/// 我的信息
@property (weak, nonatomic) IBOutlet UILabel *inform;
/// 经验
@property (weak, nonatomic) IBOutlet UILabel *exp;

/// 金币
@property (weak, nonatomic) IBOutlet UILabel *gold;


@end
@implementation JYTutorCenterView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        
        
        
    }

    return  [[[NSBundle mainBundle]loadNibNamed:@"JYTutorCenterView" owner:nil options:nil]lastObject];;
}

// MARK:-签到功能
- (IBAction)CheckBtnClick:(UIButton *)sender {
#warning 为什么会渲染????
    
    NSLog(@"签到");
    
    
}
- (IBAction)MYExpClick:(UIButton *)sender {
    
    self.expBlock();
    
    
}
- (IBAction)MYGoldClick:(UIButton *)sender {
    
    
    self.GoldBlock();
    
}
- (IBAction)MyMessage:(UIButton *)sender {
    
    
    self.messageBlock();
    
    
}
- (void)myMessageClick:(MYMessageBlock)block
{

    self.messageBlock = block;


}

- (void)ExpClick:(MyExpBlock)block
{
    self.expBlock = block;


}

- (void)GoldClick:(MYGoldBlock)block
{

    self.GoldBlock = block;


}




- (void)setModel:(JYTutorinformModel *)model
{
    _model = model;
    
    
    self.name.text = model.true_name;
    
    self.up_total.text = model.up_total;
    
    self.follow_total.text = model.follow_total;
    
    self.gold.text = model.gold;
    
    self.exp.text = model.exp;
 
    [self.iconImage sd_setBackgroundImageWithURL:[NSURL URLWithString:model.avatar] forState:UIControlStateNormal placeholderImage:nil];

}



// MARK:-更换头像
- (IBAction)iconSetting:(UIButton *)sender {
    

    self.block();
    
    
}

- (void)iconBtnClick:(iconBlock)block
{
    self.block = block;


}
@end
