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

    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationController.navigationBarHidden = NO;



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
