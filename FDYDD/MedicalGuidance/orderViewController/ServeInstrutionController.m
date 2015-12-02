//
//  ServeInstrutionController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/19.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "ServeInstrutionController.h"

@interface ServeInstrutionController ()

//服务内容和服务流程

@property(strong,nonatomic)UILabel *lblContent;
@property(strong,nonatomic)UILabel *lblContext;
@property(strong,nonatomic)UILabel *lblFlow;
@property(strong,nonatomic)UILabel *lblFlowtext;


@end

@implementation ServeInstrutionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self buildInterface];
    
}
-(void)buildInterface
{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:scrollView];
    
    UIImageView *imgbase = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, FIXWIDTHORHEIGHT(185))];
    imgbase.image = [UIImage imageNamed:@"serviceinfobg"];
    [scrollView addSubview:imgbase];

    
    UIImageView *imgText = [[UIImageView alloc] initWithFrame:CGRectMake(0, imgbase.bottom, imgbase.width, self.view.frame.size.height-FIXWIDTHORHEIGHT(185))];
    imgText.backgroundColor = RGBCOLOR(239, 239, 244);
    [scrollView addSubview:imgText];
    
    
    self.lblContent = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(10),FIXWIDTHORHEIGHT(100), FIXWIDTHORHEIGHT(40))];
    self.lblContent.text = @"服务内容";
    self.lblContent.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(20)];
    [imgText addSubview:self.lblContent];
    
    self.lblContext = [[UILabel alloc] initWithFrame:CGRectMake(self.lblContent.left, self.lblContent.bottom,imgText.width-self.lblContent.left*2, FIXWIDTHORHEIGHT(100))];
    self.lblContext.numberOfLines = 0;
    self.lblContext.text = @"陪医导诊，是专业护士及护理员，供院内陪诊服务，帮助您院内导诊、排队、用药指导、陪护照顾等。使您的就诊时间大大减少，方便您快捷舒适的就医，让您就医舒心。平台已动态调整指导价，为了保证医护人员接单，建议您按照指导价发布需求报价。";
    self.lblContext.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(13)];
    self.lblContext.textColor = RGBCOLOR(96,97, 98);
    self.lblContext.backgroundColor = RGBCOLOR(239, 239, 244);
    [imgText addSubview:self.lblContext];
    
    
    self.lblFlow = [[UILabel alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), self.lblContext.bottom+FIXWIDTHORHEIGHT(10),FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(30))];
    self.lblFlow.text = @"服务流程";
    self.lblFlow.backgroundColor = [UIColor yellowColor];
    self.lblFlow.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(14)];
    [imgText addSubview:self.lblFlow];
    
    
    for (int i = 0; i < 4; i++) {
    UIImageView *imgReddot = [[UIImageView alloc] initWithFrame:CGRectMake(self.lblFlow.left, self.lblFlow.bottom+FIXWIDTHORHEIGHT(10)+FIXWIDTHORHEIGHT(30)*i, FIXWIDTHORHEIGHT(12), FIXWIDTHORHEIGHT(12))];
        imgReddot.backgroundColor = [UIColor redColor];
        imgReddot.layer.cornerRadius = FIXWIDTHORHEIGHT(6);
        [imgText addSubview:imgReddot];
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
