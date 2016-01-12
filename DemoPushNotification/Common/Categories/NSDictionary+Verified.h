//
//  NSDictionary+Verified.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Verified)

- (id)verifiedObjectForKey:(id)aKey;
- (id)verifiedObjectForKey:(id)aKey withDefaultValue:(id)defaultValue;

@end
