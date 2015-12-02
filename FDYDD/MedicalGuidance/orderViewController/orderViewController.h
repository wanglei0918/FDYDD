//
//  orderViewController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/19.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "orderView.h"

//创建代理协议
@protocol MainmapDelegate <NSObject>

-(void)sendMessage:(id)sender;

@end


@interface orderViewController : UIViewController
//声明代理
@property(nonatomic,weak)id<MainmapDelegate>myDelegate;

@property(strong,nonatomic)orderView *orderview;

//设置相机和照片选取
@property(strong,nonatomic)UIPickerView *pickerView;
@property(strong,nonatomic)UIDatePicker *dataPicker;
@property(strong,nonatomic)UILabel *showlabel;



@end
