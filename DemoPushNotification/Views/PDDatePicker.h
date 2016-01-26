//
//  PDDatePicker.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/26/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDDatePicker : UIView

@property (nonatomic, strong) UIDatePicker *datePicker;

- (id)initDateTimePickerWithCurrentDate:(NSDate *)currentDate andMaxdate:(NSDate *)maxDate andMinDate:(NSDate *)minDate;

@end
