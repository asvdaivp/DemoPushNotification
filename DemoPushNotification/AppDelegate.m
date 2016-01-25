//
//  AppDelegate.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/5/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "AppDelegate.h"
#import "PDUser.h"
#import "PDUserDefault.h"
#import "PDLogin.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIUserNotificationType types  = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mysettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [application registerUserNotificationSettings:mysettings];
    [application registerForRemoteNotifications];
    
    if (![self checkLogin]) {
        [self showLoginViewController];
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSString *stringDeviceToken = [[[[deviceToken description]
                                     stringByReplacingOccurrencesOfString:@"<" withString:@""]
                                    stringByReplacingOccurrencesOfString:@">" withString:@""]
                                   stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"Device token: %@", stringDeviceToken);
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"Failed to get token, error: %@", error);
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"%@", userInfo);
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive) {
        NSLog(@"received push when app is running in the foreground");
    } else {
        NSLog(@"received push when app is running in the background, app closed");
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

- (BOOL)checkLogin{
    NSString *token = [PDUserDefault getToken];
    return ![token isEqualToString:@""];
}

- (void)showLoginViewController{
    PDLogin *rootView = (PDLogin *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginViewControllerID"];
    [self.window makeKeyAndVisible];
    [self.window.rootViewController dismissViewControllerAnimated:NO completion:nil];
    [self.window.rootViewController presentViewController:rootView animated:YES completion:nil];
    
}
@end
