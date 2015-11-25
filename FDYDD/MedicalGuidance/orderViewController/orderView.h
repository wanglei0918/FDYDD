//
//  orderView.h
//  FDYDD
//
//  Created by fdkj0001 on 15/11/20.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface orderView : UIView

@property(strong,nonatomic)UIScrollView *scrollView;

//四个存放信息的UIImageView
@property(strong,nonatomic)UIImageView *imgvwPerson;
@property(strong,nonatomic)UIImageView *imgvwInfo;
@property(strong,nonatomic)UIImageView *imgvwType;
@property(strong,nonatomic)UIImageView *imgvwDtn;


@property(strong,nonatomic)UILabel *lblCont;
@property(strong,nonatomic)UILabel *lblContPhone;
@property(strong,nonatomic)UILabel *lblPatient;
@property(strong,nonatomic)UILabel *lblHospital;
@property(strong,nonatomic)UILabel *lblTime;
@property(strong,nonatomic)UILabel *lblRemark;
@property(strong,nonatomic)UILabel *lblSevtype;
@property(strong,nonatomic)UILabel *lblDtn;
@property(strong,nonatomic)UILabel *lblSum;

//可以点击或输入的label和文本框
@property(strong,nonatomic)UITextField *txtfdContact;
@property(strong,nonatomic)UITextField *txtfdPhone;
@property(strong,nonatomic)UITextField *txtfdPatient;

@property(strong,nonatomic)UILabel *lblhosptxt;
@property(strong,nonatomic)UILabel *lbltimetxt;
@property(strong,nonatomic)UILabel *lblremktxt;
@property(strong,nonatomic)UIImageView *imgArrhosp;
@property(strong,nonatomic)UIImageView *imgArrtime;
@property(strong,nonatomic)UIImageView *imgArrremk;


//服务类型后面的类型label
@property(strong,nonatomic)UILabel *lbltype;

@property(strong,nonatomic)UILabel *lblPrompt;

@end
