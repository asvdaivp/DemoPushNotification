//
//  PDHTTPClient.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/7/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@class PDError;
@protocol PDHTTPClientDelegate;

@interface PDHTTPClient : AFHTTPSessionManager

@property (nonatomic, assign) id <PDHTTPClientDelegate> delegate;

+ (PDHTTPClient *)sharedPDHTTPClient;

- (void) apiResetIconWithParams:(NSDictionary *)params;

@end

@protocol PDHTTPClientDelegate <NSObject>

@optional

- (void)resetIconHTTPClient:(PDHTTPClient *)client didReset:(id)obj bussinessError:(PDError *)aBussiness;
- (void)resetIconHTTPClient:(PDHTTPClient *)client didFailedReset:(NSError *)error;

@end
