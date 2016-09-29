//
//  JYMyIndentView.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYMYIndentModel.h"

typedef void(^MyindentDteail)();

@interface JYMyIndentView : UITableViewCell

@property (nonatomic,strong) JYMYIndentModel *Model;


/// 订单详情
@property (nonatomic,copy) MyindentDteail block;

- (void)indentDteail:(MyindentDteail) block;

@end
