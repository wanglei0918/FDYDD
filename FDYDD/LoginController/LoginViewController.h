//
//  LoginViewController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/11.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "MainMapViewController.h"


@interface LoginViewController : UIViewController



@property(strong,nonatomic)LoginView *loginView;

//UITextField设置电话号和验证码
@property(strong,nonatomic)UITextField *userText;
@property(strong,nonatomic)UITextField *idcodeText;
@property(strong,nonatomic)UIImageView *userImageV;
@property(strong,nonatomic)UIImageView *idcodeImageV;
@property(strong,nonatomic)UIImageView *phoneImageView;
@property(strong,nonatomic)UIImageView *lockerImageView;
//注册页面的logoUIImageView
@property(strong,nonatomic)UIImageView *logoImageView;
//用户协议ImageView
@property(strong,nonatomic)UIImageView *ImageViewdelegate;
@property(strong,nonatomic)UILabel *label1;
@property(strong,nonatomic)UILabel *label2;
@property(strong,nonatomic)UILabel *label3;






@end
