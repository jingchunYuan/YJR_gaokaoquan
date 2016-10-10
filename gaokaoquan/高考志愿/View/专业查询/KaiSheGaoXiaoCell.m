//
//  KaiSheGaoXiaoCell.m
//  gaokaoquan
//
//  Created by admin on 16/9/30.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "KaiSheGaoXiaoCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

@implementation KaiSheGaoXiaoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MajorDetalKaisheGaoXiaoModel *)model {
    
    _model = model;
    
    //赋值
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    
    self.schoolName.text = model.name;
    self.schoolAddress.text = [NSString stringWithFormat:@"所在地:%@ 类别:%@ ",model.province,model.type];
    
    for (int i=0; i<model.tagArray.count; i++) {
        
        if ([model.tagArray[i] length]) {
            
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(_schoolAddress.x+30*i, (_headImageView.y+_headImageView.height/2)-13, 26, 26)];
            imgView.image = [UIImage imageNamed:@"形状-26-副本-3@3x"];
            UILabel * tagLb = [[UILabel alloc]init];
            tagLb.font = [UIFont systemFontOfSize:10];
            if ([self isPureInt:model.tagArray[i]]) {
                tagLb.text = model.tagArray[i];
            }
            else{
                tagLb.text = [model.tagArray[i] substringToIndex:1];
            }
            tagLb.textColor = [UIColor whiteColor];
            CGSize size = [tagLb sizeThatFits:CGSizeMake(40, 40)];
            tagLb.width = size.width;
            tagLb.height = size.height;
            tagLb.center = imgView.center;
            [self addSubview:imgView];
            [self addSubview:tagLb];
            [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(_schoolAddress).offset(25*i);
                make.centerY.equalTo(_headImageView);
                make.width.offset(24);
                make.height.offset(24);
            }];
            [tagLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(imgView);
            }];
            
        }
        
    }
    
}

//整形判断
- (BOOL)isPureInt:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

@end
