//
//  PDUserDefault.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDUserDefault.h"
#import "PDParamsDefine.h"

@implementation PDUserDefault

+ (void)saveObject:(id)object forKey:(NSString *)key{
    if (key == nil) {
        return;
    }
    if (object != nil) {
        [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (id)objectForKey:(NSString *)key{
    if (key != nil) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    } else {
        return nil;
    }
}

+ (NSString *)getUserName{
    NSString *username = [NSKeyedUnarchiver unarchiveObjectWithData:[self objectForKey:PARAM_USERNAME]];
    return username;
}

+ (void)saveCurrentUserName:(NSString *)currentUsername{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:currentUsername];
    [self saveObject:encodedObject forKey:PARAM_USERNAME];
}

+ (void)saveUserInformation:(PDUser *)user{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    [self saveObject:encodedObject forKey:@"UserInformation"];
}

+ (PDUser *)getUserInformation{
    PDUser *object = [NSKeyedUnarchiver unarchiveObjectWithData:[self objectForKey:@"UserInformation"]];
    return object;
}

+ (NSString *)getToken{
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithData:[self objectForKey:PARAM_TOKEN]];
    return token;
}

+ (void)saveCurrentToken:(NSString *)currentToken{
    NSData *encodedToken = [NSKeyedArchiver archivedDataWithRootObject:currentToken];
    [self saveObject:encodedToken forKey:PARAM_TOKEN];
}

+ (void)resetUserDefaults{
    NSUserDefaults *userDefs = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = [userDefs dictionaryRepresentation];
    for (id key in dict) {
        [userDefs removeObjectForKey:key];
    }
    [userDefs synchronize];
}


@end
