//
//  LoginViewController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/11.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "LoginViewController.h"
#import "TipView.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = YES;

    [self initLogin];
    

    
}

- (void)initLogin
{
    //创建登录页面View
    self.loginView = [[LoginView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.loginView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginView];
    
    UITapGestureRecognizer *returnKey = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHiden)];
    returnKey.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:returnKey];
    
    
    //设置手机号底层UIImageView
    self.userImageV = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(40), 100, FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(40))];
    self.userImageV.backgroundColor = RGBCOLOR(246, 246, 246);
    [self.loginView addSubview:self.userImageV];
    
    
    //设置ImageView圆角
    self.userImageV.layer.cornerRadius = FIXWIDTHORHEIGHT(20);
    self.phoneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(22), FIXWIDTHORHEIGHT(22))];
    [self.userImageV addSubview:self.phoneImageView];
    UIImage *image1 = [UIImage imageNamed:@"phone"];
    self.phoneImageView.image = image1;
    
    
    //设置验证码底层UIImageView
    self.idcodeImageV = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(40), self.userImageV.frame.origin.y+62, FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(40))];
    [self.loginView addSubview:self.idcodeImageV];
    self.idcodeImageV.backgroundColor = RGBCOLOR(246, 246, 246);
    self.idcodeImageV.layer.cornerRadius = FIXWIDTHORHEIGHT(20);
    self.lockerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(22), FIXWIDTHORHEIGHT(22))];
    [self.idcodeImageV addSubview:self.lockerImageView];
    self.lockerImageView.image = [UIImage imageNamed:@"locker"];
    
    
    //设置电话号UITextField
    self.userText = [[UITextField alloc] init];
    [self.loginView addSubview:self.userText];
    [self.userText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.userImageV).insets(UIEdgeInsetsMake(0, 50*WIDTH, 0, 0));
    }];
    self.userText.placeholder = @"请输入手机号";
    self.userText.userInteractionEnabled = YES;
    self.userText.keyboardType = UIKeyboardTypePhonePad;
    
    
    //设置验证码UITextField
    self.idcodeText = [[UITextField alloc] init];
    [self.loginView addSubview:self.idcodeText];
    [self.idcodeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.idcodeImageV).insets(UIEdgeInsetsMake(0, 50*WIDTH, 0, 100*HEIGHT));
    }];
    self.idcodeText.placeholder = @"请输入验证码";
    self.idcodeText.secureTextEntry = YES;
    self.idcodeText.userInteractionEnabled = YES;
    self.idcodeText.keyboardType = UIKeyboardTypePhonePad;
    
    
    //注册页面的logo
    self.logoImageView = [[UIImageView alloc] init];
    [self.loginView addSubview:self.logoImageView];
    
    if (iPHone4oriPHone4s) {
        self.logoImageView.frame = CGRectMake(110, 350, 100, 100);
    } else {
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.loginView).insets(UIEdgeInsetsMake(522*HEIGHT, 120*WIDTH, 30*HEIGHT,120*WIDTH));
        }];
    }
    self.logoImageView.image = [UIImage imageNamed:@"logo1"];
    
    
    //设置获取验证码按钮
    UIButton *idcodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginView addSubview:idcodeButton];
    [idcodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.idcodeImageV).insets(UIEdgeInsetsMake(4*HEIGHT, 180*WIDTH, 4*HEIGHT, 4*WIDTH));
    }];
    [idcodeButton addTarget:self action:@selector(idcodeButton) forControlEvents:UIControlEventTouchUpInside];
    [idcodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    idcodeButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [idcodeButton setTitleColor:RGBCOLOR(231, 119, 119) forState:UIControlStateNormal];
    idcodeButton.backgroundColor = RGBCOLOR(246, 246, 246);
    idcodeButton.layer.masksToBounds = YES;
    idcodeButton.layer.borderWidth = 1.0;
    idcodeButton.layer.borderColor = [RGBCOLOR(220, 10, 12) CGColor];
    idcodeButton.layer.cornerRadius = FIXWIDTHORHEIGHT(16);
    
    
    //设置用户注册的的按钮
    UIButton *regsteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    regsteButton.frame = CGRectMake(FIXWIDTHORHEIGHT(40), self.idcodeImageV.frame.origin.y+62, FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(40));
    [regsteButton addTarget:self action:@selector(regsteAction) forControlEvents:UIControlEventTouchUpInside];
    [regsteButton setBackgroundImage:nil forState:UIControlStateNormal];
    [regsteButton setTitle:@"登录" forState:UIControlStateNormal];
    regsteButton.backgroundColor = RGBCOLOR(220, 10, 12);
    regsteButton.layer.cornerRadius = FIXWIDTHORHEIGHT(20);
    [self.loginView addSubview:regsteButton];
    
//    //设置用户协议
    self.ImageViewdelegate = [[UIImageView alloc] init];
    [self.loginView addSubview:self.ImageViewdelegate];
    [self.ImageViewdelegate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(regsteButton).with.offset(FIXWIDTHORHEIGHT(40));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(30)));
    }];
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20),self.ImageViewdelegate.frame.origin.y+FIXWIDTHORHEIGHT(10),FIXWIDTHORHEIGHT(10),FIXWIDTHORHEIGHT(10))];
    self.label1.layer.masksToBounds = YES;
    self.label1.layer.cornerRadius = FIXWIDTHORHEIGHT(5);
    self.label1.backgroundColor = RGBCOLOR(220, 10, 12);
    [self.ImageViewdelegate addSubview:self.label1];
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(self.label1.right+5,self.label1.top-2,0,0)];
    self.label2.text =@"注册即视为您已同意";
    self.label2.font = [UIFont fontWithName:@"Helvetica" size:FIXWIDTHORHEIGHT(12)];
    [self.label2 sizeToFit];
    [self.ImageViewdelegate addSubview:self.label2];
    
    self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(self.label2.right,self.label1.top-2,0,0)];
    self.label3.text = @"医点点用户协议";
    self.label3.textColor = RGBCOLOR(231, 119, 119);
    self.label3.font = [UIFont fontWithName:@"Helvetica" size:FIXWIDTHORHEIGHT(12)];
    [self.label3 sizeToFit];
    self.label3.userInteractionEnabled = YES;   //打开label的用户交互
    [self.ImageViewdelegate addSubview:self.label3];
    //加协议手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    tapGesture.numberOfTapsRequired = 1; //点击次数
    tapGesture.numberOfTouchesRequired = 1;
    [self.label3 addGestureRecognizer:tapGesture];
   
}

-(void)regsteAction
{
    UIView *aView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    aView.backgroundColor = [UIColor blackColor];
    aView.alpha = 0.5;
    [self.view addSubview:aView];
    
    TipView *tipview = [[TipView alloc] init];
    [self.view addSubview:tipview];
    [tipview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.loginView);
        make.size.mas_equalTo(CGSizeMake(251*HEIGHT, 251*HEIGHT));
    }];
    tipview.layer.cornerRadius = 10;
   // 时间间隔俩秒
  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerAction) userInfo:nil repeats:NO];
    
}

-(void)idcodeButton
{
    NSLog(@"获取验证码");
}
-(void)tapGesture:(UITapGestureRecognizer*)tap
{
    NSLog(@"获取用户协议");
}
//键盘回收
-(void)keyboardHiden
{
    [self.userText resignFirstResponder];
    [self.idcodeText resignFirstResponder];
}

-(void)timerAction
{
    MainMapViewController *mainVC = [[MainMapViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
    NSLog(@"登录");
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
