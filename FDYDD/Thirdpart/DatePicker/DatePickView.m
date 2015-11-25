//
//  DatePickView.m
//  GuanLiBao
//
//  Created by SwiftHorse on 15-1-8.
//  Copyright (c) 2015年 SwiftHorse. All rights reserved.
//

#import "DatePickView.h"

@implementation DatePickView
{
    UIButton *btnBack;
    NSDate *date;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        //黑色背景
        btnBack = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        btnBack.backgroundColor = RGBACOLOR(0, 0, 0, 0.6);
        [btnBack addTarget:self action:@selector(Cancel) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnBack];
        
        //滚轮
        _DatePicker = [[UIDatePicker alloc]init];
        _DatePicker.frame = CGRectMake(0, self.frame.size.height - _DatePicker.height-44, self.frame.size.width, 216);
        _DatePicker.datePickerMode = UIDatePickerModeDateAndTime;
        _DatePicker.backgroundColor = [UIColor whiteColor];
        _DatePicker.locale = [NSLocale currentLocale];
        [btnBack addSubview:_DatePicker];
        
        
        
        //取消按钮
        UIButton *btnCancel = [[UIButton alloc]initWithFrame:CGRectMake(0, _DatePicker.bottom, self.frame.size.width/2, 44)];
        [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
        [btnCancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnCancel.backgroundColor = [UIColor whiteColor];
        [btnCancel addTarget:self action:@selector(Cancel) forControlEvents:UIControlEventTouchUpInside];
        btnCancel.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
        btnCancel.layer.borderWidth = 0.5;
        [btnBack addSubview:btnCancel];
        
        //确定按钮
        UIButton *btnSure = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width/2, _DatePicker.bottom, self.frame.size.width/2, 44)];
        [btnSure setTitle:@"确定" forState:UIControlStateNormal];
        [btnSure setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btnSure.backgroundColor = [UIColor whiteColor];
        [btnSure addTarget:self action:@selector(Sure) forControlEvents:UIControlEventTouchUpInside];
        btnSure.layer.borderColor = RGBCOLOR(200, 200, 200).CGColor;
        btnSure.layer.borderWidth = 0.5;
        [btnBack addSubview:btnSure];
        
    }
    
    return self;
}

- (void)Cancel
{
    [self removeFromSuperview];
}

- (void)Sure
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 这里是用大写的 H
    NSString* dateStr = [dateFormatter stringFromDate:_DatePicker.date];
    _DatePicker.date = [dateFormatter dateFromString:dateStr];
    
    [_delegate GetSelectedDate:self string:dateStr];
 //   [_delegate GetSelectedDate:self Date:_DatePicker.date];
    [self Cancel];
    NSLog(@"====%@",_DatePicker.date);
}

- (void)setSelectedDate:(NSDate *)SelectedDate
{
    if (SelectedDate != nil)
    {
        
//        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // 这里是用大写的 H
//        NSString* dateStr = [dateFormatter stringFromDate:SelectedDate];
//        _DatePicker.date = [dateFormatter dateFromString:dateStr];
//        _DatePicker.date = SelectedDate;
        
        _DatePicker.date = SelectedDate;
    }
}

- (void)setDatePickerMode:(UIDatePickerMode)datePickerMode
{
    _DatePicker.datePickerMode = datePickerMode;
}

@end
