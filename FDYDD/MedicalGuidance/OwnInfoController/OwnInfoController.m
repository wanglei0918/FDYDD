//
//  OwnInfoController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/19.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "OwnInfoController.h"
#import "MessageController.h"
#import "accountViewController.h"
#import "addressViewController.h"
#import "myOrderController.h"
#import "archiveViewController.h"
#import "aboutViewController.h"
#import "feedBackController.h"


@interface OwnInfoController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
//下拉菜单
UIActionSheet *myActionSheet;
//图片2进制路径
NSString* filePath;
}
@property(strong,nonatomic)UIButton *headbtn;

@property(strong,nonatomic)UILabel *lblName;
@property(strong,nonatomic)UILabel *lblphone;
@property(strong,nonatomic)UIImageView *imgPHone;

@end


@implementation OwnInfoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;

    UIImageView *imgBase = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.size.width,FIXWIDTHORHEIGHT(185))];
    imgBase.image = [UIImage imageNamed:@"myinfobg"];
    [self.view addSubview:imgBase];

    
    //模态消失按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(40));
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    //模态消息页面按钮
    UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    infoBtn.frame = CGRectMake(FIXWIDTHORHEIGHT(275), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(50));
    [infoBtn setBackgroundImage:[UIImage imageNamed:@"message1"] forState:UIControlStateNormal];
    [infoBtn addTarget:self action:@selector(infobtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoBtn];

    
    [self btnAction];

}
//模态消失方法
-(void)backAction
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//模态消息页面方法
-(void)infobtnAction
{
    MessageController *message = [[MessageController alloc] init];
    UINavigationController *naMe = [[UINavigationController alloc] initWithRootViewController:message];
    [self.navigationController presentViewController:naMe animated:YES completion:^{
        
    }];
}

-(void)btnAction
{
    //我的头像按钮
    _headbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_headbtn];
    _headbtn.frame = CGRectMake(FIXWIDTHORHEIGHT(120), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(80));
    _headbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(40);
    [_headbtn addTarget:self action:@selector(headAction) forControlEvents:UIControlEventTouchUpInside];
    [_headbtn setBackgroundImage:[UIImage imageNamed:@"car"] forState:UIControlStateNormal];
    _headbtn.layer.masksToBounds = YES;
    _headbtn.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
    _headbtn.layer.borderWidth = 0.5;
    //头像下面的label
    self.lblName = [[UILabel alloc] init];
    [self.view addSubview:self.lblName];
    self.lblName.text = @"布袋医仕";
    self.lblName.textAlignment = NSTextAlignmentCenter;
    self.lblName.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(15)];
    [self.lblName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(_headbtn).with.offset(FIXWIDTHORHEIGHT(35));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(30)));
    }];
    //头像下方的imgV
    self.imgPHone = [[UIImageView alloc] init];
    [self.view addSubview:self.imgPHone];
    [self.imgPHone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.lblName).with.offset(FIXWIDTHORHEIGHT(30));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(150), FIXWIDTHORHEIGHT(30)));
    }];
    //头像下方的imgV上的imgPhone
    UIImageView *imgPhone = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(30))];
    imgPhone.image = [UIImage imageNamed:@"phone"];
    [self.imgPHone addSubview:imgPhone];
    //头像下方的imgV上的lblPhone
    self.lblphone = [[UILabel alloc] initWithFrame:CGRectMake(imgPhone.right, imgPhone.top, FIXWIDTHORHEIGHT(120), FIXWIDTHORHEIGHT(30))];
    self.lblphone.text = @"18812345678";
     self.lblphone.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(15)];
    self.lblphone.textColor = RGBCOLOR(200, 200, 200);
    [self.imgPHone addSubview:self.lblphone];
    
    
    int sizeXY = 60;
    int rangeforleft = 30;
    int sizefont = 12;
    if (iPHone4oriPHone4s) {
        rangeforleft = 42;
        sizefont = 10;
        sizeXY = 50;
    }
    
    //我的账户按钮及下方lbl
    UIButton *accountbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:accountbtn];
    accountbtn.frame = CGRectMake(FIXWIDTHORHEIGHT(rangeforleft), _headbtn.bottom+FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(sizeXY));
    accountbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    [accountbtn setBackgroundImage:[UIImage imageNamed:@"mywallet"] forState:UIControlStateNormal];
    [accountbtn addTarget:self action:@selector(accountAction) forControlEvents:UIControlEventTouchUpInside];
    self.lblaccount = [[UILabel alloc] initWithFrame:CGRectMake(accountbtn.left, accountbtn.bottom, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(25))];
    self.lblaccount.text = @"我的账户";
    self.lblaccount.textColor = RGBCOLOR(200, 200, 200);
    self.lblaccount.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(sizefont)];
    self.lblaccount.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblaccount];
    
    
    //地址管理按钮及下方lbl
    UIButton *addressbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:addressbtn];
    addressbtn.frame = CGRectMake(accountbtn.right+FIXWIDTHORHEIGHT(40), accountbtn.top, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(sizeXY));
    addressbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    [addressbtn addTarget:self action:@selector(addressAction) forControlEvents:UIControlEventTouchUpInside];
    [addressbtn setBackgroundImage:[UIImage imageNamed:@"myadd"] forState:UIControlStateNormal];
    self.lbladdress = [[UILabel alloc] initWithFrame:CGRectMake(addressbtn.left, addressbtn.bottom, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(25))];
    self.lbladdress.text = @"地址管理";
    self.lbladdress.textColor = RGBCOLOR(200, 200, 200);
    self.lbladdress.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(sizefont)];
    self.lbladdress.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lbladdress];
    
    //我的订单按钮及下方lbl
    UIButton *orderbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:orderbtn];
    orderbtn.frame = CGRectMake(addressbtn.right+FIXWIDTHORHEIGHT(40), addressbtn.top, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(sizeXY));
    orderbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
   [orderbtn setBackgroundImage:[UIImage imageNamed:@"myorder"] forState:UIControlStateNormal];
    [orderbtn addTarget:self action:@selector(orderAction) forControlEvents:UIControlEventTouchUpInside];
    self.lblorder = [[UILabel alloc] initWithFrame:CGRectMake(orderbtn.left, orderbtn.bottom, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(25))];
    self.lblorder.text = @"我的订单";
    self.lblorder.textColor = RGBCOLOR(200, 200, 200);
    self.lblorder.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(sizefont)];
    self.lblorder.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblorder];
    
    //健康档案按钮及下方lbl
    UIButton *archivebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:archivebtn];
    archivebtn.frame = CGRectMake(FIXWIDTHORHEIGHT(rangeforleft), accountbtn.bottom+FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(sizeXY));
    archivebtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    [archivebtn setBackgroundImage:[UIImage imageNamed:@"myhealth"] forState:UIControlStateNormal];
    [archivebtn addTarget:self action:@selector(archivesAction) forControlEvents:UIControlEventTouchUpInside];
    self.lblarchive = [[UILabel alloc] initWithFrame:CGRectMake(archivebtn.left, archivebtn.bottom, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(25))];
    self.lblarchive.text = @"健康档案";
    self.lblarchive.textColor = RGBCOLOR(200, 200, 200);
    self.lblarchive.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(sizefont)];
    self.lblarchive.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblarchive];
    
    //关于按钮及下方lbl
    UIButton *aboutbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:aboutbtn];
    aboutbtn.frame = CGRectMake(archivebtn.right+FIXWIDTHORHEIGHT(40), archivebtn.top, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(sizeXY));
    aboutbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    [aboutbtn setBackgroundImage:[UIImage imageNamed:@"about"] forState:UIControlStateNormal];
    [aboutbtn addTarget:self action:@selector(aboutAction) forControlEvents:UIControlEventTouchUpInside];
    self.lblabout = [[UILabel alloc] initWithFrame:CGRectMake(aboutbtn.left, aboutbtn.bottom, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(25))];
    self.lblabout.text = @"关于";
    self.lblabout.textColor = RGBCOLOR(200, 200, 200);
    self.lblabout.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(sizefont)];
    self.lblabout.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblabout];

    
    //反馈按钮及下方lbl
    UIButton *feedbackbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:feedbackbtn];
    feedbackbtn.frame = CGRectMake(aboutbtn.right+FIXWIDTHORHEIGHT(40), aboutbtn.top, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(sizeXY));
    feedbackbtn.layer.cornerRadius = FIXWIDTHORHEIGHT(30);
    [feedbackbtn setBackgroundImage:[UIImage imageNamed:@"feedback"] forState:UIControlStateNormal];
    [feedbackbtn addTarget:self action:@selector(feedbackAction) forControlEvents:UIControlEventTouchUpInside];
    self.lblfeedback = [[UILabel alloc] initWithFrame:CGRectMake(feedbackbtn.left, feedbackbtn.bottom, FIXWIDTHORHEIGHT(sizeXY), FIXWIDTHORHEIGHT(25))];
    self.lblfeedback.text = @"反馈";
    self.lblfeedback.textColor = RGBCOLOR(200, 200, 200);
    self.lblfeedback.font = [UIFont systemFontOfSize: FIXWIDTHORHEIGHT(sizefont)];
    self.lblfeedback.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.lblfeedback];
    
    
    
    //注册页面的logo
    self.imgLogo = [[UIImageView alloc] init];
    [self.view addSubview:self.imgLogo];
    
    if (iPHone4oriPHone4s) {
        self.imgLogo.frame = CGRectMake(130, 380, 60, 80);
    } else {
        [self.imgLogo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(-40));
            make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(60), FIXWIDTHORHEIGHT(80)));
        }];
    }
    self.imgLogo.image = [UIImage imageNamed:@"logo2"];
}

//头部视图按钮
-(void)headAction
{
    myActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打开照相机",@"从手机相册获取", nil];
    [myActionSheet showInView:self.view];
}

//每个按钮的点击动作
-(void)accountAction
{
    NSLog(@"我的账户");
    accountViewController *account = [[accountViewController alloc] init];
    [self.navigationController pushViewController:account animated:YES];
}
-(void)addressAction
{
    NSLog(@"地址管理");
    addressViewController *address = [[addressViewController alloc] init];
    [self.navigationController pushViewController:address animated:YES];
}
-(void)orderAction
{
    NSLog(@"我的订单");
    myOrderController *myOrder = [[myOrderController alloc] init];
    [self.navigationController pushViewController:myOrder animated:YES];
}
-(void)archivesAction
{
    NSLog(@"档案管理");
    archiveViewController *archive = [[archiveViewController alloc] init];
    [self.navigationController pushViewController:archive animated:YES];
}
-(void)aboutAction
{
    NSLog(@"关于");
    aboutViewController *about = [[aboutViewController alloc] init];
    [self.navigationController pushViewController:about animated:YES];
}
-(void)feedbackAction
{
    NSLog(@"反馈");
    feedBackController *feedback = [[feedBackController alloc] init];
    [self.navigationController pushViewController:feedback animated:YES];
}


// UIActionSheet  点击按钮触发的方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 8_3)
{
    //呼出的菜单按钮点击后的响应
    if (buttonIndex == myActionSheet.cancelButtonIndex)
    {
        NSLog(@"取消");
    }
    if (buttonIndex == 0) {
                [self takePhoto];
    }
    if (buttonIndex == 1){
                [self LocalPhoto];
    }
}
//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
        }];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}
//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

//当选择一张图片进入这里
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info;
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"]) {
        //先把图片转成NSData
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
            data = UIImagePNGRepresentation(image);
        }
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString *DocumentsPath = [NSHomeDirectory()stringByAppendingPathComponent:@"Documents"];
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        //得到选择后沙盒中图片的完整路径
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
        [_headbtn setBackgroundImage:image forState:UIControlStateNormal];
    }
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
