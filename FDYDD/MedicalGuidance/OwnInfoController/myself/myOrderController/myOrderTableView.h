//
//  myOrderTableView.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/30.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myOrderTableView : UITableViewCell


//cell的状态
@property(strong,nonatomic)UILabel *lblstatu;
//陪诊页面的布局
@property(strong,nonatomic)UILabel *lblTime;
@property(strong,nonatomic)UILabel *lblName;
@property(strong,nonatomic)UILabel *lblPerson;
@property(strong,nonatomic)UILabel *lblHospital;
@property(strong,nonatomic)UIImageView *imgBase;
@property(strong,nonatomic)UIImageView *imgHead;
@property(strong,nonatomic)UIImageView *imgHospital;








@end
