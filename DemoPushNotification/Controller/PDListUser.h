//
//  PDListManager.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDListUser : UITableViewController

@property (nonatomic, strong) NSMutableArray *listUser;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end
