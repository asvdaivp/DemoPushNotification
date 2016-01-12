//
//  NSDictionary+Verified.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "NSDictionary+Verified.h"

@implementation NSDictionary (Verified)

- (id)verifiedObjectForKey:(id)aKey{
    if ([self objectForKey:aKey] && ![[self objectForKey:aKey] isKindOfClass:[NSNull class]]) {
        return [self objectForKey:aKey];
    }
    return nil;
}

- (id)verifiedObjectForKey:(id)aKey withDefaultValue:(id)defaultValue{
    if ([self objectForKey:aKey] && ![[self objectForKey:aKey] isKindOfClass:[NSNull class]]) {
        return [self objectForKey:aKey];
    }
    return defaultValue;
}

@end
