//
//  JieshaoView.m
//  gaokaoquan
//
//  Created by admin on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JieshaoView.h"

@interface JieshaoView ()

@property (nonatomic, copy) NSString *intro;

@end


@implementation JieshaoView

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
    view.backgroundColor = [UIColor clearColor];
    [self addSubview:view];
}

- (void)setJieshaoArr:(NSArray *)jieshaoArr {
    
    if ([jieshaoArr count]) {
        
        float allHeight;
        NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
        for (int i=0; i<[jieshaoArr count]+1; i++) {
            
            if (self.intro != nil) {
                if (i==0) {
                    UILabel *label = [[UILabel alloc] init];
                    label.backgroundColor = [UIColor clearColor];
                    label.font = [UIFont systemFontOfSize:12];
                    label.numberOfLines = 0;
                    label.textColor = [UIColor whiteColor];
                    //根据文字多少适配高度
                    NSString *s = [NSString stringWithFormat:@"%@",self.intro];
                    CGRect rect = [s boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                               attributes:attrs
                                                  context:nil];
                    label.frame = CGRectMake(0,i*(allHeight), SCREEN_WIDTH-20, rect.size.height);
                    label.text =s;
                    [self addSubview:label];
                    
                    allHeight += rect.size.height+10;
                }else {
                    UILabel *label = [[UILabel alloc] init];
                    label.backgroundColor = [UIColor clearColor];
                    label.font = [UIFont systemFontOfSize:12];
                    label.numberOfLines = 0;
                    label.textColor = [UIColor whiteColor];
                    //根据文字多少适配高度
                    NSString *s = [NSString stringWithFormat:@"%@至%@ %@;%@",jieshaoArr[i-1][@"start_date"],jieshaoArr[i-1][@"end_date"],jieshaoArr[i-1][@"school"],jieshaoArr[i-1][@"info"]];
                    CGRect rect = [s boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                               attributes:attrs
                                                  context:nil];
                    label.frame = CGRectMake(0,i*(allHeight), SCREEN_WIDTH-20, rect.size.height);
                    label.text =s;
                    [self addSubview:label];
                    
                    allHeight += rect.size.height+10;
                }
            }else {
                if (i!=0) {
                    UILabel *label = [[UILabel alloc] init];
                    label.backgroundColor = [UIColor clearColor];
                    label.font = [UIFont systemFontOfSize:12];
                    label.numberOfLines = 0;
                    label.textColor = [UIColor whiteColor];
                    //根据文字多少适配高度
                    NSString *s = [NSString stringWithFormat:@"%@至%@ %@;%@",jieshaoArr[i-1][@"start_date"],jieshaoArr[i-1][@"end_date"],jieshaoArr[i-1][@"school"],jieshaoArr[i-1][@"info"]];
                    CGRect rect = [s boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT)
                                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                               attributes:attrs
                                                  context:nil];
                    label.frame = CGRectMake(0,i*(allHeight), SCREEN_WIDTH-20, rect.size.height);
                    label.text =s;
                    [self addSubview:label];
                    
                    allHeight += rect.size.height+10;
                }
            }
            
        }
        _viewHeight = allHeight;
        
    }
    
}

-(void)setJieshaoDict:(NSDictionary *)jieshaoDict {
    _jieshaoDict = jieshaoDict;
    self.intro = jieshaoDict[@"intro"];
}

@end
