

//
//  TiaozhuanView.m
//  gaokaoquan
//
//  Created by 高考圈 on 16/10/12.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "TiaozhuanView.h"

#define selfWith [UIScreen mainScreen].bounds.size.width
#define selfHeight [UIScreen mainScreen].bounds.size.height
#define XMRECT6(rect) CGRectMake(rect.origin.x*self6WidthRate, rect.origin.y*self6HeightRate, rect.size.width*self6WidthRate, rect.size.height*self6HeightRate)
#define self6WidthRate [UIScreen mainScreen].bounds.size.width/375.0
#define selfBacground [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]
#define self6HeightRate [UIScreen mainScreen].bounds.size.height/667.0
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]
#define selfGreen [UIColor colorWithRed:69/255.0 green:181/255.0 blue:55/255.0 alpha:0.8]

@implementation TiaozhuanView{
    // 标题
    UILabel * _title_label;
    // 内容
    UILabel * _body_label;
}

-(instancetype)init{
    
    self=[super init];
    
    if (self) {
        
        self.frame=CGRectMake(0,selfWith,selfHeight,selfHeight-64);
        
    }
    
    return self;
}


-(void)createUI:(NSString *)cancel otherTitle:(NSString*)other{
    
    NSLog(@"cancel.length=%d",cancel.length);
    
    NSLog(@"other.length=%d",other.length);
    
    UIView * white_view=[[UIView alloc]initWithFrame:XMRECT6(CGRectMake(50, 220,375-100, 190))];
    
    white_view.backgroundColor=[UIColor whiteColor];
    
    white_view.layer.cornerRadius=10;
    
    [self addSubview:white_view];
    
    //  title
    
    _title_label = [[UILabel alloc]initWithFrame:XMRECT6(CGRectMake(10,15,255, 30))];
    _title_label.textColor = UIColorFromRGB(0x383838);
    _title_label.textAlignment = NSTextAlignmentCenter;
    [white_view addSubview:_title_label];
    
    //  body
    
    _body_label=[[UILabel alloc]initWithFrame:XMRECT6(CGRectMake(10,55,255,60))];
    _body_label.font=[UIFont systemFontOfSize:14];
    _body_label.textAlignment=NSTextAlignmentCenter;
    _body_label.textColor=UIColorFromRGB(0x717171);
    //  换行最多两行
    _body_label.numberOfLines=2;
    [white_view addSubview:_body_label];
    
    //  分割线
    
    UILabel * fen_label=[[UILabel alloc]initWithFrame:CGRectMake(0, 150*self6HeightRate, 275*self6WidthRate, 1)];
    fen_label.backgroundColor=selfBacground;
    [white_view addSubview:fen_label];
    
    
    if (cancel.length&&other.length) {
        //  按钮存在(两个按钮存在)
        
        for (int i=0; i<2;i++) {
            
            UIButton * button = [[UIButton alloc]initWithFrame:XMRECT6(CGRectMake((275/2)*i,150, (275/2), 40))];
            
            [white_view addSubview:button];
            
            UILabel * gray_line = [[UILabel alloc]initWithFrame:XMRECT6(CGRectMake((275/2), 150, 1, 40))];
            
            gray_line.backgroundColor = selfBacground;
            
            [white_view addSubview:gray_line];
            
            if (i==0) {
                
                [button setTitle:@"什么是VIP套餐" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
                
                [button setTitleColor:selfGreen forState:UIControlStateNormal];
                
            }
            else if (i==1){
                
                [button setTitle:@"暂时不考虑" forState:UIControlStateNormal];
                
                [button addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
                
                [button setTitleColor:selfGreen forState:UIControlStateNormal];
                
            }
        }
    }else if (([cancel isEqual:nil]||[cancel isEqualToString:@""])&&([other isEqual:nil]||[other isEqualToString:@""])){
        
        // 取消按钮为空和确定按钮为空(无按钮情况)
        
        fen_label.hidden=YES;
        
        white_view.frame=XMRECT6(CGRectMake(50, 220,375-100, 150));
        
    }else if (cancel.length){
        
        //有一个确认按钮(一个按)没有网络请求相当于取消(虽是确认但是是取消）
        
        UIButton * button = [[UIButton alloc]initWithFrame:XMRECT6(CGRectMake(0,150,275, 40))];
        
        [white_view addSubview:button];
        
        UILabel * gray_line = [[UILabel alloc]initWithFrame:XMRECT6(CGRectMake((275/2), 150, 1, 40))];
        
        gray_line.backgroundColor = selfBacground;
        
        [white_view addSubview:gray_line];
        
        [button setTitle:@"暂不考虑" forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
        
        [button setTitleColor:selfGreen forState:UIControlStateNormal];
        
    }
    
}

//第一个按钮
-(void)cancel{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        [self removeFromSuperview];
        
    } completion:^(BOOL finished) {
        
    }];
    
}
//第二个按钮
-(void)sure{
    
    if (_delegate &&[_delegate respondsToSelector:@selector(TiaozhuanClickButtonAtIndex:)]) {
        
        [_delegate TiaozhuanClickButtonAtIndex:1];
    }
}
//警告框显示
-(void)showAlert{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        UIWindow * window=[UIApplication sharedApplication].keyWindow;
        
        [window addSubview:self];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)XMPopAletViewTitle:(NSString *)title message:(NSString *)message deleagte:(id)delegate cancelButton:(NSString *)cancel otherbuttonTitle:(NSString *)other{
    //    代理方法
    _delegate=delegate;
    //    创建UI
    [self createUI:cancel otherTitle:other];
    //    传值
    _body_label.text=message;
    
    _title_label.text=title;
}




@end
