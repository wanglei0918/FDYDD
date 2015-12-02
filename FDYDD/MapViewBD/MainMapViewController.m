//
//  MainMapViewController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/13.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "MainMapViewController.h"
#import "orderViewController.h"
#import "OwnInfoController.h"
#import "MessageController.h"
#import "waitView.h"


@interface MainMapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeneralDelegate,MainmapDelegate>

//等待接单时的视图
@property(strong,nonatomic)waitView *waitview;
@property(strong,nonatomic)UIView *baseView;


@end

@implementation MainMapViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(160)-FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(30))];
    lblTitle.text = @"陪诊人员已接单";
    lblTitle.textColor = [UIColor redColor];
    self.navigationItem.titleView = lblTitle;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"me"] style:UIBarButtonItemStyleDone target:self action:@selector(leftButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStyleDone target:self action:@selector(rightButton)];
    [self.navigationItem.rightBarButtonItem setTitle:@"取消订单"];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor blackColor]];
    self.navigationController.navigationBarHidden = YES;
    
    //初始化地图的方法
    [self initMapView];

   //订单之后地图下方的信息
    self.orderView = [[UIView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(5), self.view.bottom-FIXWIDTHORHEIGHT(80), self.view.width-FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(80))];
    self.orderView.backgroundColor = [UIColor whiteColor];
    [self.mapView addSubview:self.orderView];
    
    
    
    //目标医院
    self.imgvwHosp = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(12), FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(25))];
    [self.orderView addSubview:self.imgvwHosp];
    self.imgvwHosp.image = [UIImage imageNamed:@"target"];
    self.lblHospital = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(40), self.imgvwHosp.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lblHospital.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.orderView addSubview:self.lblHospital];
    self.lblHospital.text = @"目标医院:";
    self.lblhosptxt = [[UILabel alloc] initWithFrame:CGRectMake(self.lblHospital.right+5, self.lblHospital.top, FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(25))];
    self.lblhosptxt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblhosptxt.text = @"杭州市第一人民医院";
    [self.orderView addSubview:self.lblhosptxt];
    //服务时间
    self.imgvwTime = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgvwHosp.left, self.imgvwHosp.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(25))];
    [self.orderView addSubview:self.imgvwTime];
    self.imgvwTime.image = [UIImage imageNamed:@"time"];
    self.lblTimetxt = [[UILabel alloc] initWithFrame:CGRectMake(self.lblHospital.left, self.imgvwTime.top, FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(25))];
    self.lblTimetxt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblTimetxt.text = @"2015年11月23号 上午";
    [self.orderView addSubview:self.lblTimetxt];
    //金额为198元
    self.lblmoney = [[UILabel alloc] initWithFrame:CGRectMake(self.view.width-FIXWIDTHORHEIGHT(60), self.lblTimetxt.top, FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(25))];
    self.lblmoney.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblmoney.text = @"$198元";
    [self.orderView addSubview:self.lblmoney];
    
    
    
    //地图下方的信息栏  和地图有先后顺序的  地图先
    self.menuView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bottom-FIXWIDTHORHEIGHT(80), self.view.width, FIXWIDTHORHEIGHT(80))];
    self.menuView.backgroundColor = RGBCOLOR(246, 246, 246);
    [self.view addSubview:self.menuView];
    //在信息栏中放三个按钮
    [self MakeButton];

    //注册消息通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeInterface:) name:@"changeInterface" object:nil];
   
}
-(void)initMapView
{
    //初始化地图视图
    self.mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    //地图级别
    self.mapView.zoomLevel = 17;
    self.mapView.mapType = BMKMapTypeStandard;
    self.mapView.delegate = self;
    self.view = self.mapView;
    
    
    // 设定是否显示定位图层
    [self.mapView setShowsUserLocation:YES];
    //显示定位地图，定位用户当前位置   初始化定位服务对象
    self.locationService = [[BMKLocationService alloc] init];
    self.locationService.delegate = self;
    //显示定位的蓝点儿必须先开启定位服务
    [self.locationService startUserLocationService];
    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapView.showsUserLocation = YES;//显示定位图层
    
}
-(void)changeInterface:(NSNotificationCenter *)notification
{
    //消息中心发送的通知
    [self makeChange];
}
-(void)makeChange
{

    //显示导航栏并隐藏自定义的View
    self.navigationController.navigationBarHidden = NO;
    self.menuView.hidden = YES;
    self.baseView= [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _baseView.exclusiveTouch = NO;
    _baseView.multipleTouchEnabled = YES;
    _baseView.backgroundColor = RGBACOLOR(0, 0, 0, 0.4);
    //灰暗背景加在window，遮蔽导航栏
    [[[UIApplication sharedApplication]keyWindow] addSubview:_baseView];
    
    //显示等待接单时的界面View
    self.waitview = [[waitView alloc] init];
    [_baseView addSubview:self.waitview];
    self.waitview.backgroundColor = [UIColor whiteColor];
    [self.waitview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_baseView);
        make.bottom.equalTo(_baseView).with.offset(FIXWIDTHORHEIGHT(-5));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(300), FIXWIDTHORHEIGHT(280)));
    }];
    //取消订单的按钮
    UIButton *canclebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    canclebtn.frame = CGRectMake(self.waitview.imgTime.left, self.waitview.imgTime.bottom+FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(255), FIXWIDTHORHEIGHT(30));
    canclebtn.backgroundColor = RGBCOLOR(220, 10, 12);
    canclebtn.layer.cornerRadius = FIXWIDTHORHEIGHT(15);
    canclebtn.backgroundColor = [UIColor whiteColor];
    [canclebtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [canclebtn setTitleColor:RGBCOLOR(220, 10, 12) forState:UIControlStateNormal];
    [canclebtn addTarget:self action:@selector(canclebtn) forControlEvents:UIControlEventTouchUpInside];
    canclebtn.layer.borderColor = RGBCOLOR(220, 10, 12).CGColor;
    canclebtn.layer.borderWidth = 1.5;
    [self.waitview addSubview:canclebtn];
    
}
//弹出视图上的取消按钮
-(void)canclebtn
{
    [self.baseView removeFromSuperview];
}
//我的页面、预约陪诊及信息页面的按钮动作
-(void)MakeButton
{
    //设置我的页面按钮
    UIButton *ownbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.menuView addSubview:ownbutton];
      [ownbutton mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerY.equalTo(self.menuView);
          make.left.equalTo(self.menuView).with.offset(FIXWIDTHORHEIGHT(30));
          make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(40)));
    }];
    [ownbutton setBackgroundImage:[UIImage imageNamed:@"me1"] forState:UIControlStateNormal];
    [ownbutton addTarget:self action:@selector(ownAction) forControlEvents:UIControlEventTouchUpInside];
    //设置信息页面的按钮
    UIButton *infobutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.menuView addSubview:infobutton];
    [infobutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.menuView);
        make.right.equalTo(self.menuView).with.offset(FIXWIDTHORHEIGHT(-30));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(40)));
    }];
    [infobutton setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [infobutton addTarget:self action:@selector(messageAction) forControlEvents:UIControlEventTouchUpInside];
    //设置预约陪诊页面的按钮
    UIImageView *guidIamgeview = [[UIImageView alloc] init];
    [self.menuView addSubview:guidIamgeview];
    [guidIamgeview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.menuView);
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(120), FIXWIDTHORHEIGHT(60)));
    }];
    guidIamgeview.image = [UIImage imageNamed:@"medical"];
    UIButton *guidbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.menuView addSubview:guidbutton];
    [guidbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.menuView);
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(60)));
    }];
    [guidbutton setBackgroundImage:[UIImage imageNamed:@"start"] forState:UIControlStateNormal];
    [guidbutton setTitle:@"陪医导诊" forState:UIControlStateNormal];
    [guidbutton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [guidbutton setTitleColor:RGBCOLOR(231, 119, 119) forState:UIControlStateNormal];
    [guidbutton addTarget:self action:@selector(guidAction) forControlEvents:UIControlEventTouchUpInside];
}
//进入我的页面
-(void)ownAction
{
    OwnInfoController *ownInfo = [[OwnInfoController alloc] init];
    UINavigationController *naOrder = [[UINavigationController alloc] initWithRootViewController:ownInfo];
    [self presentViewController:naOrder animated:YES completion:^{
        NSLog(@"进入我的页面");
    }];
}
//进入信息页面
-(void)messageAction
{
    MessageController *messageInfo = [[MessageController alloc] init];
    UINavigationController *naMessage = [[UINavigationController alloc] initWithRootViewController:messageInfo];
    [self presentViewController:naMessage animated:YES completion:^{
        NSLog(@"进入信息页面");
    }];
}
//进入预约陪诊的页面
-(void)guidAction
{
    orderViewController *orderInfo = [[orderViewController alloc] init];
    //签订传值协议
    orderInfo.myDelegate = self;

   UINavigationController *naOrder = [[UINavigationController alloc] initWithRootViewController:orderInfo];
    [self presentViewController:naOrder animated:YES completion:^{
        NSLog(@"进入预约陪诊的页面");
    }];
}
//实现协议方法
-(void)sendMessage:(id)sender
{
   //将对象强转为orderView
    orderView *orderV = (orderView *)sender;
    self.lblTimetxt.text = orderV.lbltimetxt.text;
    NSLog(@"时间：%@",orderV.lbltimetxt.text);
}

//导航栏上的左右按钮
-(void)leftButton
{
    NSLog(@"个人信息");
}
-(void)rightButton
{
    NSLog(@"导航栏上的取消订单");
}

//定位时显示用户当前位置
/*
-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"用户更新位置后调用此方法");
    [_mapView updateLocationData:userLocation];
    _mapView.centerCoordinate = userLocation.location.coordinate;
    
    //放大地图到自身的经纬度位置。
    BMKCoordinateRegion region;
    region.center.latitude  = self.locationService.userLocation.location.coordinate.latitude;
    region.center.longitude = self.locationService.userLocation.location.coordinate.longitude;
    region.span.latitudeDelta  = 0.002;
    region.span.longitudeDelta = 0.002;
    BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:region];
    if (_mapView)
    {
        _mapView.region = region;
        NSLog(@"当前的坐标是: %f,%f",self.locationService.userLocation.location.coordinate.latitude,self.locationService.userLocation.location.coordinate.longitude);
    }
    [self.mapView setRegion:adjustedRegion animated:YES];
    //停止定位服务
    [self.locationService stopUserLocationService];
}
 */
//地图视图完成加载后调用
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView
{
    NSLog(@"mapViewDidFinishLoading")
}


//   *********************点中地图底图时候调用********************
- (void)mapView:(BMKMapView *)mapView onClickedMapPoi:(BMKMapPoi*)mapPoi
{
    NSLog(@"点中低图时调用，这个方法可以用");
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    //此处暂写北京的经纬度
    coor.latitude = mapPoi.pt.latitude;
    coor.longitude = mapPoi.pt.longitude;
    annotation.coordinate = coor;
    annotation.title = mapPoi.text;
  //  向地图窗口添加标注K
    [_mapView addAnnotation:annotation];
   
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    // 此处记得不用的时候需要置nil，否则影响内存的释放
    _mapView.delegate = self;
    _locationService.delegate = self;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locationService.delegate = nil;
    [super viewWillDisappear:animated];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
