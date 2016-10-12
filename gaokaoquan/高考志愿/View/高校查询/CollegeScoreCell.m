//
//  CollegeScoreCell.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollegeScoreCell.h"

@interface CollegeScoreCell()
@property (weak, nonatomic) IBOutlet UILabel *yearLb;
@property (weak, nonatomic) IBOutlet UILabel *max_scoreLb;
@property (weak, nonatomic) IBOutlet UILabel *min_scoreLb;
@property (weak, nonatomic) IBOutlet UILabel *batchLb;
@property (weak, nonatomic) IBOutlet UILabel *control_lineLb;

@end
@implementation CollegeScoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(CollegeModel *)model{
    _yearLb.text = model.year;
    _max_scoreLb.text = model.max_score;
    _min_scoreLb.text = model.min_score;
    _batchLb.text = model.batch;
    _control_lineLb.text = model.control_line;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
