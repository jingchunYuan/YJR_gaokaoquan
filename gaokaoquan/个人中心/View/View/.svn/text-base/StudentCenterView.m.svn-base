//
//  StudentCenterView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/2.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "StudentCenterView.h"
@interface StudentCenterView()
@property (weak, nonatomic) IBOutlet UIButton *MyMessageBtn;

@property (weak, nonatomic) IBOutlet UIButton *MyExperienceBtn;

@property (weak, nonatomic) IBOutlet UIButton *MyGoldBtn;

@property (weak, nonatomic) IBOutlet UIButton *MyCouponsBtn;
@end
@implementation StudentCenterView

- (IBAction)MessageBtnClick:(UIButton *)sender {
    
#warning view无法完成push工作,只要控制器可以
    self.Message();
    
   
}

// MARK:-学生签到操作
- (IBAction)CheckClick:(UIButton *)sender {

    
    
    
}
- (IBAction)ExperienceBtnClick:(UIButton *)sender {
    
    self.Experience();
    

    
}
- (IBAction)GoldBtnClick:(UIButton *)sender {
    
    self.Gold();
  
    
}
- (IBAction)CouponBtnClick:(id)sender {
    
    self.Coupon();
    
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        
    }

return [[NSBundle mainBundle]loadNibNamed:@"StudentCenterView" owner:nil options:nil].lastObject;
}

-(void)MyMessageCilick:(MyMessage)message
{
    self.Message = message;
}
-(void)MyExperienceClick:(MyExperience)Experience
{
    self.Experience = Experience;
}
-(void)MyGoldClick:(MyGold)Gold
{
    self.Gold = Gold;
}
-(void)MyCouponClick:(MyCoupon)Coupon
{
    self.Coupon = Coupon;
}


@end
