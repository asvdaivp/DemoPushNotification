//
//  PDBaseParser.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDBaseParser : NSObject

+ (NSArray *)parseJsonToList:(NSDictionary *)dictJson;
+ (id)parseJsonToObject:(NSDictionary *)dictJson;

@end
