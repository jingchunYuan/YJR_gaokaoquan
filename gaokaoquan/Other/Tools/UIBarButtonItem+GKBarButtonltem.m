//
//  UIBarButtonItem+GKBarButtonltem.m
//  text
//
//  Created by 家跃 on 16/8/31.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "UIBarButtonItem+GKBarButtonltem.h"

@implementation UIBarButtonItem (GKBarButtonltem)

+(UIBarButtonItem *)initWithImageName:(NSString *)ImageName highlightedImage:(NSString *)highlightedImage title:(NSString *)title target:(id)target action:(SEL)action
{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (ImageName) {
        
        [btn setImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
        
        if (highlightedImage) {
            
            [btn setImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
        }
        
        
    }
    
    if (title) {
        
        [btn setTitle:title forState:UIControlStateNormal];
        
        // 字体  颜色??
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        
        
        
    }
    
    [btn sizeToFit];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    

    return [[UIBarButtonItem alloc]initWithCustomView:btn];

}
@end
