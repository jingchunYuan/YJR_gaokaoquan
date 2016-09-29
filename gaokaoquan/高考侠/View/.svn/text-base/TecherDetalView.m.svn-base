//
//  TecherDetalView.m
//  gaokaoquan
//
//  Created by admin on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TecherDetalView.h"
#import "UIImageView+WebCache.h"

@interface TecherDetalView ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *hongxin;
@property (weak, nonatomic) IBOutlet UILabel *guanZhu;
@property (weak, nonatomic) IBOutlet UIImageView *sexImageView;
@property (weak, nonatomic) IBOutlet UILabel *xingZuo;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *college_name;
@property (weak, nonatomic) IBOutlet UILabel *intro;
@property (weak, nonatomic) IBOutlet UILabel *good_course;
@property (weak, nonatomic) IBOutlet UILabel *yuyueLabel;
@property (weak, nonatomic) IBOutlet UILabel *mianfeiLabel;
@property (weak, nonatomic) IBOutlet UIButton *guanzhuBtn;
@property (weak, nonatomic) IBOutlet UIView *yuyuezixun;
@property (weak, nonatomic) IBOutlet UIView *mianfeitiwen;
@property (weak, nonatomic) IBOutlet UIImageView *yuyueImage;
@property (weak, nonatomic) IBOutlet UIImageView *mianfeiImage;

@end

@implementation TecherDetalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadNibName];
    }
    return self;
}

- (void)loadNibName {
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
    view.frame = self.bounds;
    self.bgView.frame = view.frame;
    [self addSubview:view];
}

- (void)layoutSubviews {
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.zj_width/2;
    _headImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _headImage.layer.borderWidth = 0.5;
    _headImage.zj_centerY = _bgView.zj_centerY;
    _headImage.zj_y = 10;
    
    _guanzhuBtn.layer.masksToBounds = YES;
    _guanzhuBtn.layer.cornerRadius = 5;
    _guanzhuBtn.tintColor = [UIColor whiteColor];
    //名字
    _yuyuezixun.layer.borderWidth = 0.5;
    _yuyuezixun.layer.borderColor = [UIColor whiteColor].CGColor;
    _yuyuezixun.layer.masksToBounds = YES;
    _yuyuezixun.layer.cornerRadius = 8;
    _mianfeitiwen.layer.borderWidth = 0.5;
    _mianfeitiwen.layer.borderColor = [UIColor whiteColor].CGColor;
    _mianfeitiwen.layer.masksToBounds = YES;
    _mianfeitiwen.layer.cornerRadius = 8;
    _yuyueLabel.textColor = [UIColor lightGrayColor];
    _mianfeiLabel.textColor = [UIColor lightGrayColor];
    
    //适配
    _yuyueImage.zj_centerY = _yuyuezixun.zj_centerY-8;
    _yuyueImage.zj_centerX = _yuyuezixun.zj_centerX;
    _mianfeiImage.zj_centerY = _mianfeitiwen.zj_centerY-8;
    _mianfeiImage.zj_centerX = _mianfeitiwen.zj_centerX;
}

- (void)setTopDict:(NSDictionary *)topDict {
    
    // 设置参数，刷新UI
    [_headImage sd_setImageWithURL:[NSURL URLWithString:topDict[@"avatar"]] placeholderImage:[UIImage imageNamed:@"jr2"]];
    _name.text = topDict[@"true_name"];
    _hongxin.image = [UIImage imageNamed:@"高考侠-点赞"];
    _guanZhu.text = [NSString stringWithFormat:@"%@", topDict[@"praise_total"]];
    
    //性别
    NSString *sex = [NSString stringWithFormat:@"%@", topDict[@"sex"]];
    if ([sex isEqualToString:@"1"]) {
        _sexImageView.image = [UIImage imageNamed:@"nan.png"];
    }else {
        _sexImageView.image = [UIImage imageNamed:@"nv.png"];
    }
    
    _xingZuo.text = topDict[@"astro"];
    _address.text = topDict[@"home_province"];
    NSString *collegeMy = [NSString stringWithFormat:@"%@|%@|%@",topDict[@"education"], topDict[@"college_name"], topDict[@"major_name"]];
    _college_name.text = collegeMy;
    _intro.text = topDict[@"signature"];
    
    //擅长
    NSArray *good = topDict[@"good_course"];
    NSMutableString *a = [NSMutableString stringWithFormat:@"擅长："];
    if ([good count]) {
        for (NSString *s in good) {
            [a appendFormat:@"%@、",s];
        }
    }
    _good_course.text = a;
    
}

- (IBAction)yuyueAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(yuYueZiXunBtnWithTeacher:)]) {
        [self.delegate yuYueZiXunBtnWithTeacher:self];
    }
}

- (IBAction)mianfeiAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(mianFeiTiWenBtnWithTeacher:)]) {
        [self.delegate mianFeiTiWenBtnWithTeacher:self];
    }
}


@end
