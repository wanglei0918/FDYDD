//
//  MainMapViewController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/13.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "MainMapViewController.h"

@interface MainMapViewController ()

@end

@implementation MainMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationController.navigationBarHidden = YES;
    
    
    [self initMapView];
    
}

-(void)initMapView
{

    //初始化地图视图
    self.mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    
    //地图级别
    self.mapView.zoomLevel = 17;
    self.mapView.mapType = BMKMapTypeStandard;
    self.view = self.mapView;



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
