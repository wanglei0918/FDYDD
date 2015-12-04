//
//  myOrderController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "myOrderController.h"
#import "OrderDetailController.h"


@interface myOrderController ()

@property(strong,nonatomic)UILabel *lblTitle;

@end

@implementation myOrderController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.view.backgroundColor = [UIColor whiteColor];

     //设置此页的界面设计
    [self UIInterface];

}
-(void)UIInterface
{
    self.lblTitle = [[UILabel alloc] init];
    [self.view addSubview:self.lblTitle];
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(FIXWIDTHORHEIGHT(30));
        make.size.mas_equalTo(CGSizeMake(FIXWIDTHORHEIGHT(80), FIXWIDTHORHEIGHT(30)));
    }];
    [self.lblTitle setTextColor:RGBCOLOR(231, 119, 119)];
    self.lblTitle.font = [UIFont systemFontOfSize:FIXWIDTHORHEIGHT(17)];
    self.lblTitle.text = @"陪诊订单";
    
    
    self.OrderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.top+FIXWIDTHORHEIGHT(80), self.view.frame.size.width, self.view.frame.size.height-FIXWIDTHORHEIGHT(100)) style:UITableViewStylePlain];
    
    NSLog(@"self.width == %f",self.view.frame.size.width);
     NSLog(@"self == %f",self.view.bounds.size.width);
    //取消线
    self.OrderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.OrderTableView];
    self.OrderTableView.delegate = self;
    self.OrderTableView.dataSource = self;
    
 self.countArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
}
//cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.countArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mycell = @"mycell";
    myOrderTableView *cell = [tableView dequeueReusableCellWithIdentifier:mycell];
    if (cell == nil) {
        cell = [[myOrderTableView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mycell];
   
    
        }
    //取消点击效果（灰色）
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
}


//点击cell进入详情
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //根据坐标获取当前点击的tabView
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OrderDetailController *orderDetail = [[OrderDetailController alloc] init];
    [self.navigationController pushViewController:orderDetail animated:YES];
}


//设置edit的方法
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.OrderTableView setEditing:YES animated:YES];
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

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return FIXWIDTHORHEIGHT(70);
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
