//
//  JYMyAnswerView.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/8.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^myTwblock)();
typedef void(^myHDblock)();
typedef void(^myblock)();

@interface JYMyAnswerView : UIView
+ (instancetype)loadNib;

@property (weak, nonatomic) IBOutlet UIButton *TWbtn;
@property (weak, nonatomic) IBOutlet UIButton *HDbtn;
@property (weak, nonatomic) IBOutlet UIButton *TDWbtn;

@property (nonatomic,copy) myTwblock TW;
@property (nonatomic,copy) myHDblock HD;
@property (nonatomic,copy) myblock my;

-(void)MyTWCilick:(myTwblock)TW;
-(void)MyHDClick:(myHDblock)HD;
-(void)MyClick:(myblock)my;



@end
