//
//  JYView.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/23.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYView : UIView
typedef void(^Checkblock)(UITextField *filed,UILabel *sectionlabel,UILabel *leftlabel,UILabel *rightlabel,UIView *headview);

@property (nonatomic,copy) Checkblock block;


- (void)checkBlock:(Checkblock)block;

+(instancetype)loadNibName;
@end
