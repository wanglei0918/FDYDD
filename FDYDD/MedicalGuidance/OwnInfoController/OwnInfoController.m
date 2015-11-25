//
//  OwnInfoController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/19.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "OwnInfoController.h"
#import "MessageController.h"
#import "accountViewController.h"
#import "addressViewController.h"



@interface OwnInfoController ()

@property(strong,nonatomic)UILabel *lblName;
@property(strong,nonatomic)UILabel *lblphone;
@property(strong,nonatomic)UIImageView *imgPHone;

@end


@implementation OwnInfoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;

    //模态消失按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(40));
    [backBtn setBackgroundImage:[UIImage imageNamed:@"x"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    //模态消息页面按钮
    UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    infoBtn.frame = CGRectMake(FIXWIDTHORHEIGHT(275), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(40));
    [infoBtn setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [infoBtn addTarget:self action:@selector(infobtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoBtn];

    
    [self btnAction];

}
//模态消失方法
-(void)backAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//模态消息页面方法
-(void)infobtnAction
{
    MessageController *message = [[MessageController alloc] init];
    UINavigationController *naMe = [[UINavigationController alloc] initWithRootViewController:message];
    [self.navigationController presentViewController:naMe animated:YES completion:^{
        
    }];
}

-(void)btnAction
{
    //我的头像按钮
    UIButton *headbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:headbtn];
    headbtn.frame = CGRectMake(FIXWIDTHORHEIGHT(110), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(80));
    headbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(40);
    headbtn.backgroundColor = [UIColor whiteColor];
    [headbtn setTitle:@"头像" forState:UIControlStateNormal];
    [headbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    headbtn.backgroundColor = [UIColor whiteColor];
    [headbtn addTarget:self action:@selector(headAction) forControlEvents:UIControlEventTouchUpInside];
    headbtn.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    headbtn.layer.borderWidth = 0.5;
    //头像下面的label
    self.lblName = [[UILabel alloc] init];
    [self.view addSubview:self.lblName];
    self.lblName.text = @"布袋医仕";
    self.lblName.textAlignment = NSTextAlignmentCenter;
    [self.lblName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(headbtn).with.offset(FIXWIDTHORHEIGHT(35));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(30)));
    }];
    //头像下方的imgV
    self.imgPHone = [[UIImageView alloc] init];
    [self.view addSubview:self.imgPHone];
    [self.imgPHone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.lblName).with.offset(FIXWIDTHORHEIGHT(35));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(30)));
    }];
    //头像下方的imgV上的imgPhone
    UIImageView *imgPhone = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(30))];
    imgPhone.image = [UIImage imageNamed:@"phone"];
    [self.imgPHone addSubview:imgPhone];
    //头像下方的imgV上的lblPhone
    self.lblphone = [[UILabel alloc] initWithFrame:CGRectMake(imgPhone.right, imgPhone.top, FIXWIDTHORHEIGHT(120), FIXWIDTHORHEIGHT(30))];
     self.lblphone.textAlignment = NSTextAlignmentCenter;
    self.lblphone.text = @"18812345678";
    self.lblphone.textColor = RGBCOLOR(200, 200, 200);
    [self.imgPHone addSubview:self.lblphone];
    
    //我的账户按钮及下方lbl
    UIButton *accountbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:accountbtn];
    accountbtn.frame = CGRectMake(FIXWIDTHORHEIGHT(30), headbtn.bottom+FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(60));
    accountbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    accountbtn.backgroundColor = [UIColor whiteColor];
    [accountbtn setTitle:@"账" forState:UIControlStateNormal];
    [accountbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [accountbtn addTarget:self action:@selector(accountAction) forControlEvents:UIControlEventTouchUpInside];
    accountbtn.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    accountbtn.layer.borderWidth = 0.5;
    self.lblaccount = [[UILabel alloc] initWithFrame:CGRectMake(accountbtn.left, accountbtn.bottom, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lblaccount.text = @"我的账户";
    self.lblaccount.textColor = RGBCOLOR(200, 200, 200);
    self.lblaccount.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(12)];
    self.lblaccount.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblaccount];
    
    
    //地址管理按钮及下方lbl
    UIButton *addressbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:addressbtn];
    addressbtn.frame = CGRectMake(accountbtn.right+FIXWIDTHORHEIGHT(40), accountbtn.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(60));
    addressbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    addressbtn.backgroundColor = [UIColor whiteColor];
    [addressbtn setTitle:@"址" forState:UIControlStateNormal];
    [addressbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addressbtn addTarget:self action:@selector(addressAction) forControlEvents:UIControlEventTouchUpInside];
    addressbtn.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    addressbtn.layer.borderWidth = 0.5;
    self.lbladdress = [[UILabel alloc] initWithFrame:CGRectMake(addressbtn.left, addressbtn.bottom, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lbladdress.text = @"地址管理";
    self.lbladdress.textColor = RGBCOLOR(200, 200, 200);
    self.lbladdress.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(12)];
    self.lbladdress.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lbladdress];
    
    //我的订单按钮及下方lbl
    UIButton *orderbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:orderbtn];
    orderbtn.frame = CGRectMake(addressbtn.right+FIXWIDTHORHEIGHT(40), addressbtn.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(60));
    orderbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    orderbtn.backgroundColor = [UIColor whiteColor];
    [orderbtn setTitle:@"订" forState:UIControlStateNormal];
    [orderbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [orderbtn addTarget:self action:@selector(orderAction) forControlEvents:UIControlEventTouchUpInside];
    orderbtn.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    orderbtn.layer.borderWidth = 0.5;
    self.lblorder = [[UILabel alloc] initWithFrame:CGRectMake(orderbtn.left, orderbtn.bottom, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lblorder.text = @"我的订单";
    self.lblorder.textColor = RGBCOLOR(200, 200, 200);
    self.lblorder.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(12)];
    self.lblorder.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblorder];
    
    //健康档案按钮及下方lbl
    UIButton *archivebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:archivebtn];
    archivebtn.frame = CGRectMake(FIXWIDTHORHEIGHT(30), accountbtn.bottom+FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(60));
    archivebtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    archivebtn.backgroundColor = [UIColor whiteColor];
    [archivebtn setTitle:@"档" forState:UIControlStateNormal];
    [archivebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [archivebtn addTarget:self action:@selector(archivesAction) forControlEvents:UIControlEventTouchUpInside];
    archivebtn.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    archivebtn.layer.borderWidth = 0.5;
    self.lblarchive = [[UILabel alloc] initWithFrame:CGRectMake(archivebtn.left, archivebtn.bottom, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lblarchive.text = @"健康档案";
    self.lblarchive.textColor = RGBCOLOR(200, 200, 200);
    self.lblarchive.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(12)];
    self.lblarchive.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblarchive];
    
    //关于按钮及下方lbl
    UIButton *aboutbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:aboutbtn];
    aboutbtn.frame = CGRectMake(archivebtn.right+FIXWIDTHORHEIGHT(40), archivebtn.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(60));
    aboutbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    aboutbtn.backgroundColor = [UIColor whiteColor];
    [aboutbtn setTitle:@"关" forState:UIControlStateNormal];
    [aboutbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [aboutbtn addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
    aboutbtn.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    aboutbtn.layer.borderWidth = 0.5;
    self.lblabout = [[UILabel alloc] initWithFrame:CGRectMake(aboutbtn.left, aboutbtn.bottom, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lblabout.text = @"关于";
    self.lblabout.textColor = RGBCOLOR(200, 200, 200);
    self.lblabout.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(12)];
    self.lblabout.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblabout];

    
    //反馈按钮及下方lbl
    UIButton *feedbackbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:feedbackbtn];
    feedbackbtn.frame = CGRectMake(aboutbtn.right+FIXWIDTHORHEIGHT(40), aboutbtn.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(60));
    feedbackbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    [feedbackbtn setTitle:@"馈" forState:UIControlStateNormal];
    [feedbackbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [feedbackbtn addTarget:self action:@selector(feedbackAction) forControlEvents:UIControlEventTouchUpInside];
    feedbackbtn.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    feedbackbtn.layer.borderWidth = 0.5;
    self.lblfeedback = [[UILabel alloc] initWithFrame:CGRectMake(feedbackbtn.left, feedbackbtn.bottom, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lblfeedback.text = @"反馈";
    self.lblfeedback.textColor = RGBCOLOR(200, 200, 200);
    self.lblfeedback.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(12)];
    self.lblfeedback.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblfeedback];
}
//每个按钮的点击动作
-(void)accountAction
{
    NSLog(@"我的账户");
    accountViewController *account = [[accountViewController alloc] init];
    [self.navigationController pushViewController:account animated:YES];
     
}
-(void)addressAction
{
    NSLog(@"我的账户");
    addressViewController *address = [[addressViewController alloc] init];
    [self.navigationController pushViewController:address animated:YES];
    
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
