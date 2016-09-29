//
//  JYGaoXiaoView.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol inqueClickDelegate<NSObject>

- (void)Cityfiled:(UITextField *)Cityfiled :(UITextField *)PiCiFiled :(UITextField *)SchoolFiled :(UILabel *)sectionLabel :(BOOL)isWL;

@end

@interface JYGaoXiaoView : UIView

@property (weak, nonatomic) IBOutlet UIView *headview;

@property (nonatomic,weak) id<inqueClickDelegate> delegate;

+ (instancetype)loadNibView;

@end
