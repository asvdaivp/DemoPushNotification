//
//  PDUserObjectParser.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDUserObjectParser.h"
#import "UserObject.h"
#import "NSDictionary+Verified.h"

@implementation PDUserObjectParser

+ (id)parseJsonToObject:(NSDictionary *)dictJson{
    NSString *user_id = [dictJson verifiedObjectForKey:PARAM_USER_ID withDefaultValue:@""];
    NSNumber *role_type_id = [dictJson verifiedObjectForKey:PARAM_ROLE_TYPE_ID];
    NSString *user_name = [dictJson verifiedObjectForKey:PARAM_USER_NAME withDefaultValue:@""];
    NSString *full_name = [dictJson verifiedObjectForKey:PARAM_FULL_NAME withDefaultValue:@""];
    NSString *email = [dictJson verifiedObjectForKey:PARAM_EMAIL withDefaultValue:@""];
    BOOL is_delete_flag = [[dictJson verifiedObjectForKey:PARAM_DELETE_FLAG] integerValue] == 0 ? NO:YES;
    NSString *join_date = [dictJson verifiedObjectForKey:PARAM_JOIN_DATE withDefaultValue:@""];
    NSString *push_token = [dictJson verifiedObjectForKey:PARAM_PUSH_TOKEN withDefaultValue:@""];
    
    UserObject *userObject = [[UserObject alloc]init];
    userObject.userId = user_id;
    userObject.roleTypeId = role_type_id;
    userObject.username = user_name;
    userObject.fullName = full_name;
    userObject.email = email;
    userObject.isDeleteFlag = is_delete_flag;
    userObject.joinDate = join_date;
    userObject.pushToken = push_token;
    
    return userObject;
}

+ (NSArray *)parseJsonToList:(NSDictionary *)dictJson{
    NSMutableArray *result = [NSMutableArray array];
    NSArray *userObjects = [dictJson verifiedObjectForKey:PARAM_LIST_USER];
    for (NSDictionary *userObjectDict in userObjects) {
        UserObject *userObj = [self parseJsonToObject:userObjectDict];
        [result addObject:userObj];
    }
    return result;
}

@end
