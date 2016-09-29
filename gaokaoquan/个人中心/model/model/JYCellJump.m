//
//  JYCellJump.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYCellJump.h"

@implementation JYCellJump

+(instancetype)CellJumpWithTitle:(NSString *)title controllerClass:(Class)controllerClass
{
    
    JYCellJump *Celljump = [[self alloc]init];
    
    Celljump.title = title;
    
    Celljump.controllerClass = controllerClass;
    
    return Celljump;
}
@end
