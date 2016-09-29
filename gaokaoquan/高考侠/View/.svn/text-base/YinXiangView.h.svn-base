//
//  YinXiangView.h
//  gaokaoquan
//
//  Created by admin on 16/9/3.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YinXiangView;
@protocol YinXiangViewDelegate <NSObject>
@required
- (void)yinXiangViewWithAddYinXiangMethod:(YinXiangView *)yinXiangView;
@end

@interface YinXiangView : UIView

@property (nonatomic, copy) NSArray *yinXiangArr;
@property (nonatomic, copy) NSNumber *count;
@property (nonatomic, weak) id<YinXiangViewDelegate>delegate;

@end
