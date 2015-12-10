//
//  addressViewController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "addressViewController.h"

@interface addressViewController ()

@end

@implementation addressViewController

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
    lbltitle.text = @"地址管理";
    lbltitle.textAlignment = NSTextAlignmentCenter;
    lbltitle.textColor = RGBCOLOR(216, 65, 72);
    
    UIButton *addbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addbtn.frame = CGRectMake(FIXWIDTHORHEIGHT(320)-FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(25));
    [addbtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    [addbtn setTitle:@"新增" forState:UIControlStateNormal];
    [addbtn setTitleColor:RGBCOLOR(216, 65, 72) forState:UIControlStateNormal];
//    addbtn.titleLabel.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(17)];
    [self.view addSubview:addbtn];
    

    
    //地址管理界面设置
    [self UIinterface];
}
-(void)UIinterface
{
    self.addTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, FIXWIDTHORHEIGHT(60), self.view.frame.size.width, self.view.frame.size.height-FIXWIDTHORHEIGHT(60))];
    [self.view addSubview:self.addTableview];
    self.addTableview.delegate = self;
    self.addTableview.dataSource = self;
    //tabView取消线
    self.addTableview.separatorStyle = UITableViewCellSeparatorStyleNone;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myCell = @"myCell";
    addTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCell];
    if (cell == nil) {
        cell = [[addTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell];
    }
    //取消点击效果（灰色）
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
//进入新增页面
-(void)addAction
{
    addDetailController *addetl = [[addDetailController alloc] init];
    [self.navigationController pushViewController:addetl animated:YES];
    NSLog(@"新增");
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
