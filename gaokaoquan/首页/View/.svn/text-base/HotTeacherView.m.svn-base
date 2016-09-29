//
//  HotTeacherView.m
//  gaokaoquan
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "HotTeacherView.h"

@interface HotTeacherView ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *daMuzhiImageView;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView_1;
@property (weak, nonatomic) IBOutlet UILabel *name_1Label;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView_2;
@property (weak, nonatomic) IBOutlet UILabel *name_2Label;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView_3;
@property (weak, nonatomic) IBOutlet UILabel *name_3Label;
@property (weak, nonatomic) IBOutlet UILabel *hotwindLb;

@end

@implementation HotTeacherView

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
    [self addSubview:view];
    _hotwindLb.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taped:)];
    [_hotwindLb addGestureRecognizer:tap];
}

#pragma mark - 风云榜label 点击事件
-(void)taped:(UITapGestureRecognizer *)gesture{
    FengyunViewController * fyVC = [[FengyunViewController alloc]init];
    [self.delegate pushController:fyVC];

}
//更多按钮的点击事件
- (IBAction)myMoreBtnClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(moreBtnMethod:)]) {
        
        [self.delegate moreBtnMethod:self];

    }
        
}



#pragma mark - Getter and Setter

- (void)setDaMuzhiImageView:(UIImageView *)daMuzhiImageView {
    _daMuzhiImageView = daMuzhiImageView;
    _daMuzhiImageView.backgroundColor = [UIColor whiteColor];
}

- (void)setHeadImageView_1:(UIImageView *)headImageView_1 {
    _headImageView_1 = headImageView_1;
    _headImageView_1.layer.cornerRadius = headImageView_1.zj_width/2;
    _headImageView_1.layer.masksToBounds = YES;
    _headImageView_1.backgroundColor = [UIColor whiteColor];
}

- (void)setHeadImageView_2:(UIImageView *)headImageView_2 {
    _headImageView_2 = headImageView_2;
    _headImageView_2.layer.cornerRadius = _headImageView_2.zj_width/2;
    _headImageView_2.layer.masksToBounds = YES;
    _headImageView_2.backgroundColor = [UIColor whiteColor];
}

- (void)setHeadImageView_3:(UIImageView *)headImageView_3 {
    _headImageView_3 = headImageView_3;
    _headImageView_3.layer.cornerRadius = _headImageView_3.zj_width/2;
    _headImageView_3.layer.masksToBounds = YES;
    _headImageView_3.backgroundColor = [UIColor whiteColor];
}

@end
