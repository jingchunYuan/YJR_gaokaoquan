//
//  StudentCenterView.h
//  gaokaoquan
//  Created by 家跃 on 16/9/2.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyMessage)();
typedef void(^MyExperience)();
typedef void(^MyGold)();
typedef void(^MyCoupon)();
@interface StudentCenterView : UIView
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *ID;
@property (weak, nonatomic) IBOutlet UILabel *balance;

@property(nonatomic,copy)MyMessage Message;
@property(nonatomic,copy)MyExperience Experience;
@property(nonatomic,copy)MyGold Gold;
@property(nonatomic,copy)MyCoupon Coupon;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
-(void)MyMessageCilick:(MyMessage)message;
-(void)MyExperienceClick:(MyExperience)Experience;
-(void)MyGoldClick:(MyGold)Gold;
-(void)MyCouponClick:(MyCoupon)Coupon;

@end
