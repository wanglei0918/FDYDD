//
//  accountViewController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface accountViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property(strong,nonatomic)UITableView *myActTableView;



//我的账户及下面的底层图片
@property(strong,nonatomic)UILabel *lblTitle;
@property(strong,nonatomic)UIImageView *imgBase;
//底层图片上的布局
@property(strong,nonatomic)UILabel *lblbalan;
@property(strong,nonatomic)UILabel *lblnumber;
@property(strong,nonatomic)UILabel *lblmoney;
@property(strong,nonatomic)UIImageView *imgWallet;
@property(strong,nonatomic)UIImageView *imgCash;



@property(strong,nonatomic)NSMutableArray *countArray;

@end
