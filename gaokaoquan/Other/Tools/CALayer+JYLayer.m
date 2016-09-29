//
//  CALayer+JYLayer.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/8.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CALayer+JYLayer.h"

@implementation CALayer (JYLayer)

- (void)setBorderUIColor:(UIColor *)borderUIColor
{
    
    self.borderColor = borderUIColor.CGColor;


}

- (UIColor *)borderUIColor
{

   

    return [UIColor colorWithCGColor:self.borderColor];
}
@end
