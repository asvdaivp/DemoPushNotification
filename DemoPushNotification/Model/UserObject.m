//
//  UserObject.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "UserObject.h"

@implementation UserObject

//@dynamic userId;
//@dynamic roleTypeId;
//@dynamic username;
//@dynamic fullName;
//@dynamic email;
//@dynamic isDeleteFlag;
//@dynamic joinDate;
//@dynamic pushToken;

- (NSString *)description{
    return [NSString stringWithFormat:@"user_id: %@ | role_type_id: %@ | username: %@ | full_name: %@ | email: %@ | join_date: %@ | push_token: %@", self.userId, self.roleTypeId, self.username, self.fullName, self.email,self.joinDate, self.pushToken];
}

- (id)init {
    if (self =[super init]) {
        return self;
    } else {
        return nil;
    }
}

@end
