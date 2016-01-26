//
//  NSDate+Utils.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/26/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+DateFormat.h"

@interface NSDate (Utils)

+ (NSString *)stringFromDate:(NSDate *)aDate;
+ (NSString *)stringFromDate:(NSDate *)aDate withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)aDate withFormat:(NSString *)format withTimeZone:(NSString *)timeZone;

+ (NSDate *)dateFromString:(NSString *)aStringDate;
+ (NSDate *)dateFromString:(NSString *)aStringDate withFormat:(NSString *)format;
+ (NSDate *)dateFromString:(NSString *)aStringDate withFormat:(NSString *)format withTimeZone:(NSString *)timeZone;

@end
