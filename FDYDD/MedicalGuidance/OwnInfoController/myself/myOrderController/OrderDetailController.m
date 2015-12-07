//
//  OrderDetailController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/12/2.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "OrderDetailController.h"

@interface OrderDetailController ()

@property(strong,nonatomic)UILabel *lblTitle;
@property(strong,nonatomic)UILabel *lblArchive;

@end

@implementation OrderDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(235, 235, 243);
    

    [self UIInterface];
}
//设置界面
-(void)UIInterface
{
    //详情页面的标题
    self.lblTitle = [[UILabel alloc] init];
    [self.view addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(30));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(30)));
    }];
    [self.lblTitle setTextColor:RGBCOLOR(231, 119, 119)];
    self.lblTitle.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(17)];
    self.lblTitle.text = @"陪诊订单";
    //右侧的按钮
    self.lblArchive = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(80),FIXWIDTHORHEIGHT(30))];
    [self.view addSubview:self.lblArchive];
    [self.lblArchive setTextColor:RGBCOLOR(231, 119, 119)];
    self.lblArchive.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(17)];
    self.lblArchive.text = @"健康档案";
    
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(70), FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(5)*2, FIXWIDTHORHEIGHT(350))];
    baseView.layer.cornerRadius = 5;
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];
    
    //此页面的logo
    UIImageView *imgLogo = [[UIImageView alloc] init];
    [self.view addSubview:imgLogo];
    imgLogo.image = [UIImage imageNamed:@"logo2"];
    
    if (iPHone4oriPHone4s) {
        UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, self.view.width, 410)];
        scrollview.contentSize = CGSizeMake(320, 500);
        baseView.top = 0;
        [scrollview addSubview:imgLogo];
        [imgLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(scrollview);
            make.bottom.equalTo(scrollview).with.offset(460);
            make.size.mas_equalTo(CGSizeMake(60, 75));
        }];
        [self.view addSubview:scrollview];
        [scrollview addSubview:imgLogo];
        [scrollview addSubview:baseView];
    }else{
        [imgLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(-20));
            make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(75)));
        }];
    }
    
    //设置订单状态lbl和img
    UIImageView *imgvwStaus = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(30))];
    imgvwStaus.image = [UIImage imageNamed:@"orderover"];
    [baseView addSubview:imgvwStaus];
    self.lblstaus = [[UILabel alloc] initWithFrame:CGRectMake(imgvwStaus.right+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(30))];
    [baseView addSubview:self.lblstaus];
    self.lblstaus.text = @"已完成";
    [self.lblstaus setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    
    //设置联系人
    UIImageView *imgvwCont = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), imgvwStaus.bottom+FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    imgvwCont.image = [UIImage imageNamed:@"contact"];
    [baseView addSubview:imgvwCont];
    self.lblCont = [[UILabel alloc] initWithFrame:CGRectMake(imgvwCont.right+FIXWIDTHORHEIGHT(5), imgvwCont.top, FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(25))];
    [self.lblCont setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    self.lblCont.text = @"联系人:";
    [baseView addSubview:self.lblCont];
    self.lblContxt = [[UILabel alloc] initWithFrame:CGRectMake(self.lblCont.right, self.lblCont.top, FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(25))];
     self.lblContxt.text = @"陈某某";
    [self.lblContxt setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    [baseView addSubview:self.lblContxt];
    
    //设置电话label
    self.lblContPhone = [[UILabel alloc] initWithFrame:CGRectMake(imgvwCont.right+FIXWIDTHORHEIGHT(5), self.lblCont.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(25))];
    self.lblContPhone.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [baseView addSubview:self.lblContPhone];
    self.lblContPhone.text = @"电   话:";
    self.lblPhone = [[UILabel alloc] initWithFrame:CGRectMake(self.lblContPhone.right+2, self.lblContPhone.top, FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(25))];
    self.lblPhone.text = @"18812345678";
    self.lblPhone.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [baseView addSubview:self.lblPhone];
    

    
    
    //目标医院
    UIImageView *imgvwHospl = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), self.lblPhone.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    imgvwHospl.image = [UIImage imageNamed:@"hospital"];
    [baseView addSubview:imgvwHospl];
    self.lblHospital = [[UILabel alloc] initWithFrame:CGRectMake(imgvwHospl.right+FIXWIDTHORHEIGHT(5), imgvwHospl.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    self.lblHospital.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [baseView addSubview:self.lblHospital];
    self.lblHospital.text = @"目标医院:";
    self.lblhosptxt = [[UILabel alloc] initWithFrame:CGRectMake(self.lblHospital.right+5, self.lblHospital.top, FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(25))];
    self.lblhosptxt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblhosptxt.text = @"杭州市第一人民医院";
    [baseView addSubview:self.lblhosptxt];
    
    //设置就医人姓名
    self.lblPatient = [[UILabel alloc] initWithFrame:CGRectMake(imgvwHospl.right+FIXWIDTHORHEIGHT(5), self.lblHospital.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    [baseView addSubview:self.lblPatient];
    self.lblPatient.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblPatient.text = @"就医人:";
    self.lblPatxt = [[UILabel alloc] initWithFrame:CGRectMake(self.lblPatient.right+2, self.lblPatient.top, FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(25))];
    self.lblPatxt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblPatxt.text = @"布袋医士";
    [baseView addSubview:self.lblPatxt];
    
    //起始时间
    UIImageView *imgvwTime = [[UIImageView alloc] initWithFrame:CGRectMake(imgvwHospl.left, self.lblPatxt.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
        imgvwTime.image = [UIImage imageNamed:@"service"];
        [baseView addSubview:imgvwTime];
    
    UILabel *lblstar = [[UILabel alloc] initWithFrame:CGRectMake(imgvwTime.right+FIXWIDTHORHEIGHT(5), imgvwTime.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    [lblstar setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    lblstar.text = @"开始时间:";
    [baseView addSubview:lblstar];
    self.lblTimestar = [[UILabel alloc] initWithFrame:CGRectMake(lblstar.right+2, lblstar.top, FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(25))];
    self.lblTimestar.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblTimestar.text = @"2015年9月15号 上午10点";
    [baseView addSubview:self.lblTimestar];
    
    UILabel *lblend = [[UILabel alloc] initWithFrame:CGRectMake(imgvwTime.right+FIXWIDTHORHEIGHT(5), lblstar.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    [lblend setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    lblend.text = @"结束时间:";
    [baseView addSubview:lblend];
    self.lblTimeend = [[UILabel alloc] initWithFrame:CGRectMake(lblend.right+2, lblend.top, FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(25))];
    self.lblTimeend.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblTimeend.text = @"2015年9月15号 下午3点";
    [baseView addSubview:self.lblTimeend];
    
    
    //服务类型
    UIImageView *imgvwPay = [[UIImageView alloc] initWithFrame:CGRectMake(imgvwHospl.left, self.lblTimeend.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    imgvwPay.image = [UIImage imageNamed:@"pay"];
    [baseView addSubview:imgvwPay];

    UILabel *lbltype = [[UILabel alloc] initWithFrame:CGRectMake(imgvwPay.right+FIXWIDTHORHEIGHT(5), imgvwPay.top, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(25))];
    [lbltype setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    lbltype.text = @"服务类型:";
    [baseView addSubview:lbltype];
    self.lbltypetxt = [[UILabel alloc] initWithFrame:CGRectMake(lbltype.right+2, lbltype.top, FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(25))];
    self.lbltypetxt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lbltypetxt.text = @"中等";
    [baseView addSubview:self.lbltypetxt];
    
    
    //评分lbl
    self.lblscore = [[UILabel alloc] initWithFrame:CGRectMake(imgvwPay.right+FIXWIDTHORHEIGHT(5), self.lbltypetxt.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    self.lblscore.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblscore.text = @"评分：";
    [baseView addSubview:self.lblscore];
    
    //设置空心评分图
    self.aview = [[UIView alloc]initWithFrame:CGRectMake(self.lblscore.right, self.lblscore.top, FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(25))];
    CGRect frame = self.aview.bounds;
    for (int i = 0; i < 5; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ratingoff@2x_1"]];
        imageView.frame = CGRectMake(i * frame.size.width / 5, 0, frame.size.width / 5, frame.size.height);
        [self.aview addSubview:imageView];
        NSLog(@"创建图片");
    }
    [baseView addSubview:self.aview];
    
     //设置实心评分图
    _ratview = [[RatView alloc] initWithFrame:CGRectMake(self.lblscore.right, self.lblscore.top, FIXWIDTHORHEIGHT(100)*4/5, FIXWIDTHORHEIGHT(25)) numberofstar:4];
    [baseView addSubview:_ratview];
    
    
    
}





-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController popViewControllerAnimated:YES];
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
