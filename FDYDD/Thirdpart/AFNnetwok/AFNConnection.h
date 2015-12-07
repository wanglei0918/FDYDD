//
//  AFNConnection.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/19.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^myblock) (id backData);
typedef void(^errorBlock) (NSError *error);


@interface AFNConnection : NSObject


//GET请求
+(void)GetData:(NSString *)string block:(myblock)block;
//Post请求
+ (void)PostDataUrl:(NSString *)string body:(NSDictionary *)body block:(myblock)block error:(errorBlock)errorBlock;

//+(void)GetData:(NSString *)string block:(myblock)block blockError:(errorBlock)blockError;








//测试
//+ (void)PostDataUrl:(NSString *)string Str:(NSString *)str block:(myblock)block error:(errorBlock)errorBlock;
@end
