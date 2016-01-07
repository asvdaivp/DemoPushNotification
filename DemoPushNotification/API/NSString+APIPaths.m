//
//  NSString+APIPaths.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/7/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "NSString+APIPaths.h"

@implementation NSString (APIPaths)

+ (NSURL *)baseURL{
    return [NSURL URLWithString:@"http://192.168.1.107"];
}

+ (NSString *)resetIconURL{
    return @"api/reset-badge";
}

@end
