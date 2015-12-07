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

//Get请求数据的封装
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

//post请求数据的封装
+ (void)PostDataUrl:(NSString *)string body:(NSDictionary *)body block:(myblock)block error:(errorBlock)errorBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer= [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    //传入的参数
    
    [manager POST:string parameters:body success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        // block 回调
        block(responseObject);

    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        errorBlock(error);
    
    }];


}


//测试用的
//+ (void)PostDataUrl:(NSString *)string Str:(NSString *)str block:(myblock)block error:(errorBlock)errorBlock{
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    //申明返回的结果是json类型
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    //申明请求的数据是json类型
//    manager.requestSerializer= [AFJSONRequestSerializer serializer];
//    //如果报接受类型不一致请替换一致text/html或别的
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    //传入的参数
//    
//    [manager POST:string parameters:str success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        // block 回调
//        block(responseObject);
//        
//    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        
//        errorBlock(error);
//        
//    }];
//    
//    
//}


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
