//
//  nameChangeViewController.h
//  FDYDD
//
//  Created by fdkj0002 on 15/12/9.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol backName <NSObject>
-(void)backNameString:(NSString *)name;//协议传值
@end


@interface nameChangeViewController : UIViewController
@property(nonatomic,assign)id <backName>delegate;
@property(nonatomic,strong)NSString * name;
@end
