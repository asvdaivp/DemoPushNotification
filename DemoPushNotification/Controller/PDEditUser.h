//
//  PDEditUser.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserObject.h"
#import "PDDatePicker.h"
@class PDEditUser;
@class UserObject;

@protocol PDEditUserDelegate <NSObject>

@optional
- (void) didDeleteAUserAt:(PDEditUser *)editUserVC atIndexPath:(NSIndexPath *)indexPath;
- (void) didUpdateAUserAt:(PDEditUser *)editUserVC updateUser:(UserObject *)user atIndexPath:(NSIndexPath *)indexPath;

@end

@interface PDEditUser : UIViewController

@property (nonatomic, strong) id<PDEditUserDelegate> delegate;
@property (nonatomic, strong) UserObject *userObj;
@property (nonatomic, strong) NSIndexPath *selectedIndexPathFromList;

@end
