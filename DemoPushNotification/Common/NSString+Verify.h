//
//  NSString+Verify.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verify)

+ (BOOL)isEmptyText:(NSString *)str;
+ (NSString *)verifyStringNotNull:(NSString *)str;

@end
