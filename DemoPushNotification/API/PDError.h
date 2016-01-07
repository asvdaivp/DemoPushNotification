//
//  PDError.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/7/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDError : NSObject

@property (nonatomic, strong) NSString *errorCode;
@property (nonatomic, strong) NSString *errorMessage;

+ (instancetype) errorFromDict:(id)errDict;

@end
