//
//  TecherDetalView.h
//  gaokaoquan
//
//  Created by admin on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TecherDetalView;
@protocol TecherDetalViewDelegate <NSObject>

@required
- (void)yuYueZiXunBtnWithTeacher:(TecherDetalView *)detalView;
- (void)mianFeiTiWenBtnWithTeacher:(TecherDetalView *)detalView;

@end


@interface TecherDetalView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (nonatomic, copy) NSDictionary *topDict;
@property (weak, nonatomic) id<TecherDetalViewDelegate>delegate;

@end
