//
//  NSDate+Utils.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/26/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

+ (NSString *)stringFromDate:(NSDate *)aDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[NSString timeWithSecond]];
    return [dateFormatter stringFromDate:aDate];
}

+ (NSString *)stringFromDate:(NSDate *)aDate withFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:aDate];
}

+ (NSString *)stringFromDate:(NSDate *)aDate withFormat:(NSString *)format withTimeZone:(NSString *)timeZone {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:timeZone]];
    return [dateFormatter stringFromDate:aDate];
}

+ (NSDate *)dateFromString:(NSString *)aStringDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[NSString timeWithSecond]];
    return [dateFormatter dateFromString:aStringDate];
}

+ (NSDate *)dateFromString:(NSString *)aStringDate withFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter dateFromString:aStringDate];
}

+ (NSDate *)dateFromString:(NSString *)aStringDate withFormat:(NSString *)format withTimeZone:(NSString *)timeZone {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:timeZone]];
    return [dateFormatter dateFromString:aStringDate];
}

@end
