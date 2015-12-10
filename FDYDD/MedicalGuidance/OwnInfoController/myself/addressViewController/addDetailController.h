//
//  addDetailController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/12/8.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addDetailController : UIViewController

//填写的联系人信息
@property(strong,nonatomic)UITextField *userText;
@property(strong,nonatomic)UITextField *phoneText;

@property(strong,nonatomic)UITextField *areaText;
@property(strong,nonatomic)UITextField *villageText;
@property(strong,nonatomic)UITextField *unitText;


@property(strong,nonatomic)UIImageView *imgman;
@property(strong,nonatomic)UIImageView *imgwoman;

@end
