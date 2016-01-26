//
//  NSString+DateFormat.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/26/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DateFormat)

+ (NSString *)defaultTimezone;

//ex: 2016-01-26 14:30
+ (NSString *)timeWithoutSecond;

//ex: 2016-01-26 14:30:34
+ (NSString *)timeWithSecond;

//ex: 2016-01-26 14:30:34+0700
+ (NSString *)timeWithTimeZone;

@end
