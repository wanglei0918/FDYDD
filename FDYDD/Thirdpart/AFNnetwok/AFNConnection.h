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


+(void)GetData:(NSString *)string block:(myblock)block;



//+(void)GetData:(NSString *)string block:(myblock)block blockError:(errorBlock)blockError;



@end
