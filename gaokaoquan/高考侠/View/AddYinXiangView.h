//
//  AddYinXiangView.h
//  gaokaoquan
//
//  Created by admin on 16/9/6.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>

// 协议
@class AddYinXiangView;
@protocol AddYinXiangViewDelegate <NSObject>

@required
- (void)addYinXiangButtonClick:(AddYinXiangView *)addYinXiangView;

@end


@interface AddYinXiangView : UIView

@property (nonatomic, copy) NSNumber *addCount;
@property (weak, nonatomic) id<AddYinXiangViewDelegate>delegate;

@end
