//
//  JobListModel.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JobModel.h"

@interface JobListModel : NSObject

@property (nonatomic,copy) NSString *Id;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) JobModel *job;
@property (nonatomic,strong) NSMutableArray *jobCategory;

@end
