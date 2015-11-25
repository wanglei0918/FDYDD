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



@interface MainMapViewController ()<BMKMapViewDelegate>

@end

@implementation MainMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.navigationController.navigationBarHidden = YES;
    //初始化地图的方法
    [self initMapView];
    
    
    //地图下方的信息栏
    self.menuView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bottom-100*HEIGHT, self.view.width, 100*HEIGHT)];
    self.menuView.backgroundColor = RGBCOLOR(246, 246, 246);
    [self.view addSubview:self.menuView];
    //在信息栏中放三个按钮
    [self MakeButton];
    
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
}

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

-(void)ownAction
{
    OwnInfoController *ownInfo = [[OwnInfoController alloc] init];
    UINavigationController *naOrder = [[UINavigationController alloc] initWithRootViewController:ownInfo];
    [self presentViewController:naOrder animated:YES completion:^{
        
        NSLog(@"进入我的页面");
    }];

}

-(void)messageAction
{
    MessageController *messageInfo = [[MessageController alloc] init];
    UINavigationController *naMessage = [[UINavigationController alloc] initWithRootViewController:messageInfo];
    [self presentViewController:naMessage animated:YES completion:^{
        NSLog(@"进入信息页面");
    }];
}

-(void)guidAction
{
    orderViewController *orderInfo = [[orderViewController alloc] init];
    UINavigationController *naOrder = [[UINavigationController alloc] initWithRootViewController:orderInfo];
    [self presentViewController:naOrder animated:YES completion:^{
        
        NSLog(@"进入预约陪诊的页面");
    }];
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
  //  向地图窗口添加标注
    [_mapView addAnnotation:annotation];
   
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
