//
//  UserObject.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserObject : NSObject

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSNumber *roleTypeId;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) BOOL isDeleteFlag;
@property (nonatomic, strong) NSString *joinDate;
@property (nonatomic, strong) NSString *pushToken;

@end
