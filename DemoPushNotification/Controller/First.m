//
//  ViewController.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/5/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "First.h"
#import "PDError.h"

@interface First (){
    PDHTTPClient *httpClient;
}

@end

@implementation First

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHttpClient];
}

- (void)initHttpClient{
    httpClient = [PDHTTPClient sharedPDHTTPClient];
    httpClient.delegate = self;
}

- (IBAction)didTouchOnResetButton:(id)sender {
    NSDictionary *params = @{@"secret_token": @""};
    [httpClient apiResetIconWithParams:params];
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
