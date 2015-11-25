//
//  TipView.m
//  FDYDD
//
//  Created by fdkj0001 on 15/11/18.
//  Copyright © 2015年 fdkj0001. All rights reserved.
//

#import "TipView.h"

@implementation TipView



- (instancetype)init
{
    self = [super init];
    if (self) {
         [self createSubviews];
    }
    return self;
}

-(void)createSubviews
{

    self.backgroundColor = [UIColor whiteColor];
    UILabel *lable = [[UILabel alloc] init];
    [self addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).with.offset(-40*HEIGHT);
        make.size.mas_equalTo(CGSizeMake(100*HEIGHT, 40*HEIGHT));
    }];
    lable.text = @"注册成功";
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = RGBCOLOR(98, 98, 98);
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(50*HEIGHT);
        make.size.mas_equalTo(CGSizeMake(80*HEIGHT, 80*HEIGHT));
    }];
    imageView.image = [UIImage imageNamed:@"sucess"];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
