//
//  NSString+DateFormat.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/26/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "NSString+DateFormat.h"

@implementation NSString (DateFormat)

+ (NSString *)defaultTimezone {
//    http://stackoverflow.com/questions/2892290/where-can-i-get-a-list-of-abbreviations-for-timezonewithabbreviation
    return @"JST"; //VietNam: ICT ; Japan: JST 
}

+ (NSString *)timeWithoutSecond {
    return @"yyyy-MM-dd HH:mm";
}

+ (NSString *)timeWithSecond {
    return @"yyyy-MM-dd HH:mm:ss";
}

+ (NSString *)timeWithTimeZone {
    return @"yyyy-MM-dd HH:mm:00ZZZ";
}

@end
