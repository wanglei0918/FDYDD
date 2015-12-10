//
//  feedBackController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "feedBackController.h"

@interface feedBackController ()

@end

@implementation feedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBCOLOR(235, 235, 244);

    UILabel *lbltitle = [[UILabel alloc] init];
    [self.view addSubview:lbltitle];
    [lbltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(25));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(30)));
    }];
    lbltitle.text = @"意见反馈";
    [lbltitle setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(15)]];
    lbltitle.textAlignment = NSTextAlignmentCenter;
    lbltitle.textColor = RGBCOLOR(216, 65, 72);

    [self UIinterface];
    
}
-(void)UIinterface
{
   //意见反馈下的第一个base图
    UIImageView *imgvwHelp = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(80))];
    imgvwHelp.image = [UIImage imageNamed:@"bg-1"];
    [self.view addSubview:imgvwHelp];
    //help图片
    UIImageView *imghelp = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    [imgvwHelp addSubview:imghelp];
    imghelp.image = [UIImage imageNamed:@"help"];
    UIImageView *imgarrow = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(15))];
    [imgvwHelp addSubview:imgarrow];
    imgarrow.image = [UIImage imageNamed:@"more"];
    
    UILabel *lblhelp = [[UILabel alloc] initWithFrame:CGRectMake(imghelp.right+FIXWIDTHORHEIGHT(10), imghelp.top, FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(20))];
    lblhelp.text = @"使用帮助";
    [lblhelp setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    [imgvwHelp addSubview:lblhelp];
    
    
    //灰线
    UIImageView *imgline = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), imghelp.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(290), 1)];
    imgline.backgroundColor = RGBCOLOR(233, 234, 235);
    [imgvwHelp addSubview:imgline];
    
    //help图片
    UIImageView *imgservice = [[UIImageView alloc] initWithFrame:CGRectMake(imghelp.left, imghelp.bottom+FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    [imgvwHelp addSubview:imgservice];
    imgservice.image = [UIImage imageNamed:@"voiceservice"];
    
    UILabel *lblsersvice = [[UILabel alloc] initWithFrame:CGRectMake(imgservice.right+FIXWIDTHORHEIGHT(10), imgservice.top, FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(20))];
    lblsersvice.text = @"客服电话";
    [lblsersvice setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    [imgvwHelp addSubview:lblsersvice];
    UILabel *lblphone = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(150), imgservice.top, FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(20))];
    lblphone.text = @"400-1234-1234";
    [lblphone setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    [imgvwHelp addSubview:lblphone];
    
    UIImageView *imgphone = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(40), imgservice.top, FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    [imgvwHelp addSubview:imgphone];
    imgphone.image = [UIImage imageNamed:@"call1"];
    

    
    //意见反馈下的第一个base图
    UIImageView *imgopinion = [[UIImageView alloc] initWithFrame:CGRectMake(0, imgvwHelp.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(320), FIXWIDTHORHEIGHT(240))];
    imgopinion.image = [UIImage imageNamed:@"bg-15"];
     imgopinion.userInteractionEnabled = YES;
    [self.view addSubview:imgopinion];
    //意见反馈
    UIImageView *imgopion = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(20))];
    [imgopinion addSubview:imgopion];
    imgopion.image = [UIImage imageNamed:@"opinion"];
    UILabel *lblopion = [[UILabel alloc] initWithFrame:CGRectMake(imgopion.right+FIXWIDTHORHEIGHT(10), imgopion.top, FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(20))];
    lblopion.text = @"意见反馈";
    [lblopion setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    [imgopinion addSubview:lblopion];
    
    //灰线
    UIImageView *imgline1 = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(15), imgopion.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(290), 1)];
    imgline1.backgroundColor = RGBCOLOR(233, 234, 235);
    [imgvwHelp addSubview:imgline1];

    self.textTheme = [[UITextField alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(30), imgopion.bottom+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(290), FIXWIDTHORHEIGHT(25))];
    [imgopinion addSubview:self.textTheme];
    [self.textTheme setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    self.textTheme.placeholder = @"请输入您的反馈主题";
    
    self.textContent = [[UITextView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(25), self.textTheme.bottom+FIXWIDTHORHEIGHT(5), FIXWIDTHORHEIGHT(270), FIXWIDTHORHEIGHT(150))];
    [imgopinion addSubview:self.textContent];
    [self.textContent setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
//    self.textContent.backgroundColor = [UIColor cyanColor];
    self.textContent.delegate = self;
    
    self.lblContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, FIXWIDTHORHEIGHT(290), FIXWIDTHORHEIGHT(25))];
    [self.textContent addSubview:self.lblContent];
<<<<<<< HEAD
    self.lblContent.text = @"  请输入您反馈内容";
=======
    self.lblContent.text = @"  请输入您的反馈内容";
>>>>>>> origin/master
    self.lblContent.enabled = NO;
    self.lblContent.textColor = RGBCOLOR(131, 132, 133);
    self.lblContent.backgroundColor = [UIColor clearColor];
    [self.lblContent setFont:[UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)]];
    
    
    
    //设置发布需求按钮
    UIButton *releasebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:releasebtn];
    [releasebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(-50));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(240), FIXWIDTHORHEIGHT(40)));
    }];
    releasebtn.frame = CGRectMake(self.view.left, self.view.bottom+FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(255), FIXWIDTHORHEIGHT(30));
    [releasebtn setTitle:@"提交" forState:UIControlStateNormal];
    releasebtn.backgroundColor = RGBCOLOR(220, 10, 12);
    releasebtn.layer.cornerRadius = FIXWIDTHORHEIGHT(20);
    [releasebtn addTarget:self action:@selector(releasebtn) forControlEvents:UIControlEventTouchUpInside];
    


    
}

//下面的发布需求按钮
-(void)releasebtn
{
    
    NSLog(@"发布请求");
}





//实现UITextView的代理
-(void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"0123");
    self.textContent.text = textView.text;
    if (textView.text.length == 0) {
        self.lblContent.text = @"  请输入您的反馈内容";
    }else{
        self.lblContent.text = @"";
    } 
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
