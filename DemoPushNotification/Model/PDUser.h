//
//  PDUser.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDUser : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *phoneNumber;

+ (instancetype)createUserInfoWithData:(id)data;

@end
