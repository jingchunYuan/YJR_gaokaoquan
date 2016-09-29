//
//  JYScoreMajorView.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/24.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol checkClickDelegate<NSObject>

- (void)WLFiled:(UITextField *)WLFiled :(UITextField *)CityFiled :(UITextField *)PICIFiled :(UITextField *)yearTextFiled :(UITextField *)schoolFiled;

@end

@interface JYScoreMajorView : UIView
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIView *headview;

@property (nonatomic,weak) id<checkClickDelegate> delegate;

+ (instancetype)loadNibView;

@end
