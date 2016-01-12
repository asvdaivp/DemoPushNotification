//
//  NSString+Verify.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "NSString+Verify.h"

@implementation NSString (Verify)

+ (BOOL)isEmptyText:(NSString *)str{
    if (str == nil) {
        return YES;
    } else if ([str isKindOfClass:[NSNull class]]){
        return YES;
    } else if ([str length] == 0){
        return YES;
    } else{
        NSString *trimmedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if ([trimmedString length] == 0) {
            return YES;
        } else {
            return NO;
        }
    }
}

+ (NSString *)verifyStringNotNull:(NSString *)str{
    if (![str isKindOfClass:[[NSNull null] class]]) {
        return str;
    }
    return @"";
}

@end
