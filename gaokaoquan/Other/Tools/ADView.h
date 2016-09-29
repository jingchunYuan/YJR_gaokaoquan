//
//  ADView.h
//  ChinaMall
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 Nevis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADView : UIView

-(instancetype)initWithFrame:(CGRect)frame withImageArray:(NSArray *)imageArray goBack:(void(^)())handler;

@end
