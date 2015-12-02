//
//  orderViewController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/19.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "orderViewController.h"
#import "ServeInstrutionController.h"
#import "TghosptlController.h"
#import "DatePickView.h"


@interface orderViewController ()<UITextFieldDelegate,GetSelectedDateDelegate,UIActionSheetDelegate>
{
    //下拉菜单
    UIActionSheet *typeActionSheet;
}

@property(strong,nonatomic)UIButton *btnBack;
@property(strong,nonatomic)UITextView *remarkView;

@end


@implementation orderViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航栏
    self.navigationItem.title = @"预约陪诊";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStyleDone target:self action:@selector(leftButton)];
    [self.navigationItem.leftBarButtonItem setTitle:@"返回"];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStyleDone target:self action:@selector(rightbutton)];
    [self.navigationItem.rightBarButtonItem setTitle:@"服务说明"];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor redColor]];
    
    self.orderview= [[orderView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:self.orderview];
    //Return回收键盘
    self.orderview.txtfdContact.delegate = self;
    self.orderview.txtfdPatient.delegate = self;
    self.orderview.txtfdPhone.delegate = self;
    
    //设置目标医院后的隐形按钮
    UIButton *TgHospbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    TgHospbtn.frame = CGRectMake(self.orderview.lblHospital.left, self.orderview.lblHospital.top, FIXWIDTHORHEIGHT(255), FIXWIDTHORHEIGHT(30));
    [self.orderview.imgvwInfo addSubview:TgHospbtn];
    [TgHospbtn addTarget:self action:@selector(TghosptilAtion) forControlEvents:UIControlEventTouchUpInside];
    //设置时间选择的隐形按钮
    UIButton *showTimebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showTimebtn.frame = CGRectMake(self.orderview.lblTime.left, self.orderview.lblTime.top, FIXWIDTHORHEIGHT(255), FIXWIDTHORHEIGHT(30));
    [self.orderview.imgvwInfo addSubview:showTimebtn];
    [showTimebtn addTarget:self action:@selector(showTimebtn) forControlEvents:UIControlEventTouchUpInside];
    //设置备注说明的隐形按钮
    UIButton *remarkbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    remarkbtn.frame = CGRectMake(self.orderview.lblRemark.left, self.orderview.lblRemark.top, FIXWIDTHORHEIGHT(255), FIXWIDTHORHEIGHT(30));
    [self.orderview.imgvwInfo addSubview:remarkbtn];
    [remarkbtn addTarget:self action:@selector(remarkbtn) forControlEvents:UIControlEventTouchUpInside];
    
    //设置服务类型的隐形按钮
    UIButton *typebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    typebtn.frame = CGRectMake(self.orderview.lblSevtype.left, self.orderview.lblSevtype.top, FIXWIDTHORHEIGHT(255), FIXWIDTHORHEIGHT(30));
    [self.orderview.imgvwType addSubview:typebtn];
    [typebtn addTarget:self action:@selector(typebtn) forControlEvents:UIControlEventTouchUpInside];
    
    //设置发布需求按钮
    UIButton *releasebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.orderview.scrollView addSubview:releasebtn];
    [releasebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.orderview);
        make.bottom.equalTo(self.orderview.lblPrompt).with.offset(FIXWIDTHORHEIGHT(50));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(40)));
    }];
    releasebtn.frame = CGRectMake(self.orderview.lblPrompt.left, self.orderview.lblPrompt.bottom+FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(255), FIXWIDTHORHEIGHT(30));
    [releasebtn setTitle:@"发布需求" forState:UIControlStateNormal];
    releasebtn.backgroundColor = RGBCOLOR(220, 10, 12);
    releasebtn.layer.cornerRadius = FIXWIDTHORHEIGHT(20);
    [releasebtn addTarget:self action:@selector(releasebtn) forControlEvents:UIControlEventTouchUpInside];
    
}

//按钮选择医院进入下一页面
-(void)TghosptilAtion
{
    TghosptlController *targetHospital = [[TghosptlController alloc] init];
    [self.navigationController pushViewController:targetHospital animated:YES];
}
//设置时间选择器的按钮
-(void)showTimebtn
{
    DatePickView *datepick = [[DatePickView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    datepick.delegate = self;
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 这里是用大写的 H
    NSDate *selectDate = [dateFormatter dateFromString:self.orderview.lbltimetxt.text];
    datepick.SelectedDate = selectDate;
    [self.view addSubview:datepick];
}
-(void)GetSelectedDate:(DatePickView *)datepickview string:(NSString *)string
{
    self.orderview.lbltimetxt.text = string;
}
//备注说明的按钮
-(void)remarkbtn
{
    
    //黑色背景
    self.btnBack = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.orderview.frame.size.width, self.orderview.frame.size.height)];
    [self.btnBack addTarget:self action:@selector(returnKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    self.btnBack.backgroundColor = RGBACOLOR(0, 0, 0, 0.6);
    [self.orderview addSubview:self.btnBack];
    
    UIView *txtView = [[UIView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(160), FIXWIDTHORHEIGHT(270), FIXWIDTHORHEIGHT(150))];
    txtView.backgroundColor = [UIColor whiteColor];
    [self.btnBack addSubview:txtView];
    //文本textView
    self.remarkView = [[UITextView alloc] init];
    [txtView addSubview:self.remarkView];
//    self.remarkView.backgroundColor = [UIColor cyanColor];
    [self.remarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(txtView);
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(245), FIXWIDTHORHEIGHT(125)));
    }];
    
    //取消按钮
    UIButton *btnCancel = [[UIButton alloc]initWithFrame:CGRectMake(txtView.frame.origin.x, txtView.bottom, txtView.frame.size.width/2, 44)];
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [btnCancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnCancel.backgroundColor = [UIColor whiteColor];
    [btnCancel addTarget:self action:@selector(CancelText) forControlEvents:UIControlEventTouchUpInside];
    btnCancel.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    btnCancel.layer.borderWidth = 0.5;
    [self.btnBack addSubview:btnCancel];
    
    //确定按钮
    UIButton *btnSure = [[UIButton alloc]initWithFrame:CGRectMake(btnCancel.right, txtView.bottom, txtView.frame.size.width/2, 44)];
    [btnSure setTitle:@"确定" forState:UIControlStateNormal];
    [btnSure setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnSure.backgroundColor = [UIColor whiteColor];
    [btnSure addTarget:self action:@selector(SureText) forControlEvents:UIControlEventTouchUpInside];
    btnSure.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    btnSure.layer.borderWidth = 0.5;
    [self.btnBack addSubview:btnSure];

}

//设置服务类型
-(void)typebtn
{
    //在这里呼出下方菜单按钮项
    typeActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles: @"普通（100元/小时）", @"专业（150元/小时）",@"VIP（200元/小时）", nil];
    
    [typeActionSheet showInView:self.orderview];
    NSLog(@"服务类型");
}
// UIActionSheet  点击按钮触发的方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 8_3)
{
    //呼出的菜单按钮点击后的响应
    if (buttonIndex == typeActionSheet.cancelButtonIndex)
    {
        NSLog(@"取消");
    }
    else if (buttonIndex == 0){
        self.orderview.lbltype.text = @"普通（100元/小时）";
        self.orderview.lblmoney.text = @"200";
        self.orderview.lblnumber.text = @"2.0";
    }
    else if (buttonIndex == 1){
        self.orderview.lbltype.text = @"专业（150元/小时）";
        self.orderview.lblmoney.text = @"300";
        self.orderview.lblnumber.text = @"2.0";
    }
    else if (buttonIndex == 2){
        self.orderview.lbltype.text = @"VIP（200元/小时）";
        self.orderview.lblmoney.text = @"400";
        self.orderview.lblnumber.text = @"2.0";
    }
}
//设置备注说明的三个函数
-(void)returnKeyBoard
{
    [self.remarkView resignFirstResponder];
}
- (void)CancelText
{
    [self.btnBack removeFromSuperview];
}
- (void)SureText
{
    self.orderview.lblremktxt.text = self.remarkView.text;
    [self.btnBack removeFromSuperview];
}
//下面的发布需求按钮
-(void)releasebtn
{
    if (self.orderview.txtfdPatient.text.length != 0) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeInterface" object:@"yes"];
        [self dismissViewControllerAnimated:YES completion:^{
            //实现协议 传orderview 给MainMapViewController
            [self.myDelegate sendMessage:self.orderview];
        }];
        return;
        NSLog(@"发布请求");
    }
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入就医者姓名" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}

//模态返回方法
-(void)leftButton
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//服务说明按钮方法
-(void)rightbutton
{
    ServeInstrutionController *serveInstrution = [[ServeInstrutionController alloc] init];
   
    [self.navigationController presentViewController:serveInstrution animated:YES completion:^{
        
    }];
}
//点击return回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.orderview.txtfdContact resignFirstResponder];
    [self.orderview.txtfdPatient resignFirstResponder];
    [self.orderview.txtfdPhone resignFirstResponder];
    return YES;
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
