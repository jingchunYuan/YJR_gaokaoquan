//
//  ManModel+Request.m
//  gaokaoquan
//
//  Created by Nevis on 16/8/26.
//  Copyright © 2016年 袁静茹. All rights reserved.
//

#import "ManModel+Request.h"

@implementation ManModel (Request)
+(void)RequestWithUrl:(NSString *)url
              andPara:(NSDictionary *)para
          andCallBack:(void (^)(NSArray *arr, NSError *))callBack {
    NSLog(@"%@",url);
    [BaseRequest getWithURL:@"http://api.dev.gaokaoq.com/index?text=0231" para:nil compeleteHandler:^(NSData *data, NSError *err) {
        if (!err) {
            [BaseRequest getWithURL:url
                               para:para
                   compeleteHandler:^(NSData *data, NSError *err) {
                       
                       if (!err) {
                           NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                           JSONModelArray * models = [[JSONModelArray alloc]initWithArray: dict[@"data"][@"list"]modelClass:[ManModel class]];
                           dispatch_async(dispatch_get_main_queue(), ^{
                               callBack((NSArray *)models,nil);
                           });
                       }else{
                           dispatch_async(dispatch_get_main_queue(), ^{
                               callBack(nil,err);
                           });
                       }
            }];

        }else {
            NSLog(@"err = %@",err.description);
        }
    
    }];

    
}

#pragma mark - 是否是第一次进入
+ (BOOL)isFirstEnter
{
    //从NSUserDefaults中取出进入应用的次数
    NSInteger enterCount = [[NSUserDefaults standardUserDefaults] integerForKey:ENTER_COUNT];
    enterCount ++;
    //存放进入次数
    [[NSUserDefaults standardUserDefaults]setInteger:enterCount forKey:ENTER_COUNT];
    if (enterCount == 1) {
        //第一次进入
        return YES;
    }
    return NO;//不是第一次进入
}
@end
