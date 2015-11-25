//
//  AFNConnection.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/19.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "AFNConnection.h"

@implementation AFNConnection


///解析AFNNetWorking网址http://www.jianshu.com/p/0ab3ffa9c5f5

+(void)GetData:(NSString *)string block:(myblock)block
{
    
    //对AFN的一个封装
    NSString *url_string =string;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url_string parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //成功
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        block(obj);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //失败
    }];
    
}

/*
 
 NSURL *URL = [NSURL URLWithString:@""];
 AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 [manager GET:URL.absoluteString parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
 
 NSLog(@"JSON: %@", responseObject);
 
 } failure:^(NSURLSessionTask *operation, NSError *error) {
 
 NSLog(@"Error: %@", error);
 
 }];
 
 
 */





/***********************/// 以下是AFNNetWorking未更新的网络请求方法

//+(void)GetData:(NSString *)string block:(myblock)block
//{
//    
//    //对AFN的一个封装
//    AFNetworkReachabilityManager *netWorkManager = [AFNetworkReachabilityManager sharedManager];
//    NSString *url_string =string;
//    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html",nil];
//    [manager GET:url_string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        [netWorkManager stopMonitoring];
//        //block回调
//        block(responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [GiFHUD dismiss];
//        NSLog(@"失败==== %@",error);
//        
//    }];
//    
//    
//}
//
//+(void)GetData:(NSString *)string block:(myblock)block blockError:(errorBlock)blockError
//{
//    
//    AFNetworkReachabilityManager *netWorkManager = [AFNetworkReachabilityManager sharedManager];
//    NSString *url_string =string;
//    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html",nil];
//    [manager GET:url_string parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        [netWorkManager stopMonitoring];
//        //block回调
//        block(responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [GiFHUD dismiss];
//        blockError(error);
//        
//    }];
//    
//}





@end