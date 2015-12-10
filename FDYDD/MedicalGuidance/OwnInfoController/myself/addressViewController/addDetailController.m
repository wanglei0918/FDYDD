//
//  addDetailController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/12/8.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "addDetailController.h"

@interface addDetailController ()

@end

@implementation addDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(238, 240, 241);
    
    
    UILabel *lbltitle = [[UILabel alloc] init];
    [self.view addSubview:lbltitle];
    [lbltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(25));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(30)));
    }];
    lbltitle.text = @"新增地址";
    lbltitle.textAlignment = NSTextAlignmentCenter;
    lbltitle.textColor = RGBCOLOR(216, 65, 72);
    
    UIButton *savebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    savebtn.frame = CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25));
    [savebtn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    [savebtn setTitle:@"保存" forState:UIControlStateNormal];
    [savebtn setTitleColor:RGBCOLOR(216, 65, 72) forState:UIControlStateNormal];
    //    addbtn.titleLabel.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(17)];
    [self.view addSubview:savebtn];

    [self UIInterface];
}

-(void)UIInterface
{
    //新增页面联系人信息
    UIImageView *imgperson = [[UIImageView alloc] initWithFrame:CGRectMake(0, FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(320), FIXWIDTHORHEIGHT(120))];
    imgperson.image = [UIImage imageNamed:@"bg-7"];
    [self.view addSubview:imgperson];
    imgperson.userInteractionEnabled = YES;
    
    //新增页面地址信息
    UIImageView *imgaddress = [[UIImageView alloc] initWithFrame:CGRectMake(imgperson.left, imgperson.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(320), FIXWIDTHORHEIGHT(120))];
    imgaddress.image = [UIImage imageNamed:@"bg-7"];
    [self.view addSubview:imgaddress];
    imgaddress.userInteractionEnabled = YES;
    
    //联系人信息
    UILabel *namelbl = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    namelbl.text = @"姓名:";
    namelbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgperson addSubview:namelbl];
    
    self.userText = [[UITextField alloc] initWithFrame:CGRectMake(namelbl.right, namelbl.top, FIXWIDTHORHEIGHT(280), FIXWIDTHORHEIGHT(25))];
    self.userText.placeholder = @"请输入联系人姓名";
    self.userText.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgperson addSubview:self.userText];
    
    UILabel *sexlbl = [[UILabel alloc] initWithFrame:CGRectMake(namelbl.left, namelbl.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    sexlbl.text = @"性别:";
    sexlbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgperson addSubview:sexlbl];
    
    //性别选择
    self.imgman = [[UIImageView alloc] initWithFrame:CGRectMake(sexlbl.right, sexlbl.top+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(15))];
    self.imgman.image = [UIImage imageNamed:@"selected"];
    self.imgman.userInteractionEnabled = YES;
    [imgperson addSubview:self.imgman];
    UITapGestureRecognizer *manTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mantap)];
    [self.imgman addGestureRecognizer:manTap];
    
    UILabel *manlbl = [[UILabel alloc] initWithFrame:CGRectMake(self.imgman.right+FIXWIDTHORHEIGHT(5), namelbl.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    manlbl.text = @"男";
    manlbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgperson addSubview:manlbl];
    
    self.imgwoman = [[UIImageView alloc] initWithFrame:CGRectMake(manlbl.right+FIXWIDTHORHEIGHT(10), manlbl.top+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(15))];
    self.imgwoman.image = [UIImage imageNamed:@"selected"];
    self.imgwoman.userInteractionEnabled = YES;
    [imgperson addSubview:self.imgwoman];
    UITapGestureRecognizer *womanTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(womantap)];
    [self.imgwoman addGestureRecognizer:womanTap];
    
    UILabel *womanlbl = [[UILabel alloc] initWithFrame:CGRectMake(self.imgwoman.right+FIXWIDTHORHEIGHT(5), namelbl.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    womanlbl.text = @"女";
    womanlbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgperson addSubview:womanlbl];

    UILabel *phonelbl = [[UILabel alloc] initWithFrame:CGRectMake(namelbl.left, sexlbl.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    phonelbl.text = @"电话:";
//    phonelbl.backgroundColor = [UIColor lightGrayColor];
    phonelbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgperson addSubview:phonelbl];
    
    
    self.phoneText = [[UITextField alloc] initWithFrame:CGRectMake(phonelbl.right, phonelbl.top, FIXWIDTHORHEIGHT(280), FIXWIDTHORHEIGHT(25))];
    self.phoneText.placeholder = @"请输入联系人的电话";
    self.phoneText.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgperson addSubview:self.phoneText];
    
     //地址信息
    UILabel *arealbl = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25))];
    arealbl.text = @"地区:";
    arealbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgaddress addSubview:arealbl];
    
    self.areaText = [[UITextField alloc] initWithFrame:CGRectMake(arealbl.right, arealbl.top, FIXWIDTHORHEIGHT(280), FIXWIDTHORHEIGHT(25))];
    self.areaText.placeholder = @"请选择就医者所在的地区";
    self.areaText.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgaddress addSubview:self.areaText];
   
    UILabel *villagelbl = [[UILabel alloc] initWithFrame:CGRectMake(namelbl.left, namelbl.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(25))];
    villagelbl.text = @"小区名:";
//    villagelbl.backgroundColor = [UIColor lightGrayColor];
    villagelbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgaddress addSubview:villagelbl];
    
    self.villageText = [[UITextField alloc] initWithFrame:CGRectMake(villagelbl.right, villagelbl.top, FIXWIDTHORHEIGHT(260), FIXWIDTHORHEIGHT(25))];
    self.villageText.placeholder = @"请选择";
    self.villageText.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgaddress addSubview:self.villageText];
    
    UILabel *unitlbl = [[UILabel alloc] initWithFrame:CGRectMake(namelbl.left, sexlbl.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(70), FIXWIDTHORHEIGHT(25))];
    unitlbl.text = @"楼号/单元:";
//    unitlbl.backgroundColor = [UIColor lightGrayColor];
    unitlbl.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgaddress addSubview:unitlbl];
    
    self.unitText = [[UITextField alloc] initWithFrame:CGRectMake(unitlbl.right, unitlbl.top, FIXWIDTHORHEIGHT(280), FIXWIDTHORHEIGHT(25))];
    self.unitText.placeholder = @"请输入详细单元和房号";
    self.unitText.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    [imgaddress addSubview:self.unitText];
    
    //灰色线及箭头
    
    for (int i = 0; i < 2; i++) {
        UIImageView *imgline = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(40)+i*FIXWIDTHORHEIGHT(37), FIXWIDTHORHEIGHT(285), 1)];
        imgline.backgroundColor = RGBCOLOR(233, 234, 235);
        [imgperson addSubview:imgline];
    }

    for (int i = 0; i < 2; i++) {
        UIImageView *imgarrow = [[UIImageView alloc] initWithFrame:CGRectMake(imgaddress.right-FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(14)+i*FIXWIDTHORHEIGHT(36), FIXWIDTHORHEIGHT(13), FIXWIDTHORHEIGHT(13))];
        imgarrow.image = [UIImage imageNamed:@"more"];
        [imgaddress addSubview:imgarrow];
    }
    
    
    
}

//保存按钮动作
-(void)saveAction
{
    NSLog(@"保存");

}

//点击按钮改变性别状态
-(void)mantap
{
    NSLog(@"先生");
}
-(void)womantap
{
    NSLog(@"女士");
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
