//
//  MessageController.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/19.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "MessageController.h"


@interface MessageController ()

@end

@implementation MessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"消息";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStyleDone target:self action:@selector(leftButton)];
    [self.navigationItem.leftBarButtonItem setTitle:@"返回"];
    
}



-(void)leftButton
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
