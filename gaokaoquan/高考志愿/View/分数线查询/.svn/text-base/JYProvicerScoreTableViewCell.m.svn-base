//
//  JYProvicerScoreTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYProvicerScoreTableViewCell.h"
#import "JYProvicerModel.h"
@interface JYProvicerScoreTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *Year;
@property (weak, nonatomic) IBOutlet UILabel *City;
@property (weak, nonatomic) IBOutlet UILabel *WL;
@property (weak, nonatomic) IBOutlet UILabel *PICi;
@property (weak, nonatomic) IBOutlet UILabel *score;
@end
@implementation JYProvicerScoreTableViewCell

- (void)setModel:(JYProvicerModel *)model
{
    _model = model;
    self.Year.text = model.year;
    self.City.text = model.city_id;
    self.PICi.text = model.batch;
    self.WL.text = model.type;
    self.score.text = model.score;

}
@end
