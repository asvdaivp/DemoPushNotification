//
//  PDUserDefault.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDUser.h"

@interface PDUserDefault : NSObject

+ (void)saveObject:(id)object forKey:(NSString *)key;
+ (id)objectForKey:(NSString *)key;

+ (NSString *)getUserName;
+ (void)saveCurrentUserName:(NSString *)currentUsername;

+ (void)saveUserInformation:(PDUser *)user;
+ (PDUser *)getUserInformation;

+ (void)saveCurrentToken:(NSString *)currentToken;
+ (NSString *)getToken;

+ (void)resetUserDefaults;
@end
