//
//  OrderDetailController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/12/2.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQStarRatingView.h"
#import "RatView.h"

@interface OrderDetailController : UIViewController<StarRatingViewDelegate>
//评分的类
@property (nonatomic, strong) TQStarRatingView *starRatingView;

@property(strong,nonatomic)RatView *ratview;
@property(strong,nonatomic)UIView *aview;


//设置订单状态
@property(strong,nonatomic)UILabel *lblstaus;

//订单详情下的信息
@property(strong,nonatomic)UILabel *lblCont;
@property(strong,nonatomic)UILabel *lblContxt;
@property(strong,nonatomic)UILabel *lblContPhone;
@property(strong,nonatomic)UILabel *lblPhone;
@property(strong,nonatomic)UILabel *lblHospital;
@property(strong,nonatomic)UILabel *lblhosptxt;
@property(strong,nonatomic)UILabel *lblPatient;
@property(strong,nonatomic)UILabel *lblPatxt;
//起始时间
@property(strong,nonatomic)UILabel *lblTimestar;
@property(strong,nonatomic)UILabel *lblTimeend;
//服务类型
@property(strong,nonatomic)UILabel *lbltypetxt;
@property(strong,nonatomic)UILabel *lblmoneySum;
//评分
@property(strong,nonatomic)UILabel *lblscore;


@end
