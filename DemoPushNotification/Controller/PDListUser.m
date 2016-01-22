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
#import "PDEditUser.h"
#import "UIScrollView+SVPullToRefresh.h"
#import "UIScrollView+SVInfiniteScrolling.h"

@interface PDListUser() <PDEditUserDelegate>{
}

@property (nonatomic, weak) NSMutableArray *datasource;

@end

@implementation PDListUser
@synthesize listUser;

- (void)viewDidLoad{
    [self.navigationController.navigationBar.topItem setTitle:@"List Users"];
    __weak PDListUser *weakSelf = self;

    weakSelf.datasource = listUser;
    [weakSelf.mainTableView addPullToRefreshWithActionHandler:^{
        NSLog(@"===");
    }];
    
    [weakSelf.mainTableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf insertRowAtBottom];
    }];
}

#pragma mark - Custom Method

- (void)insertRowAtBottom{
    __weak PDListUser *weakSelf = self;
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [weakSelf.mainTableView beginUpdates];
        UserObject *aObject = [[UserObject alloc]init];
        aObject.fullName = @"daivp";
        aObject.joinDate = @"sdfds";
        [weakSelf.datasource addObject:aObject];
        [weakSelf.mainTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:weakSelf.datasource.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
        [weakSelf.mainTableView endUpdates];
        [weakSelf.mainTableView.infiniteScrollingView stopAnimating];
    });
}

- (void)showUserDetailAtIndexPath:(NSIndexPath *)indexPath{
    PDUserDetail *userDetailVC = (PDUserDetail *)[self.storyboard instantiateViewControllerWithIdentifier:@"PDUserDetailID"];
    userDetailVC.userObj = listUser[indexPath.row];
    userDetailVC.selectedIndexPathFromList = indexPath;
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
