//
//  PDListManager.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDListUser.h"
#import "PDListUserCell.h"
#import "PDUserDetail.h"
#import "UserObject.h"

@implementation PDListUser
@synthesize listUser;

- (void)showUserDetailAtIndexPath:(NSIndexPath *)indexPath{
    PDUserDetail *userDetailVC = (PDUserDetail *)[self.storyboard instantiateViewControllerWithIdentifier:@"PDUserDetailID"];
    userDetailVC.userObj = listUser[indexPath.row];
    [self.navigationController pushViewController:userDetailVC animated:YES];
}

#pragma mark - UITableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [listUser count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID =@"PDListUserCellID";
    PDListUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    UserObject *userObj = listUser[indexPath.row];
    cell.lblFullname.text = userObj.fullName;
    cell.lblJoinDate.text = userObj.joinDate;
    cell.thumbImageView.image = [UIImage imageNamed:@"defaultImage"];
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self showUserDetailAtIndexPath:indexPath];
}

@end
