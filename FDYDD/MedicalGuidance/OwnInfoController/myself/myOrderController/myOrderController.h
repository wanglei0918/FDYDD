//
//  myOrderController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myOrderTableView.h"


@interface myOrderController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property(strong,nonatomic)UITableView *OrderTableView;






@property(strong,nonatomic)NSMutableArray *countArray;

@end
