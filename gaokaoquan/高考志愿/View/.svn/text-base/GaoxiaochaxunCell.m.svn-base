
//
//  GaoxiaochaxunCell.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/13.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "GaoxiaochaxunCell.h"
#import "gaoxiaochaxunModel.h"
#import "UIImageView+WebCache.h"

@implementation GaoxiaochaxunCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.zj_width/2;
    
 
}

-(void)setModel:(GaoxiaochaxunModel *)model{
    
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.logo]];
   
    self.collegeLb.text = model.name;
    self.cityLb.text = model.city_name;
    self.typeLb.text = model.type;
    NSMutableString * course = [[NSMutableString alloc]init];
    for (int i=0; i<model.tag.count; i++) {
        [course appendString:[NSString stringWithFormat:@"%@ ",model.tag[i]]];
    }
    self.textLb.text = course;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)LuquBtn:(id)sender {
    
    
}

- (IBAction)CareBtn:(id)sender {
    
    
}
@end
