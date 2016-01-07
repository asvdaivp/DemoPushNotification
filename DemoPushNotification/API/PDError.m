//
//  PDError.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/7/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDError.h"

@implementation PDError

- (instancetype)initErrorFromDict:(id)errorDict{
    NSDictionary *aErrorDict = errorDict[@"error"];
    if (aErrorDict) {
        if (self = [super init]) {
            self.errorCode = aErrorDict[@"error_code"];
            self.errorMessage = aErrorDict[@"error_message"];
        }
        return self;
    } else {
        return nil;
    }
}

+ (instancetype)errorFromDict:(id)errDict{
    return [[self alloc]initErrorFromDict:errDict];
}

@end
