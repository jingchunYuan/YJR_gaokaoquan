//
//  CollgeCell.h
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GaoxiaoCollegeModel.h"


@interface CollgeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *HeadImage;

@property (weak, nonatomic) IBOutlet UILabel *CollegLb;

@property (weak, nonatomic) IBOutlet UIImageView *BeijingImg;

@property (weak, nonatomic) IBOutlet UILabel *YearLb;

@property (weak, nonatomic) IBOutlet UILabel *CountLb;

@property (weak, nonatomic) IBOutlet UILabel *BoshiLb;
@property (weak, nonatomic) IBOutlet UILabel *ShuoshiLb;

@property(nonatomic,strong) GaoxiaoCollegeModel *model;




- (IBAction)GuanfangBtn:(id)sender;

- (IBAction)zhaoshengbtn:(id)sender;



















@end
