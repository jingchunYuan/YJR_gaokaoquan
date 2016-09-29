//
//  PersonTableViewCell.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/8/29.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PersonModel;
@interface PersonTableViewCell : UITableViewCell

//头像
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
//名字
@property (weak, nonatomic) IBOutlet UILabel *name;
//时间日期
@property (weak, nonatomic) IBOutlet UILabel *time;
//名言
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
//关注
@property (weak, nonatomic) IBOutlet UILabel *commentLb;
//回复
@property (weak, nonatomic) IBOutlet UILabel *followLb;
//浏览
@property (weak, nonatomic) IBOutlet UILabel *uidLb;

@property (nonatomic,strong) PersonModel *model;


@end
