//
//  UniversitySearchCell.m
//  gaokaoquan
//
//  Created by Nevis on 16/9/18.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "UniversitySearchCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
@implementation UniversitySearchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(GaoxiaochaxunModel *)model{
    
    //    self.headImage.image = [UIImage imageNamed:@"高考侠2戴眼镜默认头像.jpg"];
        [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    NSLog(@"%@",model.logo);
    
    self.collegeLb.text = model.name;
    self.cityLb.text = [NSString stringWithFormat:@"所在地:%@ 类别:%@ ",model.city_name,model.type];

    for (int i=0; i<model.tag.count; i++) {
        
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(_cityLb.x+30*i, (_headImage.y+_headImage.height/2)-13, 26, 26)];
        imgView.image = [UIImage imageNamed:@"形状-26-副本-3@3x"];
        UILabel * tagLb = [[UILabel alloc]init];
        tagLb.font = [UIFont systemFontOfSize:10];
        if ([self isPureInt:model.tag[i]]) {
            tagLb.text = model.tag[i];
        }
        else{
            tagLb.text =
            [model.tag[i] substringToIndex:1];
        }
        tagLb.textColor = [UIColor whiteColor];
        CGSize size = [tagLb sizeThatFits:CGSizeMake(40, 40)];
        tagLb.width = size.width;
        tagLb.height = size.height;
        tagLb.center = imgView.center;
        [self addSubview:imgView];
        [self addSubview:tagLb];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_cityLb).offset(25*i);
            make.centerY.equalTo(_headImage);
            make.width.offset(24);
            make.height.offset(24);
        }];
        [tagLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(imgView);
        }];
        
    }
//    self.textLb.text = course;
    
}

//整形判断
- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
