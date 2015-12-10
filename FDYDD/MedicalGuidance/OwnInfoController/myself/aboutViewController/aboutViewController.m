//
//  aboutViewController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "aboutViewController.h"

@interface aboutViewController ()



@end

@implementation aboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(235, 235, 244);
    
    
    UILabel *lbltitle = [[UILabel alloc] init];
    [self.view addSubview:lbltitle];
    [lbltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(25));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(30)));
    }];
    lbltitle.text = @"关于布袋医仕";
    [lbltitle setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(15)]];
    lbltitle.textAlignment = NSTextAlignmentCenter;
    lbltitle.textColor = RGBCOLOR(216, 65, 72);
    
    [self UIinterface];


}
//界面设置
-(void)UIinterface
{
    //评价下的第一个base图
    UIImageView *imgEvaluate = [[UIImageView alloc] initWithFrame:CGRectMake(0, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(320), FIXWIDTHORHEIGHT(40))];
    imgEvaluate.image = [UIImage imageNamed:@"bg-12"];
    [self.view addSubview:imgEvaluate];
   //版权下的第一个base图
    UIImageView *imgAbout = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(5), imgEvaluate.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(120))];
    imgAbout.image = [UIImage imageNamed:@"bg-2"];
    [self.view addSubview:imgAbout];
    //二维码下的第一个base图
    UIImageView *imgQRcode = [[UIImageView alloc] initWithFrame:CGRectMake(0, imgAbout.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(320), FIXWIDTHORHEIGHT(240))];
    imgQRcode.image = [UIImage imageNamed:@"bg-16"];
    [self.view addSubview:imgQRcode];
    
    //给我评价
    UILabel *lblevaluate = [[UILabel alloc] init];
    [imgEvaluate addSubview:lblevaluate];
    [lblevaluate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imgEvaluate);
        make.left.equalTo(imgEvaluate).with.offset(FIXWIDTHORHEIGHT(20));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(25)));
    }];
    lblevaluate.text = @"给我评价";
    lblevaluate.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    
    
    //灰色小箭头
    UIImageView *imgarr = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(11), FIXWIDTHORHEIGHT(13), FIXWIDTHORHEIGHT(13))];
   // imgarr.backgroundColor = [UIColor lightGrayColor];
    imgarr.image = [UIImage imageNamed:@"more"];
    [imgEvaluate addSubview:imgarr];
    
    for (int i = 0; i < 3; i++) {
    UIImageView *imgarrow = [[UIImageView alloc] initWithFrame:CGRectMake(imgarr.left-FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(13)+i*FIXWIDTHORHEIGHT(38), FIXWIDTHORHEIGHT(13), FIXWIDTHORHEIGHT(13))];
        imgarrow.image = [UIImage imageNamed:@"more"];
        [imgAbout addSubview:imgarrow];
    }
    
    //版权信息、许可协议、关于我们
    UILabel *lblcopyright = [[UILabel alloc] init];
    UILabel *lblallow = [[UILabel alloc] init];
    UILabel *lblabout = [[UILabel alloc] init];
    [imgAbout addSubview:lblcopyright];
    [imgAbout addSubview:lblallow];
    [imgAbout addSubview:lblabout];
    
    //lbl距离左侧、上下间距及尺寸大小
    int rangeleft = FIXWIDTHORHEIGHT(15);
    int rangetop = FIXWIDTHORHEIGHT(12);
    CGSize size = CGSizeMake(FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(25));
    
    [lblcopyright mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgAbout).with.offset(rangeleft);
        make.top.equalTo(imgAbout).with.offset(FIXWIDTHORHEIGHT(10));
        make.size.mas_equalTo(size);
    }];
    lblcopyright.text = @"版权信息";
    lblcopyright.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    
    [lblallow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgAbout).with.offset(rangeleft);
        make.top.equalTo(lblcopyright.mas_bottom).with.offset(rangetop);
        make.size.mas_equalTo(size);
    }];
    lblallow.text = @"软件许可协议";
    lblallow.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    
    [lblabout mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgAbout).with.offset(rangeleft);
        make.top.equalTo(lblallow.mas_bottom).with.offset(rangetop);
        make.size.mas_equalTo(size);
    }];
    lblabout.text = @"关于我们";
    lblabout.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];

    //灰色的线
    for (int i = 0; i < 2; i++) {
        UIImageView *imgline = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(40)+i*FIXWIDTHORHEIGHT(37), FIXWIDTHORHEIGHT(285), 1)];
        imgline.backgroundColor = RGBCOLOR(233, 234, 235);
        [imgAbout addSubview:imgline];
    }
    
    //分享二维码、二维码及版本号
    UILabel *lblshare = [[UILabel alloc] init];
    UIImageView *imgQR = [[UIImageView alloc] init];
    UILabel *lblversion = [[UILabel alloc] init];
    [imgQRcode addSubview:lblshare];
    [imgQRcode addSubview:imgQR];
    [imgQRcode addSubview:lblversion];
    
    [lblshare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imgQRcode);
        make.top.equalTo(imgQRcode).with.offset(FIXWIDTHORHEIGHT(20));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(120), 25));
    }];
    lblshare.text = @"分享二维码给朋友";
    lblshare.textAlignment = NSTextAlignmentCenter;
    lblshare.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    
    [imgQR mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imgQRcode);
         make.top.equalTo(lblshare.mas_bottom).with.offset(FIXWIDTHORHEIGHT(10));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(120), FIXWIDTHORHEIGHT(120)));
    }];
    imgQR.backgroundColor = [UIColor lightGrayColor];
    
    [lblversion mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(imgQRcode);
        make.top.equalTo(imgQR.mas_bottom).with.offset(FIXWIDTHORHEIGHT(10));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(120), 25));
    }];
    lblversion.text = @"当前版本V1.0";
    lblversion.textAlignment = NSTextAlignmentCenter;
    lblversion.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController popViewControllerAnimated:YES];
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
