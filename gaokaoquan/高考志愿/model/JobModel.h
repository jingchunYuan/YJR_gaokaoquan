//
//  JobModel.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/25.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JSONModel.h"

@interface JobModel : NSObject
@property (nonatomic,copy)NSString * Id;
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSMutableArray * jobCategory;
@property (nonatomic,copy)NSString *banner;
@end
