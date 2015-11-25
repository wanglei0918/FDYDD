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

//设置地图下方的信息View
@property(strong,nonatomic)UIView *menuView;



@end
