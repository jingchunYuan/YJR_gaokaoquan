//
//  BaseRequest.h
//  CherryAnimation
//
//  Created by Nevis on 16/6/13.
//  Copyright © 2016年 Nevis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface BaseRequest : NSObject
+(void)getWithURL:(NSString *)url para:(NSDictionary *)para compeleteHandler:(void (^)(NSData * data, NSError * err))handler;
@end
