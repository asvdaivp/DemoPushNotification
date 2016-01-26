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
#import "SVProgressHUD.h"

@interface PDListUser() <PDEditUserDelegate>{
    NSMutableArray *appendUsers;
}

@property (nonatomic, weak) NSMutableArray *datasource;

@end

@implementation PDListUser
@synthesize listUser;

- (void)viewDidLoad{
    self.mainTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];//remove cell empty in  UITableViewController
    [self.navigationController.navigationBar.topItem setTitle:@"List Users"];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    __weak PDListUser *weakSelf = self;
    appendUsers = [NSMutableArray array];
    weakSelf.datasource = listUser;
    [weakSelf.mainTableView addPullToRefreshWithActionHandler:^{
        [self showIndicator];
        [self reloadListUser];
    }];
    
    [weakSelf.mainTableView addInfiniteScrollingWithActionHandler:^{
        // if total of list < 10, don't need loadmore
        if ([listUser count] >10) {
            [weakSelf insertRowAtBottom];
        } else {
            [weakSelf.mainTableView.infiniteScrollingView stopAnimating];
        }
    }];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(removeUserAtIndexpath:)
                                                name:@"position_user"
                                              object:nil];
}

#pragma mark - Custom Method

- (void)showIndicator {
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
}

- (void)dismissIndicator {
    int64_t delayInSeconds = 2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

- (void)removeUserAtIndexpath:(NSNotification *)aNotification{
    NSDictionary *dictInfo = aNotification.userInfo;
    NSIndexPath *positionUser = [dictInfo valueForKey:@"indexPath"];
    NSLog(@"Delete at %ld", (long)[positionUser row]);
    [listUser removeObjectAtIndex:[positionUser row]];
    [self.mainTableView reloadData];
}

- (void)insertRowAtBottom{
    __weak PDListUser *weakSelf = self;
    int64_t delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [weakSelf.mainTableView beginUpdates];
        UserObject *aObject = [[UserObject alloc]init];
        aObject.fullName = @"daivp";
        aObject.joinDate = [NSString stringWithFormat:@"%@",[NSDate date]];
        [appendUsers addObject:aObject];
        [weakSelf.datasource addObject:aObject];
        [weakSelf.mainTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:weakSelf.datasource.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationBottom];
        [weakSelf.mainTableView endUpdates];
        [weakSelf.mainTableView.infiniteScrollingView stopAnimating];
    });
}

- (void)reloadListUser{
    [listUser removeObjectsInArray:appendUsers];
    [self.mainTableView reloadData];
    [self.mainTableView.pullToRefreshView stopAnimating];
    [self dismissIndicator];
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [listUser removeObjectAtIndex:[indexPath row]];
        [tableView reloadData];
    }
}

@end
