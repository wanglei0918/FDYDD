//
//  MainMapViewController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/13.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>



@interface MainMapViewController : UIViewController
//设置地图view
@property(strong,nonatomic)BMKMapView *mapView;
@property(strong, nonatomic)BMKMapView *bmkMapView;

//设置用户当前位置（定位）
@property(strong,nonatomic)BMKLocationService *locationService;
/** 百度定位地图服务 */
@property (nonatomic, strong) BMKLocationService *bmkLocationService;



//设置地图下方的信息View
@property(strong,nonatomic)UIView *orderView;
@property(strong,nonatomic)UIView *menuView;

//预约陪诊传过来的联系人名字,医院和时间
@property(strong,nonatomic)UIImageView *imgvwHosp;
@property(strong,nonatomic)UIImageView *imgvwTime;
@property(strong,nonatomic)UILabel *lblUserName;
@property(strong,nonatomic)UILabel *lblHospital;
@property(strong,nonatomic)UILabel *lblhosptxt;
@property(strong,nonatomic)UILabel *lblTimetxt;
@property(strong,nonatomic)UILabel *lblmoney;

@end
