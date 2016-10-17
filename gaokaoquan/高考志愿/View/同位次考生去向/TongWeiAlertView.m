//
//  TongWeiAlertView.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/15.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TongWeiAlertView.h"

@interface TongWeiAlertView()
@property (nonatomic,strong)UIButton * okBtn;
@property (nonatomic,strong)UIButton * cancelBtn;
@property (nonatomic,strong)UILabel * titleLb;
@property (nonatomic,strong)UILabel * msgLb;
@property (nonatomic,strong)UIButton * exitBtn;
@end
@implementation TongWeiAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self layoutUI:frame];
    }
    return self;
}

-(void)layoutUI:(CGRect)frame {
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 1;
    _titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, frame.size.width, 20)];
    _titleLb.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.f];
    _titleLb.textAlignment = NSTextAlignmentCenter;
    _titleLb.text = _title;
    
    _exitBtn = [[UIButton alloc]initWithFrame:CGRectMake(frame.size.width-20-15, 20, 20, 20)];
    [_exitBtn setImage:[UIImage imageNamed:@"首页-职业信息库-下拉箭头@3x"] forState:UIControlStateNormal];
    [_exitBtn addTarget:self action:@selector(operateClicked:) forControlEvents:UIControlEventTouchUpInside];
    _exitBtn.tag = 1;
    
    _msgLb = [[UILabel alloc]initWithFrame:CGRectMake(0, _titleLb.y + _titleLb.height+30, frame.size.width, 20)];
    _msgLb.textAlignment = NSTextAlignmentCenter;
    _msgLb.text = _message;
    _msgLb.font = [UIFont fontWithName:@"Helvetica" size:17.f];
    
    _okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _okBtn.layer.masksToBounds = YES;
    _okBtn.layer.cornerRadius = 4;
    _okBtn.frame = CGRectMake(40, 90, frame.size.width-80, 30);
    _okBtn.backgroundColor = [UIColor yellowColor];
    [_okBtn setTitle:_nextTitle forState:UIControlStateNormal];
    [_okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_okBtn addTarget:self action:@selector(operateClicked:) forControlEvents:UIControlEventTouchUpInside];
    _okBtn.tag = 2;
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.layer.masksToBounds = YES;
    _cancelBtn.layer.cornerRadius = 4;
    _cancelBtn.frame = CGRectMake(40, 140, frame.size.width-80, 30);
    _cancelBtn.backgroundColor = [UIColor cyanColor];
    [_cancelBtn setTitle:_cancelTitle forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(operateClicked:) forControlEvents:UIControlEventTouchUpInside];
    _cancelBtn.tag = 3;
    
    [self addSubview:_titleLb];
    [self addSubview:_msgLb];
    [self addSubview:_exitBtn];
    [self addSubview:_okBtn];
    [self addSubview:_cancelBtn];
    
}
-(void)operateClicked:(UIButton *)sender{
    self.hidden = YES;
    switch (sender.tag) {
            //退出
        case 1:
            
            break;
            //购买
        case 2:
           break;
            //暂不考虑
        case 3:
            [self.delegate pushController:0];
            break;
            
        default:
            break;
    }
}
-(void)setTitle:(NSString *)title{
    _title = title;
    _titleLb.text = _title;
}
-(void)setMessage:(NSString *)message{
    _message = message;
    _msgLb.text = _message;
}
-(void)setNextTitle:(NSString *)nextTitle{
    _nextTitle = nextTitle;
    [_okBtn setTitle:_nextTitle forState:UIControlStateNormal];
}
-(void)setCancelTitle:(NSString *)cancelTitle{
    _cancelTitle = cancelTitle;
    [_cancelBtn setTitle:_cancelTitle forState:UIControlStateNormal];
}
@end
