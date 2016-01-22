//
//  ViewController.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/5/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDHTTPClient.h"
#import "UserObject.h"

@interface PDUserDetail : UIViewController <PDHTTPClientDelegate>

@property (nonatomic, strong) UserObject *userObj;
@property (nonatomic, strong) NSIndexPath *selectedIndexPathFromList;

@end

