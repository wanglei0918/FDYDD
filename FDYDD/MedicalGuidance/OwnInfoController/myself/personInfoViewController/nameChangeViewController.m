//
//  nameChangeViewController.m
//  FDYDD
//
//  Created by fdkj0002 on 15/12/9.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "nameChangeViewController.h"

@interface nameChangeViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * textField;
@end

@implementation nameChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(235, 235, 244);
    [self configChangeNameUI];
}
#pragma mark --
#pragma mark 初始化UI
-(void)configChangeNameUI{
    
    UIButton * back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(FIXWIDTHORHEIGHT(0), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(40));
    [back setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:back];
    [back addTarget:self action:@selector(backAndSureBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(back.frame.origin.x + back.frame.size.width), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(200), FIXWIDTHORHEIGHT(40))];
    lable.text = @"名字";
    lable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lable];
    
    
    UIButton * sure = [UIButton buttonWithType:UIButtonTypeCustom];
    sure.frame = CGRectMake(FIXWIDTHORHEIGHT(lable.frame.origin.x + lable.frame.size.width), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(40));
    [sure setTitle:@"确定" forState:UIControlStateNormal];
    [sure setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:sure];
    [sure addTarget:self action:@selector(backAndSureBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(lable.frame.origin.y + lable.frame.size.height + 20), FIXWIDTHORHEIGHT(300), FIXWIDTHORHEIGHT(40))];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.text = self.name;
    _textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    [_textField becomeFirstResponder];
    [self.view addSubview:_textField];
    
}
#pragma mark--
#pragma mark 数据请求

#pragma mark--
#pragma mark 数据加载

#pragma mark--
#pragma mark 事件
-(void)backAndSureBtnClicked:(UIButton *)btn{
    NSLog(@"返回或者确定");
    [self.delegate backNameString:_textField.text];
     [self.navigationController popViewControllerAnimated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
}
#pragma mark--
#pragma mark  代理

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
