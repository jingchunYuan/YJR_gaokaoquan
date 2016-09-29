//
//  JYLectureTableViewCell.h
//  gaokaoquan
//
//  Created by 家跃 on 16/9/9.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYLectureModel.h"

typedef void(^ReportBlock)();

@interface JYLectureTableViewCell : UITableViewCell

@property (nonatomic,strong) JYLectureModel *Model;

@property (nonatomic,copy) ReportBlock block;

- (void)seeReport:(ReportBlock)block;

@end
