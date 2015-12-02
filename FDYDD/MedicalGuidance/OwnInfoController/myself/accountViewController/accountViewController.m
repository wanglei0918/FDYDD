//
//  accountViewController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "accountViewController.h"
#import "myActTableView.h"

@interface accountViewController ()

@end

@implementation accountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    //返回键
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(FIXWIDTHORHEIGHT(15), FIXWIDTHORHEIGHT(25), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(30));
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    //标题我的账户
    self.lblTitle = [[UILabel alloc] init];
    [self.view addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(25));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(100), 40));
    }];
    self.lblTitle.text = @"我的账户";
    self.lblTitle.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(17)];
    self.lblTitle.textColor = [UIColor redColor];
    
    //标题下方的底层图片
    self.imgBase = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(70), self.view.width-FIXWIDTHORHEIGHT(10)*2, FIXWIDTHORHEIGHT(80))];
    self.imgBase.image = [UIImage imageNamed:@"bg-1"];
    [self.view addSubview:self.imgBase];
    self.myActTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.imgBase.bottom, self.view.width, self.view.height-self.imgBase.bottom) style:UITableViewStylePlain];
    [self.view addSubview:self.myActTableView];
    self.myActTableView.delegate = self;
    self.myActTableView.dataSource = self;
    
    
    self.countArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
    
    [self myAccount];
    
}
-(void)backAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//设置行数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.countArray.count;
}

//设置cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *dataCell = @"myCell";
    myActTableView *cell = [tableView dequeueReusableCellWithIdentifier:dataCell];
    if(cell == nil){
        cell = [[myActTableView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:dataCell];
}
    //    cell.technology = [self.technologyArray objectAtIndex:indexPath.row];
    //cell.textLabel.text = @"111";
    //取消cell被点击后有灰色效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)myAccount
{
    //余额的图片
    self.imgWallet = [[UIImageView alloc] initWithFrame:CGRectMake(FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(20), FIXWIDTHORHEIGHT(40), FIXWIDTHORHEIGHT(40))];
    [self.imgBase addSubview:self.imgWallet];
    self.imgWallet.image = [UIImage imageNamed:@"wallet"];
    
    //您的余额  300  元
    self.lblbalan = [[UILabel alloc] initWithFrame:CGRectMake(self.imgWallet.right+FIXWIDTHORHEIGHT(10), FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(60), 30)];
    [self.imgBase addSubview:self.lblbalan];
    self.lblbalan.text = @"您的余额";
    self.lblbalan.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(15)];
  //  self.lblbalan.backgroundColor = [UIColor yellowColor];

    self.lblnumber = [[UILabel alloc] initWithFrame:CGRectMake(self.lblbalan.right, FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(70), 40)];
    self.lblnumber.bottom = self.lblbalan.bottom;
    [self.imgBase addSubview:self.lblnumber];
    self.lblnumber.text = @"3000";
    self.lblnumber.textAlignment = NSTextAlignmentCenter;
//    self.lblnumber.backgroundColor = [UIColor yellowColor];
    self.lblnumber.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(20)];
    
    self.lblmoney = [[UILabel alloc] initWithFrame:CGRectMake(self.lblnumber.right, FIXWIDTHORHEIGHT(30), FIXWIDTHORHEIGHT(20), 30)];
    [self.imgBase addSubview:self.lblmoney];
    self.lblmoney.text = @"元";
    self.lblmoney.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(15)];
  //  self.lblmoney.backgroundColor = [UIColor yellowColor];
    
    
    //提现的背景图片
    self.imgCash = [[UIImageView alloc] init];
    [self.imgBase addSubview:self.imgCash];
    [self.imgCash mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.imgBase);
        make.right.equalTo(self.imgBase).with.offset(FIXWIDTHORHEIGHT(-20));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(50), FIXWIDTHORHEIGHT(50)));
    }];
    self.imgCash.image = [UIImage imageNamed:@"cash"];
    
    
}

//设置edit的方法
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.myActTableView setEditing:YES animated:YES];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.countArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView endUpdates];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

//设置cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
