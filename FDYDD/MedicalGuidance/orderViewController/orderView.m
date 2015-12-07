//
//  orderView.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/20.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "orderView.h"

@implementation orderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubView];
    }
    return self;
}

-(void)creatSubView
{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    [self addSubview:_scrollView];
    if (iPHone4oriPHone4s) {
        _scrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height+180);
    }else{
        _scrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height+FIXWIDTHORHEIGHT(80));
        
    }
    
    //联系人与就医者的UIImageView
    self.imgvwPerson = [[UIImageView alloc] init];
    [_scrollView addSubview:_imgvwPerson];
    _imgvwPerson.frame = CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(300), FIXWIDTHORHEIGHT(120));
    _imgvwPerson.userInteractionEnabled = YES;
    _imgvwPerson.image = [UIImage imageNamed:@"bg-1"];

    //目标医院下的UIImageView
    self.imgvwInfo = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgvwPerson.left, self.imgvwPerson.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(300), FIXWIDTHORHEIGHT(120))];
    self.imgvwInfo.userInteractionEnabled = YES;
    [_scrollView addSubview:_imgvwInfo];
    _imgvwInfo.image = [UIImage imageNamed:@"bg-3"];
    
    //服务类型下的UIImageView
    self.imgvwType = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgvwInfo.left, self.imgvwInfo.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(300), FIXWIDTHORHEIGHT(140))];
    self.imgvwType.userInteractionEnabled = YES;
    [_scrollView addSubview:_imgvwType];
    _imgvwType.image = [UIImage imageNamed:@"bg-3"];
    
    //服务时长和合计下的UIImageView
    self.imgvwDtn = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgvwType.left, self.imgvwType.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(300), FIXWIDTHORHEIGHT(80))];
    self.imgvwDtn.userInteractionEnabled = YES;
    [_scrollView addSubview:_imgvwDtn];
    _imgvwDtn.image = [UIImage imageNamed:@"bg-1"];

    
    int itlforX = FIXWIDTHORHEIGHT(40);  int itlforY = FIXWIDTHORHEIGHT(5); int width = FIXWIDTHORHEIGHT(60); int high = FIXWIDTHORHEIGHT(30);
    
    //设置联系人
    self.lblCont = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, itlforY, FIXWIDTHORHEIGHT(50), high)];
    self.lblCont.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwPerson addSubview:self.lblCont];
    self.lblCont.text = @"联系人:";
    self.txtfdContact = [[UITextField alloc] initWithFrame:CGRectMake(self.lblCont.right+2, self.lblCont.top, FIXWIDTHORHEIGHT(200), high)];
    self.txtfdContact.placeholder = @"请输入姓名";
    self.txtfdContact.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwPerson addSubview:self.txtfdContact];
    
    
    //设置电话label
    self.lblContPhone = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, self.lblCont.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(50), high)];
    self.lblContPhone.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwPerson addSubview:self.lblContPhone];
    self.lblContPhone.text = @"电    话:";
    self.txtfdPhone = [[UITextField alloc] initWithFrame:CGRectMake(self.lblContPhone.right+2, self.lblContPhone.top, FIXWIDTHORHEIGHT(200), high)];
    self.txtfdPhone.placeholder = @"请输入联系方式";
    self.txtfdPhone.keyboardType = UIKeyboardTypePhonePad;
    self.txtfdPhone.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwPerson addSubview:self.txtfdPhone];
    
    
        //设置就医人姓名
    self.lblPatient = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, self.lblContPhone.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(50), high)];
    [self.imgvwPerson addSubview:self.lblPatient];
    self.lblPatient.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblPatient.text = @"就医人:";
    self.txtfdPatient = [[UITextField alloc] initWithFrame:CGRectMake(self.lblPatient.right+2, self.lblPatient.top, 200*HEIGHT, high)];
    self.txtfdPatient.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.txtfdPatient.placeholder = @"请输入姓名";
    [self.imgvwPerson addSubview:self.txtfdPatient];

    
    //目标医院
    self.lblHospital = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, itlforY, width, high)];
    self.lblHospital.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwInfo addSubview:self.lblHospital];
    self.lblHospital.text = @"目标医院:";
    self.lblhosptxt = [[UILabel alloc] initWithFrame:CGRectMake(self.lblHospital.right+5, self.lblHospital.top, FIXWIDTHORHEIGHT(150), high)];
    self.lblhosptxt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblhosptxt.text = @"杭州市第一人民医院";
    [self.imgvwInfo addSubview:self.lblhosptxt];
    self.imgArrhosp = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(275), FIXWIDTHORHEIGHT(12), FIXWIDTHORHEIGHT(12), FIXWIDTHORHEIGHT(12))];
    [self.imgvwInfo addSubview:self.imgArrhosp];
    self.imgArrhosp.image = [UIImage imageNamed:@"more"];
    
    //每行中的线
    UIImageView *imgline1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.lblHospital.left, self.lblHospital.bottom+FIXWIDTHORHEIGHT(3), FIXWIDTHORHEIGHT(251), 1)];
    imgline1.backgroundColor = RGBCOLOR(233, 234, 235);
    [self.imgvwInfo addSubview:imgline1];

    
    //服务时间
    self.lblTime = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, self.lblHospital.bottom+FIXWIDTHORHEIGHT(5), width, high)];
    self.lblTime.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwInfo addSubview:self.lblTime];
    self.lblTime.text = @"服务时间:";
    self.lbltimetxt = [[UILabel alloc] initWithFrame:CGRectMake(self.lblTime.right+5, self.lblTime.top, FIXWIDTHORHEIGHT(150), high)];
    self.lbltimetxt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lbltimetxt.text = @"2015年11月23号 上午";
    [self.imgvwInfo addSubview:self.lbltimetxt];
    self.imgArrtime = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(275), self.lblTime.top+10, FIXWIDTHORHEIGHT(12), FIXWIDTHORHEIGHT(12))];
    [self.imgvwInfo addSubview:self.imgArrtime];
    self.imgArrtime.image = [UIImage imageNamed:@"more"];
    
    //每行中的线
    UIImageView *imgline2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.lblTime.left, self.lblTime.bottom+FIXWIDTHORHEIGHT(3), FIXWIDTHORHEIGHT(251), 1)];
    imgline2.backgroundColor = RGBCOLOR(233, 234, 235);
    [self.imgvwInfo addSubview:imgline2];
    
    //备注说明
    self.lblRemark = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, self.lblTime.bottom+FIXWIDTHORHEIGHT(5), width, high)];
    self.lblRemark.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwInfo addSubview:self.lblRemark];
    self.lblRemark.text = @"备注说明:";
    self.lblremktxt = [[UILabel alloc] initWithFrame:CGRectMake(self.lblRemark.right+5, self.lblRemark.top, FIXWIDTHORHEIGHT(150), high)];
    self.lblremktxt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblremktxt.text = @"请输入备注事项";
    [self.imgvwInfo addSubview:self.lblremktxt];
    self.imgArrremk = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(275), self.lblRemark.top+10, FIXWIDTHORHEIGHT(12), FIXWIDTHORHEIGHT(12))];
    [self.imgvwInfo addSubview:self.imgArrremk];
    self.imgArrremk.image = [UIImage imageNamed:@"more"];

    
    //服务类型
    self.lblSevtype = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, itlforY, width, high)];
    self.lblSevtype.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwType addSubview:self.lblSevtype];
    self.lblSevtype.text = @"服务类型:";
//    self.lblSevtype.backgroundColor = [UIColor blackColor];
    self.lbltype = [[UILabel alloc] initWithFrame:CGRectMake(self.lblSevtype.right+5, self.lblSevtype.top, FIXWIDTHORHEIGHT(150), high)];
    self.lbltype.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lbltype.text = @"普通（100元/小时）";
    [self.imgvwType addSubview:self.lbltype];
    
    //每行中的线
    UIImageView *imgline3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.lblSevtype.left, self.lblSevtype.bottom+FIXWIDTHORHEIGHT(3), FIXWIDTHORHEIGHT(251), 1)];
    imgline3.backgroundColor =  RGBCOLOR(233, 234, 235);
    [self.imgvwType addSubview:imgline3];
    
    //服务时长 与 合计
    self.lblDtn = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, itlforY, width, high)];
    self.lblDtn.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwDtn addSubview:self.lblDtn];
    self.lblDtn.text = @"服务时长:";
    
    //每行中的线
    UIImageView *imgline4 = [[UIImageView alloc] initWithFrame:CGRectMake(self.lblDtn.left, self.lblDtn.bottom+FIXWIDTHORHEIGHT(3), FIXWIDTHORHEIGHT(251), 1)];
    imgline4.backgroundColor =  RGBCOLOR(233, 234, 235);
    [self.imgvwDtn addSubview:imgline4];
    
    self.lblSum = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, self.lblDtn.bottom+FIXWIDTHORHEIGHT(5 ), 40, high)];
    self.lblSum.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwDtn addSubview:self.lblSum];
    self.lblSum.text = @"合计:";

    //预约陪诊中左侧4个图标
    UIImageView *imgvwIcoA = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20),FIXWIDTHORHEIGHT(20))];
    imgvwIcoA.image = [UIImage imageNamed:@"contact"];
    [self.imgvwPerson addSubview:imgvwIcoA];
    
    UIImageView *imgvwIcoB = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20),FIXWIDTHORHEIGHT(20))];
    imgvwIcoB.image = [UIImage imageNamed:@"hospital"];
    [self.imgvwInfo addSubview:imgvwIcoB];
    
    UIImageView *imgvwIcoC = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20),FIXWIDTHORHEIGHT(20))];
    imgvwIcoC.image = [UIImage imageNamed:@"service"];
    [self.imgvwType addSubview:imgvwIcoC];
    
    UIImageView *imgvwIcoD = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20),FIXWIDTHORHEIGHT(20))];
    imgvwIcoD.image = [UIImage imageNamed:@"pay"];
    [self.imgvwDtn addSubview:imgvwIcoD];
    
    
    
    self.lblPrompt = [[UILabel alloc] initWithFrame:CGRectMake(self.imgvwDtn.left, self.imgvwDtn.bottom+FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(300), FIXWIDTHORHEIGHT(80))];
    self.lblPrompt.numberOfLines = 0;
    self.lblPrompt.text = @"*因服务人员在您之后有其他需要陪护的人员，请根据您的实际需求选择陪护时长。如您选择时长过长，我们会退相应的费用（最多退至起步价）";
    self.lblPrompt.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.scrollView addSubview:self.lblPrompt];
    
    //计时减0.5
    UIButton *minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    minusButton.frame = CGRectMake(FIXWIDTHORHEIGHT(190), self.lblDtn.top+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20));
    [minusButton addTarget:self action:@selector(minusAction) forControlEvents:UIControlEventTouchUpInside];
    [minusButton setImage:[UIImage imageNamed:@"minus-1"] forState:UIControlStateNormal];
    [self.imgvwDtn addSubview:minusButton];
    
     //计时加0.5
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    plusButton.frame = CGRectMake(FIXWIDTHORHEIGHT(275), self.lblDtn.top+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20));
    [plusButton addTarget:self action:@selector(plusAction) forControlEvents:UIControlEventTouchUpInside];
    [plusButton setImage:[UIImage imageNamed:@"plus-1"] forState:UIControlStateNormal];
    [self.imgvwDtn addSubview:plusButton];
    
    self.lblnumber = [[UILabel alloc] initWithFrame:CGRectMake(minusButton.right, minusButton.top, FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(20))];
    self.lblnumber.text = @"2.0";
//    self.lblnumber.backgroundColor = [UIColor cyanColor];
    self.lblnumber.textAlignment = NSTextAlignmentCenter;
     [self.lblnumber setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)]];
    [self.imgvwDtn addSubview:self.lblnumber];
    
    UILabel *lblhour = [[UILabel alloc] initWithFrame:CGRectMake(self.lblnumber.right, plusButton.top, FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(20))];
    lblhour.text = @"小时";
//     lblhour.backgroundColor = [UIColor cyanColor];
    [lblhour setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)]];
    [self.imgvwDtn addSubview:lblhour];

    
    
    self.lblmoney = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(220), self.lblSum.top+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(20))];
    if ([self.lbltype.text isEqualToString:@"普通（100元/小时）"]) {
        self.lblmoney.text = @"200";
    }
    if ([self.lbltype.text isEqualToString:@"专业（150元/小时）"]) {
       self.lblmoney.text = @"300";
    }
    if ([self.lbltype.text isEqualToString:@"VIP（200元/小时）"]) {
       self.lblmoney.text = @"400";
    }
    self.lblmoney.textColor = [UIColor redColor];
    self.lblmoney.textAlignment = NSTextAlignmentCenter;
    [self.imgvwDtn addSubview:self.lblmoney];
    
    self.lblrmb = [[UILabel alloc] initWithFrame:CGRectMake(self.lblmoney.right, self.lblmoney.top, FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(20))];
    self.lblrmb.text = @"元";
    [self.lblrmb setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(12)]];
    [self.imgvwDtn addSubview:self.lblrmb];
    
}
//时间减按钮
-(void)minusAction
{
    int price = 100;
    if ([self.lbltype.text isEqualToString:@"普通（100元/小时）"]) {
       price = 100;
    }
    if ([self.lbltype.text isEqualToString:@"专业（150元/小时）"]) {
       price = 150;
    }
    if ([self.lbltype.text isEqualToString:@"VIP（200元/小时）"]) {
        price = 200;
    }
    //先由字符串转数字，再由数字转回字符串
    int pay = 0;
    double number = [self.lblnumber.text doubleValue];
    if (number>2) {
        number = number - 0.5;
        pay = pay + 1;
    }
    self.lblnumber.text = [NSString stringWithFormat:@"%0.1f",number];
    //计算合计多少
    int money = [self.lblmoney.text intValue];
    money = money - price*pay*0.5;
    self.lblmoney.text = [NSString stringWithFormat:@"%d",money];
    NSLog(@"时间减");
}
//时间加按钮
-(void)plusAction
{
    int price = 100;
    if ([self.lbltype.text isEqualToString:@"普通（100元/小时）"]) {
        price = 100;
    }
    if ([self.lbltype.text isEqualToString:@"专业（150元/小时）"]) {
        price = 150;
    }
    if ([self.lbltype.text isEqualToString:@"VIP（200元/小时）"]) {
        price = 200;
    }
    //先由字符串转数字，再由数字转回字符串
    int pay = 1;
    double number = [self.lblnumber.text doubleValue];
    number = number + 0.5;
    self.lblnumber.text = [NSString stringWithFormat:@"%0.1f",number];
    //计算合计多少
    int money = [self.lblmoney.text intValue];
    money = money + price*pay*0.5;
    self.lblmoney.text = [NSString stringWithFormat:@"%d",money];
    NSLog(@"时间加");
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
