//
//  JYTutorInformFootView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/19.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYTutorInformFootView.h"
@interface JYTutorInformFootView()
@property (weak, nonatomic) IBOutlet UIView *addView;


@end
@implementation JYTutorInformFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame]) {
        
        
        
        
    }


    return [[[NSBundle mainBundle]loadNibNamed:@"JYTutorInformFootView" owner:nil options:nil]lastObject];
}

- (IBAction)addclick:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        
        CGRect frame = self.frame;
    
        frame.size.height = 260;
        
        self.frame = frame;
        
        self.addView.hidden = YES;
        
    }else{
    
        CGRect frame = self.frame;
        
        frame.size.height = 690;
        
        self.frame = frame;
        
        self.addView.hidden = NO;

    
    }
    
    
}


@end
