//
//  PDListUserCell.h
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDListUserCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblFullname;
@property (weak, nonatomic) IBOutlet UILabel *lblJoinDate;
@property (weak, nonatomic) IBOutlet UIView *contentViewCell;

@end
