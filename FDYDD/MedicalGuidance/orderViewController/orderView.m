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
        _scrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height+150);
    }else{
        _scrollView.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height+60);
        
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
    self.imgvwType = [[UIImageView alloc] initWithFrame:CGRectMake(self.imgvwInfo.left, self.imgvwInfo.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(300), FIXWIDTHORHEIGHT(120))];
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
    
    //服务时长 与 合计
    self.lblDtn = [[UILabel alloc] initWithFrame:CGRectMake(itlforX, itlforY, width, high)];
    self.lblDtn.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [self.imgvwDtn addSubview:self.lblDtn];
    self.lblDtn.text = @"服务时长:";
    
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
    
    
}












/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
