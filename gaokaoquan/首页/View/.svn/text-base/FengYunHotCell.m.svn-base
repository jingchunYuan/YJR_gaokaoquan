//
//  FengYunHotCell.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "FengYunHotCell.h"
#import "UIImageView+WebCache.h"

@interface FengYunHotCell()
@property (weak, nonatomic) IBOutlet UIImageView *headIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *eduLb;
@property (weak, nonatomic) IBOutlet UILabel *countLb;

@end
@implementation FengYunHotCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(fengyunModel *)model{
    NSLog(@"%@",model);
    NSLog(@"%@",[model class]);
    NSLog(@"%@",model.avatar);
//        [_headIcon sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
        _nameLb.text = model.true_name;
        _countLb.text = model.praise_total;
        _eduLb.text = [NSString stringWithFormat:@"%@|%@|%@",model.education,model.college_name,model.major_name];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
