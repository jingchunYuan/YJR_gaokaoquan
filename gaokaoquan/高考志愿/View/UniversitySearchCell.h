//
//  UniversitySearchCell.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/18.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GaoxiaochaxunModel.h"

@interface UniversitySearchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *collegeLb;
@property (weak, nonatomic) IBOutlet UIImageView *beijingImage;
@property (weak, nonatomic) IBOutlet UILabel *cityLb;
@property (weak, nonatomic) IBOutlet UILabel *typeLb;
@property (weak, nonatomic) IBOutlet UILabel *tagLb;
@property (weak, nonatomic) IBOutlet UILabel *textLb;
@property (nonatomic,strong) GaoxiaochaxunModel *model;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
