//
//  feedBackController.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/24.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface feedBackController : UIViewController<UITextViewDelegate>

//反馈主题
@property(strong,nonatomic)UITextField *textTheme;
//反馈主题内容
@property(strong,nonatomic)UITextView *textContent;
@property(strong,nonatomic)UILabel *lblContent;


@end
