//
//  ImpressionModel.h
//  gaokaoquan
//
//  Created by Nevis on 16/9/4.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "JSONModel.h"

@interface ImpressionModel : JSONModel
@property (nonatomic,copy)NSString * true_name;
@property (nonatomic,copy)NSString * avatar;
@property (nonatomic,copy)NSString * info;
@property (nonatomic,strong)NSString * ctime;
@end
