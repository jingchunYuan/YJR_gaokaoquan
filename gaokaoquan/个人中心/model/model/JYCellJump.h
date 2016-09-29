//
//  JYCellJump.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYCellJump : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)Class controllerClass;

+(instancetype)CellJumpWithTitle:(NSString *)title controllerClass:(Class)controllerClass;
@end
