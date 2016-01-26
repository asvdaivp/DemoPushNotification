//
//  PDDatePicker.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/26/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDDatePicker.h"

@implementation PDDatePicker

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (UIDatePicker *)createDatePickerWithFrame:(CGRect)frame {
    UIDatePicker *viewDatePicker = [[UIDatePicker alloc] init];
    [viewDatePicker setFrame:frame];
    [viewDatePicker setDatePickerMode:UIDatePickerModeDateAndTime];
    return viewDatePicker;
}

- (id)initDateTimePickerWithCurrentDate:(NSDate *)currentDate andMaxdate:(NSDate *)maxDate andMinDate:(NSDate *)minDate {
    CGRect frame = (CGRect){0, 0, 280, 180};
    self = [super initWithFrame:frame];
    if (self) {
        self.datePicker = [self createDatePickerWithFrame:frame];
        NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"];
        self.datePicker.locale = locale;
        self.datePicker.calendar = [locale objectForKey:NSLocaleCalendar];
        
        [self addSubview:self.datePicker];
        
        if (maxDate != nil) {
            [self.datePicker setMaximumDate:maxDate];
        }
        if (minDate != nil) {
            [self.datePicker setMinimumDate:minDate];
        }
        if (currentDate != nil) {
            [self.datePicker setDate:currentDate animated:YES];
        }
    }
    return self;
}

@end
