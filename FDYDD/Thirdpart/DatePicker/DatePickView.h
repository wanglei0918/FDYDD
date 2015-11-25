//
//  DatePickView.h
//  GuanLiBao
//
//  Created by SwiftHorse on 15-1-8.
//  Copyright (c) 2015年 SwiftHorse. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DatePickView;
@protocol GetSelectedDateDelegate <NSObject>

//- (void)GetSelectedDate:(DatePickView *)datepickview Date:(NSDate *)date;

- (void)GetSelectedDate:(DatePickView *)datepickview string:(NSString *)string;

@end

@interface DatePickView : UIView



@property (nonatomic, retain) UIDatePicker *DatePicker;
@property (nonatomic, retain) NSDate *SelectedDate;
@property (nonatomic, retain) id<GetSelectedDateDelegate>delegate;
@property (nonatomic) UIDatePickerMode datePickerMode;



@end
