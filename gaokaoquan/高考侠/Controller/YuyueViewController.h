//
//  YuyueViewController.h
//  gaokaoquan
//
//  Created by admin on 16/9/7.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "BaseViewController.h"

@interface YuyueViewController : BaseViewController

@property (nonatomic, copy) NSString *true_name;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UITextField *ziXunZhuTiTextFeild;
@property (weak, nonatomic) IBOutlet UITextView *wenTiMiaoShuTextView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;
@property (weak, nonatomic) IBOutlet UIButton *yuYueSubmitBtn;

@end
