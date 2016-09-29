
//
//  CollgeCell.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/9/21.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "CollgeCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"


@implementation CollgeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(GaoxiaoCollegeModel *)model
{
    [self.HeadImage sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    NSLog(@"%@",model.logo);
    
    self.CollegLb.text = model.name;
    self.YearLb.text = model.create_time;
    self.CountLb.text = model.key_subject_number;
    self.BoshiLb.text = model.doctor_number;
    self.ShuoshiLb.text = model.master_number;
    for (int i=0; i<model.tag.count; i++) {
        
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(_YearLb.x+30*i, (_HeadImage.y+_HeadImage.height/2)-13, 26, 26)];
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
            make.leading.equalTo(_YearLb).offset(25*i);
            make.centerY.equalTo(_HeadImage);
            make.width.offset(24);
            make.height.offset(24);
        }];
        [tagLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(imgView);
        }];
    }
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

- (IBAction)GuanfangBtn:(id)sender {
}

- (IBAction)zhaoshengbtn:(id)sender {
}
@end
