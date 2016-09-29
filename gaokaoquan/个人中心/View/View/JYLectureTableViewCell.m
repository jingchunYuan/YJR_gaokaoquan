//
//  JYLectureTableViewCell.m
//  gaokaoquan
//
//  Created by 家跃 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JYLectureTableViewCell.h"
@interface JYLectureTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;

@end
@implementation JYLectureTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)SeeReport:(UIButton *)sender {
    
    self.block();
    
}

- (void)setModel:(JYLectureModel *)Model
{
    _Model = Model;
    
    self.titlelabel.text = Model.title;
    self.timelabel.text = Model.ctime;

}

- (void)seeReport:(ReportBlock)block
{
    self.block = block;

}

@end
