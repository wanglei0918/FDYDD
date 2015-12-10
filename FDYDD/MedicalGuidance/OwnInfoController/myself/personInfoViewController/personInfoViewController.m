//
//  personInfoViewController.m
//  FDYDD
//
//  Created by fdkj0002 on 15/12/8.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "personInfoViewController.h"
#import "DatePickView.h"
@interface personInfoViewController ()<GetSelectedDateDelegate>
@property(nonatomic,strong)UIImageView * icon;
@property(nonatomic,strong)UIButton * iconBtn;
@property(nonatomic,strong)UILabel * nameLable;
@property(nonatomic,strong)UILabel * birthDisplay;
@property(nonatomic,strong)UILabel * districtDisplay;
@property(nonatomic,assign)BOOL sexState;//1 代表男   0代表女


@end

@implementation personInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(235, 235, 244);
    
    [self configPersonInfoUI];
    
}

#pragma mark --
#pragma mark 初始化UI
-(void)configPersonInfoUI{
//    标题
    UILabel * titleLable = [[UILabel alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(140), FIXWIDTHORHEIGHT(40))];
    titleLable.text = @"个人资料";
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.textColor = [UIColor redColor];
    [self.view addSubview:titleLable];
    
//   创建视图盛放头像及名字
    
    UIImageView * bgView = [[UIImageView alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(titleLable.frame.origin.y + titleLable.frame.size.height), FIXWIDTHORHEIGHT(SCREEN_WIDTH - 10), FIXWIDTHORHEIGHT(100))];
    bgView.image = [UIImage imageNamed:@"bg-7"];
    bgView.userInteractionEnabled = YES;
    [self.view addSubview:bgView];
    //头像
    _iconBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _iconBtn.frame = CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(80));
    [_iconBtn setBackgroundImage:[UIImage imageNamed:@"me1"] forState:UIControlStateNormal];
    [_iconBtn setBackgroundImage:[UIImage imageNamed:@"me1"] forState:UIControlStateHighlighted];
    [_iconBtn addTarget:self action:@selector(iconBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:_iconBtn];
    //名字
    
    UILabel * nameLable = [[UILabel alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(_iconBtn.frame.origin.x + _iconBtn.frame.size.width + 20), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(60))];
    nameLable.text = @"刘诺一";
    nameLable.textAlignment = NSTextAlignmentCenter;
    nameLable.font = [UIFont systemFontOfSize:20];
    _nameLable = nameLable;
    [bgView addSubview:nameLable];
    
    UIButton * nameBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    nameBtn.frame = CGRectMake(FIXWIDTHORHEIGHT(_iconBtn.frame.origin.x + _iconBtn.frame.size.width + 20), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(60));
    [bgView addSubview:nameBtn];
    [nameBtn addTarget:self action:@selector(nameChangeBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView * small = [[UIImageView alloc]init];
    small.image = [UIImage imageNamed:@"more"];
    [bgView addSubview:small];
    [small mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.right.equalTo(bgView).with.offset(FIXWIDTHORHEIGHT(-15));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(20)));
    }];
    
    //创建视图盛放性别、号码、生日、地区
    UIImageView * bgViewTwo = [[UIImageView alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(bgView.frame.origin.y + bgView.frame.size.height + 5), FIXWIDTHORHEIGHT(SCREEN_WIDTH - 10), FIXWIDTHORHEIGHT(220))];
    bgViewTwo.image = [UIImage imageNamed:@"bg-7"];
    [self.view addSubview:bgViewTwo];
    bgViewTwo.userInteractionEnabled = YES;
    int margin = 20,fontSise = 20;
    
    //性别
    UIView * sexView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width), FIXWIDTHORHEIGHT(54))];
//    sexView.backgroundColor = [UIColor redColor];
    [bgViewTwo addSubview:sexView];
    
    UILabel * sexLabel = [[UILabel alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(margin), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(34))];
    sexLabel.text = @"性别";
    sexLabel.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    sexLabel.textAlignment = NSTextAlignmentCenter;
    [sexView addSubview:sexLabel];
    //未选中状态 男
    UIButton * Ybtn = [UIButton buttonWithType:UIButtonTypeCustom];
    Ybtn.frame = CGRectMake(FIXWIDTHORHEIGHT(sexLabel.frame.origin.x + sexLabel.frame.size.width + 40), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(14), FIXWIDTHORHEIGHT(14));
    [Ybtn setBackgroundImage:[UIImage imageNamed:@"noSelected"] forState:UIControlStateNormal];
    [sexView addSubview:Ybtn];
    Ybtn.tag = 10000;
    
    //选中状态 男
    UIButton * YbtnN = [UIButton buttonWithType:UIButtonTypeCustom];
    YbtnN.frame = CGRectMake(FIXWIDTHORHEIGHT(sexLabel.frame.origin.x + sexLabel.frame.size.width + 40), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(14), FIXWIDTHORHEIGHT(14));
    [YbtnN setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [sexView addSubview:YbtnN];
    YbtnN.hidden = YES;
    YbtnN.tag = 10001;
    [Ybtn addTarget:self action:@selector(sexChangeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [YbtnN addTarget:self action:@selector(sexChangeBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * Ylable = [[UILabel alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(Ybtn.frame.origin.x + Ybtn.frame.size.width + 5), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(34))];
    Ylable.text = @"男";
    Ylable.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    Ylable.textAlignment = NSTextAlignmentCenter;
    [sexView addSubview:Ylable];
   //未选中状态  女
    UIButton * Xbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    Xbtn.frame = CGRectMake(FIXWIDTHORHEIGHT(Ylable.frame.origin.x + Ylable.frame.size.width + 40), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(14), FIXWIDTHORHEIGHT(14));
    [Xbtn setBackgroundImage:[UIImage imageNamed:@"noSelected"] forState:UIControlStateNormal];
    [sexView addSubview:Xbtn];
   //选中状态   女
    UIButton * XbtnN = [UIButton buttonWithType:UIButtonTypeCustom];
    XbtnN.frame = CGRectMake(FIXWIDTHORHEIGHT(Ylable.frame.origin.x + Ylable.frame.size.width + 40), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(14), FIXWIDTHORHEIGHT(14));
    [XbtnN setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    [sexView addSubview:XbtnN];
    XbtnN.hidden = YES;
    Xbtn.tag = 10002;
    XbtnN.tag = 10003;
    [Xbtn addTarget:self action:@selector(sexChangeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [XbtnN addTarget:self action:@selector(sexChangeBtn:) forControlEvents:UIControlEventTouchUpInside];

    
    UILabel * Xlable = [[UILabel alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(Xbtn.frame.origin.x + Xbtn.frame.size.width + 5), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(34))];
    Xlable.text = @"女";
    Xlable.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    Xlable.textAlignment = NSTextAlignmentCenter;
    [sexView addSubview:Xlable];
    
    // 联系
    UIView * contactView = [[UIView alloc]initWithFrame:CGRectMake(0, FIXWIDTHORHEIGHT(55 * 1), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width), FIXWIDTHORHEIGHT(54))];
    [bgViewTwo addSubview:contactView];
    
    UILabel * contactLable = [[UILabel alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(margin), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(34))];
    contactLable.text = @"联系方式";
    contactLable.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    [contactView addSubview:contactLable];
    UILabel * numberLable = [[UILabel alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(contactLable.frame.origin.x + contactLable.frame.size.width + 15), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(34))];
    
    numberLable.text = @"18612344321";
    numberLable.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    [contactView addSubview:numberLable];
    
    /*判断手机型号 改变间隔*/
    int wth = 0;
    if (iPHone6 || iPHone6Plus) {
        wth = - 6;
    }
    
    //生日
    UIView * birthView = [[UIView alloc]initWithFrame:CGRectMake(0, FIXWIDTHORHEIGHT(55 * 2), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width), FIXWIDTHORHEIGHT(54))];
    [bgViewTwo addSubview:birthView];
    UILabel * birthLable = [[UILabel alloc]init];
    birthLable.text = @"生日";
    birthLable.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    [birthView addSubview:birthLable];
    [birthLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(birthView).with.offset(wth);
        make.left.equalTo(bgViewTwo).with.offset(FIXWIDTHORHEIGHT(margin));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(34)));
    }];

    //小箭头
    UIImageView * birthImage = [[UIImageView alloc]init];
    birthImage.image = [UIImage imageNamed:@"more"];
    [birthView addSubview:birthImage];
    [birthImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(birthView).with.offset(wth);
        make.right.equalTo(bgViewTwo).with.offset(FIXWIDTHORHEIGHT(-15));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(20)));
    }];
    
    //生日显示
    UILabel * birthDisplay = [[UILabel alloc]init];
    [birthView addSubview:birthDisplay];
    [birthDisplay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(birthLable.mas_right).with.offset(10);
        make.right.equalTo(birthImage).with.offset(-10);
        make.centerY.equalTo(birthView).with.offset(wth);
        make.height.equalTo(@FIXWIDTHORHEIGHT(34));
    }];
    birthDisplay.text = @"1983-12-12";
    birthDisplay.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    self.birthDisplay = birthDisplay;
    
    //生日选择按钮及事件
    UIButton * birthBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    birthBtn.frame = CGRectMake(0, FIXWIDTHORHEIGHT(55 * 2), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width), FIXWIDTHORHEIGHT(54));
    [bgViewTwo addSubview:birthBtn];
    [birthBtn addTarget:self action:@selector(chooseBirthDay) forControlEvents:UIControlEventTouchUpInside];
    
    //地区
    UIView * districtView = [[UIView alloc]initWithFrame:CGRectMake(0, FIXWIDTHORHEIGHT(55 * 3), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width), FIXWIDTHORHEIGHT(55))];
    [bgViewTwo addSubview:districtView];
    
    UILabel * districtLable = [[UILabel alloc]init];
    districtLable.text = @"地区";
    districtLable.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    [districtView addSubview:districtLable];
    [districtLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(districtView).with.offset(wth);
        make.left.equalTo(bgViewTwo).with.offset(FIXWIDTHORHEIGHT(margin));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(34)));
    }];
    
    //小箭头
    UIImageView * districtImage = [[UIImageView alloc]init];
    districtImage.image = [UIImage imageNamed:@"more"];
    [districtView addSubview:districtImage];
    [districtImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(districtView).with.offset(wth);
        make.right.equalTo(bgViewTwo).with.offset(FIXWIDTHORHEIGHT(-15));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(20)));
    }];
    
    //地区显示
    UILabel * districtDisplay = [[UILabel alloc]init];
    [districtView addSubview:districtDisplay];
    [districtDisplay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(districtLable.mas_right).with.offset(10);
        make.right.equalTo(districtImage).with.offset(-10);
        make.centerY.equalTo(districtView).with.offset(wth);
        make.height.equalTo(@FIXWIDTHORHEIGHT(34));
    }];
    districtDisplay.text = @"浙江省 杭州市 滨江区";
    districtDisplay.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(fontSise)];
    self.districtDisplay = districtDisplay;
    
    //地区选择按钮及相关事件
    UIButton * districtBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    districtBtn.frame = CGRectMake(0, FIXWIDTHORHEIGHT(55 * 3), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width), FIXWIDTHORHEIGHT(55));
    [bgViewTwo addSubview:districtBtn];
    [districtBtn addTarget:self action:@selector(chooseDistrict) forControlEvents:UIControlEventTouchUpInside];
    
    //创建三条分割线
    if (iPHone6Plus||iPHone6) {
        int width = 68;
        if (iPHone6) {
            width = 63;
        }
        
        UIView * viewOne = [[UIView alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width - 40), FIXWIDTHORHEIGHT(1))];
        viewOne.backgroundColor = RGBCOLOR(235, 235, 243);
        [bgViewTwo addSubview:viewOne];
        
        UIView * viewTwo = [[UIView alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(50 + width), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width - 40), FIXWIDTHORHEIGHT(1))];
        viewTwo.backgroundColor = RGBCOLOR(235, 235, 243);
        [bgViewTwo addSubview:viewTwo];
        
        UIView * viewThree = [[UIView alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(50 + width + width), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width - 40), FIXWIDTHORHEIGHT(1))];
        viewThree.backgroundColor = RGBCOLOR(235, 235, 243);
        [bgViewTwo addSubview:viewThree];

    }else{
        
        for (int i = 0 ; i < 3; i ++) {
            UIView * view = [[UIView alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(54 + i * 55), FIXWIDTHORHEIGHT(bgViewTwo.frame.size.width - 40), FIXWIDTHORHEIGHT(1))];
            view.backgroundColor = RGBCOLOR(235, 235, 243);
            [bgViewTwo addSubview:view];
        }
        
    }
    
    //退出账号按钮
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.backgroundColor = [UIColor redColor];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn setTitle:@"退出账号" forState:UIControlStateNormal];
    backBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    backBtn.titleLabel.font = [UIFont boldSystemFontOfSize:FIXWIDTHORHEIGHT(20)];
    backBtn.layer.cornerRadius = 20;
    backBtn.layer.masksToBounds = YES;
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(quitClicked) forControlEvents:UIControlEventTouchUpInside];
    __block UIView * blockSelf = self.view;
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.bottom.equalTo(blockSelf).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(280), FIXWIDTHORHEIGHT(40)));
    }];
}
#pragma mark--
#pragma mark 数据请求

#pragma mark--
#pragma mark 数据加载

#pragma mark--
#pragma mark 事件
-(void)sexChangeBtn:(UIButton *)btn{
    
    UIButton * Ybtn = (UIButton *)[self.view viewWithTag:10000];
    UIButton * YbtnN = (UIButton *)[self.view viewWithTag:10001];
    UIButton * Xbtn = (UIButton *)[self.view viewWithTag:10002];
    UIButton * XbtnN = (UIButton *)[self.view viewWithTag:10003];
    switch (btn.tag) {
        case 10000://男
            Ybtn.hidden = YES;
            YbtnN.hidden = NO;
            Xbtn.hidden = NO;
            XbtnN.hidden = YES;
            _sexState = 1;
            break;
         case 10001://女
            Ybtn.hidden = NO;
            YbtnN.hidden = YES;
            Xbtn.hidden = YES;
            XbtnN.hidden = NO;
            _sexState = 0;
            break;
        case 10002://女
            Ybtn.hidden = NO;
            YbtnN.hidden = YES;
            Xbtn.hidden = YES;
            XbtnN.hidden = NO;
            _sexState = 0;
            break;
        case 10003://男
            Ybtn.hidden = YES;
            YbtnN.hidden = NO;
            Xbtn.hidden = NO;
            XbtnN.hidden = YES;
            _sexState = 1;
            break;
        default:
            break;
    }
    
    if (_sexState) {
        NSLog(@"选择性别 性别为男");
    }else{
        NSLog(@"选择性别 性别为女");
    }
}
-(void)iconBtnClicked{
    NSLog(@"更换头像");
}
-(void)quitClicked{
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"退出");
}
-(void)chooseBirthDay{
    
    NSLog(@"生日选择");
    DatePickView *datepick = [[DatePickView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    datepick.delegate = self;
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 这里是用大写的 H
    NSDate *selectDate = [dateFormatter dateFromString:@"2015年11月23号 上午"];
    datepick.SelectedDate = selectDate;
    [self.view addSubview:datepick];

}
-(void)chooseDistrict{
    NSLog(@"选择地区");
}
-(void)nameChangeBtnClicked{
    NSLog(@"更改名字");
    nameChangeViewController * changeName = [[nameChangeViewController alloc]init];
    changeName.delegate = self;
    changeName.name = _nameLable.text;
    [self.navigationController pushViewController:changeName animated:YES];
}
#pragma mark--
#pragma mark  代理
//时间选择代理
-(void)GetSelectedDate:(DatePickView *)datepickview string:(NSString *)string{
    
    _birthDisplay.text = [[string componentsSeparatedByString:@" "]firstObject];
    
}
//实现改变名字代理方法
-(void)backNameString:(NSString *)name{
    _nameLable.text = name;
}
#pragma mark--
#pragma mark 通知注册及销毁





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
