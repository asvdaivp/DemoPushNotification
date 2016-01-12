//
//  PDUser.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDUser.h"
#import "NSDictionary+Verified.h"
#import "PDParamsDefine.h"

@implementation PDUser

- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.username forKey:@"username"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.username = [decoder decodeObjectForKey:@"username"];
    }
    return self;
}

- (instancetype)initInfoWithData:(id)data{
    if (self = [super init]) {
        NSString *username = [data verifiedObjectForKey:PARAM_USER_NAME withDefaultValue:@""];
        self.username = username;
    }
    return self;
}

+ (instancetype)createUserInfoWithData:(id)data{
    return [[self alloc]initInfoWithData:data];
}

@end
