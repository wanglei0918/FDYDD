//
//  addressViewController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addTableViewCell.h"
#import "addDetailController.h"

@interface addressViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>



@property(strong,nonatomic)UITableView *addTableview;



@end
