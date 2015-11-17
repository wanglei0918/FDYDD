//
//  LoginViewController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/11.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "LoginViewController.h"



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
    
    //设置手机号底层UIImageView
    self.userImageV = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(40), 100, FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(40))];
    self.userImageV.backgroundColor = RGBCOLOR(246, 246, 246);
    [self.loginView addSubview:self.userImageV];
    
    
    //设置ImageView圆角
    self.userImageV.layer.cornerRadius = 22*HEIGHT;
    self.ImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(22), FIXWIDTHORHEIGHT(22))];
    [self.userImageV addSubview:self.ImageView1];
    UIImage *image1 = [UIImage imageNamed:@"phone"];
    self.ImageView1.image = image1;
    
    
    //设置验证码底层UIImageView
    self.idcodeImageV = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(40), self.userImageV.frame.origin.y+62, FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(40))];
    [self.loginView addSubview:self.idcodeImageV];
    self.idcodeImageV.backgroundColor = RGBCOLOR(246, 246, 246);
    self.idcodeImageV.layer.cornerRadius = 22*HEIGHT;
    self.ImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(22), FIXWIDTHORHEIGHT(22))];
    [self.idcodeImageV addSubview:self.ImageView2];
    self.ImageView2.image = [UIImage imageNamed:@"locker"];
    
    
    //设置电话号UITextField
    self.userText = [[UITextField alloc] init];
    [self.loginView addSubview:self.userText];
    [self.userText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.userImageV).insets(UIEdgeInsetsMake(0, 50*WIDTH, 0, 0));
    }];
    self.userText.backgroundColor = [UIColor clearColor];
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
    self.ImageView3 = [[UIImageView alloc] init];
    [self.loginView addSubview:self.ImageView3];
    
    if (iPHone4oriPHone4s) {
        self.ImageView3.frame = CGRectMake(110, 350, 100, 100);
    } else {
    [self.ImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.loginView).insets(UIEdgeInsetsMake(522*HEIGHT, 120*WIDTH, 30*HEIGHT,120*WIDTH));
        }];
    }
    self.ImageView3.image = [UIImage imageNamed:@"logo1"];
    
    
    
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
    idcodeButton.layer.cornerRadius = 18*HEIGHT;
    
    
    //设置用户注册的的按钮
    UIButton *regsteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    regsteButton.frame = CGRectMake(FIXWIDTHORHEIGHT(40), self.idcodeImageV.frame.origin.y+62, FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(40));
    [regsteButton addTarget:self action:@selector(regsteAction) forControlEvents:UIControlEventTouchUpInside];
    [regsteButton setBackgroundImage:nil forState:UIControlStateNormal];
    [regsteButton setTitle:@"注册" forState:UIControlStateNormal];
    regsteButton.backgroundColor = RGBCOLOR(220, 10, 12);
    regsteButton.layer.cornerRadius = 22*HEIGHT;
    [self.loginView addSubview:regsteButton];
    
//    //设置用户协议
    self.ImageViewdelegate = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(40), self.idcodeImageV.frame.origin.y+112, FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(30))];
    [self.loginView addSubview:self.ImageViewdelegate];
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(60),self.ImageViewdelegate.frame.origin.y+10,10,10)];
    self.label1.layer.masksToBounds = YES;
    self.label1.layer.cornerRadius = 5;
    self.label1.backgroundColor = RGBCOLOR(220, 10, 12);
    [self.loginView addSubview:self.label1];
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake(self.label1.right+5,self.label1.top-2,0,0)];
    self.label2.text =@"注册即视为您已同意";
    self.label2.font = [UIFont fontWithName:@"Helvetica" size:12];
    [self.label2 sizeToFit];
    [self.loginView addSubview:self.label2];
    
    self.label3 = [[UILabel alloc] initWithFrame:CGRectMake(self.label2.right,self.label1.top-2,0,0)];
    self.label3.text = @"医点点用户协议";
    self.label3.textColor = RGBCOLOR(231, 119, 119);
    self.label3.font = [UIFont fontWithName:@"Helvetica" size:12];
    [self.label3 sizeToFit];
    self.label3.userInteractionEnabled = YES;   //打开label的用户交互
    [self.loginView addSubview:self.label3];
    //加协议手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    tapGesture.numberOfTapsRequired = 1; //点击次数
    tapGesture.numberOfTouchesRequired = 1;
    [self.label3 addGestureRecognizer:tapGesture];
   [self.loginView endEditing:YES];
}

-(void)regsteAction
{
    MainMapViewController *mainVC = [[MainMapViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
    NSLog(@"注册");
}

-(void)idcodeButton
{

    NSLog(@"获取验证码");
}
-(void)tapGesture:(UITapGestureRecognizer*)tap
{

    NSLog(@"获取用户协议");

}






/*
  
 //设置底层ImageView的约束
 //    [self.userImageV mas_makeConstraints:^(MASConstraintMaker *make) {
 //        make.edges.equalTo(self.loginView).insets(UIEdgeInsetsMake(110*HEIGHT, 30*WIDTH, 515*HEIGHT, 45*WIDTH));
 //    }];

 //    [self.ImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
 //        make.edges.equalTo(self.userImageV).insets(UIEdgeInsetsMake(0, 10, 0, 250*WIDTH));
 //    }];
 
 //    [self.idcodeImageV mas_makeConstraints:^(MASConstraintMaker *make) {
 //        make.edges.equalTo(self.loginView).insets(UIEdgeInsetsMake(180*HEIGHT, 30*WIDTH, 445*HEIGHT, 45*WIDTH));
 //    }];

 //    [self.ImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
 //        make.edges.equalTo(self.idcodeImageV).insets(UIEdgeInsetsMake(0, 10, 0, 250*WIDTH));
 //    }];
 
 // 等价于
 // make.top.equalTo(sv).with.offset(10);
 // make.left.equalTo(sv).with.offset(10);
 // make.bottom.equalTo(sv).with.offset(-10);
 // make.right.equalTo(sv).with.offset(-10);
  
 
 //    UILabel *lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(0, regsteButton.bottom+15, 0, 0)];
 //    lbl1.text = @"注册即视为您已同意";
 //    [lbl1 sizeToFit];
 //    [self.view addSubview:lbl1];
 //
 //    UILabel *lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(lbl1.right, lbl1.top, 0, 0)];
 //    lbl2.text = @"医点点用户协议";
 //    [lbl2 sizeToFit];
 //    [self.view addSubview:lbl2];

  */






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
