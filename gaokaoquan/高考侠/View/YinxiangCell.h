//
//  YinxiangCell.h
//  gaokaoquan
//
//  Created by admin on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YinxiangCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *true_name;
@property (weak, nonatomic) IBOutlet UILabel *ctime;
@property (weak, nonatomic) IBOutlet UILabel *info;

@property (nonatomic ,copy) NSDictionary *dictModel;

@end
