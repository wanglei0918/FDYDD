//
//  depositController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/12/8.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface depositController : UIViewController
@property(strong,nonatomic)UIScrollView *baseView;


@property(strong,nonatomic)UILabel *lblmoney;
//字符串类型的余额
@property(strong,nonatomic)NSString *balance;
//提现金额
@property(strong,nonatomic)UITextField *balanceText;
//输入的支付宝账号和微信账号
@property(strong,nonatomic)UITextField *alpchatText;



@end
