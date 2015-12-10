//
//  depositController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/12/8.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "depositController.h"

@interface depositController ()<UITextFieldDelegate>

@property(strong,nonatomic)UIButton *alipaybtn;
@property(strong,nonatomic)UIButton *wechatbtn;

@end

@implementation depositController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.baseView = [[UIScrollView alloc] initWithFrame:self.view.frame];
//    self.baseView.backgroundColor = [UIColor whiteColor];
    
    UILabel *lbltitle = [[UILabel alloc] init];
    [self.view addSubview:lbltitle];
    [lbltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(25));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(30)));
    }];
    lbltitle.text = @"我的钱包";
    lbltitle.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(18)];
    lbltitle.textAlignment = NSTextAlignmentCenter;
    lbltitle.textColor = RGBCOLOR(216, 65, 72);
    
    [self UIInterface];
}
-(void)UIInterface
{

    //新增页面联系人信息
    UIImageView *imgMoneybase = [[UIImageView alloc] initWithFrame:CGRectMake(0, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(320), FIXWIDTHORHEIGHT(120))];
    imgMoneybase.image = [UIImage imageNamed:@"bg-7"];
    [self.view addSubview:imgMoneybase];
    imgMoneybase.userInteractionEnabled = YES;
    //联系人信息
    UILabel *moneylbl = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(65), FIXWIDTHORHEIGHT(25))];
    moneylbl.text = @"可提现金";
    moneylbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgMoneybase addSubview:moneylbl];
     //可提现金额
    self.lblmoney = [[UILabel alloc] initWithFrame:CGRectMake(moneylbl.right+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(40))];
    self.lblmoney.text = self.balance;
    [self.lblmoney setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(25)]];
     self.lblmoney.textColor = [UIColor redColor];
    self.lblmoney.textAlignment = NSTextAlignmentCenter;
    [imgMoneybase addSubview:self.lblmoney];
//    self.lblmoney.backgroundColor = [UIColor yellowColor];
    //元
    UILabel *lblcoin = [[UILabel alloc] initWithFrame:CGRectMake(self.lblmoney.right, FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(25))];
    lblcoin.text = @"元";
    lblcoin.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgMoneybase addSubview:lblcoin];
    
    UILabel *outmoneylbl = [[UILabel alloc] initWithFrame:CGRectMake(moneylbl.left, moneylbl.bottom+FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(65), FIXWIDTHORHEIGHT(25))];
    outmoneylbl.text = @"提出现金";
//    outmoneylbl.backgroundColor = [UIColor lightGrayColor];
    outmoneylbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgMoneybase addSubview:outmoneylbl];
    //设置输入金额框
    UIImageView *imgvwtext = [[UIImageView alloc] initWithFrame:CGRectMake(outmoneylbl.right, outmoneylbl.top-FIXWIDTHORHEIGHT(8), FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(40))];
    imgvwtext.backgroundColor = RGBCOLOR(246, 246, 246);
    imgvwtext.layer.cornerRadius = FIXWIDTHORHEIGHT(20);
    [imgMoneybase addSubview:imgvwtext];
    UILabel *lblyuan = [[UILabel alloc] initWithFrame:CGRectMake(imgvwtext.right, outmoneylbl.top, FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(25))];
    lblyuan.text = @"元";
    lblyuan.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgMoneybase addSubview:lblyuan];
    
    self.balanceText = [[UITextField alloc] initWithFrame:CGRectMake(imgvwtext.left+FIXWIDTHORHEIGHT(20), outmoneylbl.top, FIXWIDTHORHEIGHT(120), FIXWIDTHORHEIGHT(25))];
    self.balanceText.placeholder = @"请输入提现金额";
     self.balanceText.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.balanceText.keyboardType = UIKeyboardTypePhonePad;
    [imgMoneybase addSubview:self.balanceText];
   
    //选择支付宝方式
    self.alipaybtn = [[UIButton alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(35), imgMoneybase.bottom+FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    [self.alipaybtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [self.view addSubview:self.alipaybtn];
    UIImageView *imgalipay = [[UIImageView alloc] initWithFrame:CGRectMake(self.alipaybtn.right+FIXWIDTHORHEIGHT(5), self.alipaybtn.top-FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(30))];
    imgalipay.layer.cornerRadius = FIXWIDTHORHEIGHT(15);
    imgalipay.image = [UIImage imageNamed:@"alipay1"];
    [self.view addSubview:imgalipay];
    UILabel *lblalipay = [[UILabel alloc] initWithFrame:CGRectMake(imgalipay.right+FIXWIDTHORHEIGHT(3), self.alipaybtn.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(20))];
    [self.view addSubview:lblalipay];
    lblalipay.text = @"支付宝钱包";
    lblalipay.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)];
    //选择微信方式
    self.wechatbtn = [[UIButton alloc] initWithFrame:CGRectMake(lblalipay.right+FIXWIDTHORHEIGHT(20), self.alipaybtn.top, FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    [self.wechatbtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [self.view addSubview:self.wechatbtn];
    UIImageView *imgwechat = [[UIImageView alloc] initWithFrame:CGRectMake(self.wechatbtn.right+FIXWIDTHORHEIGHT(5), self.alipaybtn.top-FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(30))];
    imgwechat.layer.cornerRadius = FIXWIDTHORHEIGHT(15);
    imgwechat.image = [UIImage imageNamed:@"wechat1"];
    [self.view addSubview:imgwechat];
    UILabel *lblwechat = [[UILabel alloc] initWithFrame:CGRectMake(imgwechat.right+FIXWIDTHORHEIGHT(3), self.alipaybtn.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(20))];
    [self.view addSubview:lblwechat];
    lblwechat.text = @"微信钱包";
    lblwechat.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)];
    
    //输入提现种类名称
    UIImageView *imgway = [[UIImageView alloc] initWithFrame:CGRectMake(moneylbl.left, lblwechat.bottom+FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(280), FIXWIDTHORHEIGHT(40))];
    imgway.backgroundColor = RGBCOLOR(246, 246, 246);
    imgway.layer.cornerRadius = FIXWIDTHORHEIGHT(20);
    imgway.userInteractionEnabled = YES;
    [self.view addSubview:imgway];
    self.alpchatText = [[UITextField alloc] init];
    [imgway addSubview:self.alpchatText];
    [self.alpchatText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imgway);
        make.left.equalTo(imgway).with.offset(FIXWIDTHORHEIGHT(15));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(200), 25));
    }];
    self.alpchatText.placeholder = @"请输入支付宝账号";
    self.alpchatText.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(15)];
    self.alpchatText.delegate = self;
    
    //红色提现按钮
    UIButton *depositbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:depositbtn];
    depositbtn.frame = CGRectMake(imgway.left, imgway.bottom+FIXWIDTHORHEIGHT(10), imgway.frame.size.width, imgway.frame.size.height);
    [depositbtn setTitle:@"提现" forState:UIControlStateNormal];
    depositbtn.backgroundColor = RGBCOLOR(220, 10, 12);
    depositbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(20);
    [depositbtn addTarget:self action:@selector(depositAction) forControlEvents:UIControlEventTouchUpInside];
    
    //注册页面的logo
    UIImageView *imgLogo = [[UIImageView alloc] init];
    [self.view addSubview:imgLogo];
    
    if (iPHone4oriPHone4s) {
        imgLogo.frame = CGRectMake(130, 380, 60, 80);
    } else {
        [imgLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(-40));
            make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(80)));
        }];
    }
    imgLogo.image = [UIImage imageNamed:@"logo2"];

    
}
//提现红色按钮动作
-(void)depositAction
{
    NSLog(@"提出现金");

}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    NSLog(@"000");
    [UIView commitAnimations];
}
//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{NSLog(@"123");
    [textField resignFirstResponder];
    return YES;
}
//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{NSLog(@"456");
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.alpchatText resignFirstResponder]; [self.balanceText resignFirstResponder];
//    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"0123");
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
