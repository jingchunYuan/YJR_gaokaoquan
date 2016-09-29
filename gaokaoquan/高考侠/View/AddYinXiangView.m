//
//  AddYinXiangView.m
//  gaokaoquan
//
//  Created by admin on 16/9/6.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "AddYinXiangView.h"

@interface AddYinXiangView ()

@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *addYinXiangBtn;

@end

@implementation AddYinXiangView

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
    
    //Ui
    _lineView.backgroundColor = [UIColor whiteColor];
    _lineView.alpha = 0.3;
    
    //添加印象按钮
    _addYinXiangBtn.backgroundColor = [UIColor orangeColor];
    _addYinXiangBtn.layer.masksToBounds = YES;
    _addYinXiangBtn.layer.cornerRadius = 2.0;
    
}

- (void)setAddCount:(NSNumber *)addCount {
    _addCount = addCount;
    //赋值
    _count.text = [NSString stringWithFormat:@"%@", addCount];
}

- (IBAction)addYinXiangClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(addYinXiangButtonClick:)]) {
        [self.delegate addYinXiangButtonClick:self];
    }
    
}


@end
