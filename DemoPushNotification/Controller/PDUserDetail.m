//
//  ViewController.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/5/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDUserDetail.h"
#import "PDError.h"
#import "PDUser.h"
#import "PDUserDefault.h"
#import "PDParamsDefine.h"

@interface PDUserDetail (){
    PDHTTPClient *httpClient;
    
    __weak IBOutlet UIImageView *imageUser;
    __weak IBOutlet UILabel *lblUsername;
    __weak IBOutlet UILabel *lblFullName;
    __weak IBOutlet UILabel *lblEmail;
    __weak IBOutlet UILabel *lblJoinDate;
    __weak IBOutlet UIButton *btnLogout;
}

@end

@implementation PDUserDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHttpClient];
    [self setupUI];
}

- (void)initHttpClient{
    httpClient = [PDHTTPClient sharedPDHTTPClient];
    httpClient.delegate = self;
}

- (void)setupUI{
    btnLogout.layer.borderWidth = 1.0f;
    btnLogout.layer.cornerRadius = 5.0f;
    btnLogout.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

#pragma mark - Handle event

- (IBAction)didTouchOnResetButton:(id)sender {
    NSDictionary *params = @{@"secret_token": @""};
    [httpClient apiResetIconWithParams:params];
}
- (IBAction)didTouchOnLogoutButton:(id)sender {
//    [PDUserDefault saveObject:@"" forKey:@""];
    [PDUserDefault saveCurrentToken:@""];
    [self performSegueWithIdentifier:@"logout_identifier" sender:nil];
}

#pragma mark - HTTPClient apiResetIcon

- (void)resetIconHTTPClient:(PDHTTPClient *)client didReset:(id)obj bussinessError:(PDError *)aBussiness{
    if (aBussiness) {
        NSLog(@"bussiness error: %@",[aBussiness errorMessage]);
    } else {
        NSLog(@"success: %@",obj);
    }
}

- (void)resetIconHTTPClient:(PDHTTPClient *)client didFailedReset:(NSError *)error{
    NSLog(@"Failed reset: %@", [error description]);
}

@end
