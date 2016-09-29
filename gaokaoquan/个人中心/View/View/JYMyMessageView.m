//
//  JYMyMessageView.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYMyMessageView.h"

@implementation JYMyMessageView

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        
       
        
        
    }

    return self;
}


+(instancetype)NibWithView
{



    return [[[NSBundle mainBundle]loadNibNamed:@"JYMyMessageView" owner:nil options:nil]lastObject];
}
@end
