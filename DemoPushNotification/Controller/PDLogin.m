//
//  LoginViewController.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/8/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDLogin.h"
#import "PDUser.h"
#import "PDUserDefault.h"
#import "PDParamsDefine.h"
#import "PDListUser.h"

@interface PDLogin(){
    
    __weak IBOutlet UITextField *lblUsername;
    __weak IBOutlet UITextField *lblPassword;
    __weak IBOutlet UIButton *btnLogin;
}
@end

@implementation PDLogin

- (void)viewDidLoad{
    [self setupUI];
    NSString *username = ((PDUser *)[PDUserDefault getUserInformation]).username;
    if (username) {
        lblUsername.text = username;
    }
}

- (void)setupUI{
    btnLogin.layer.borderWidth = 1.0f;
    btnLogin.layer.cornerRadius = 5.0f;
    btnLogin.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

- (IBAction)didTouchOnLoginButton:(id)sender {
    [self doLogin];
}

- (void)doLogin{
    NSString *username = lblUsername.text;
    if (username != nil) {
        NSString *token = @"c0b04b9f055d196a628832905561a7a1036dafec513d82cb15905773bf68375f";
        NSDictionary *dictUser = @{PARAM_USER_NAME : username};
        PDUser *user = [PDUser createUserInfoWithData:dictUser];
        [PDUserDefault saveUserInformation:user];
        [PDUserDefault saveCurrentToken:token];
        [self jumpToUserDetail];
    } else {
        NSLog(@"Username is null");
    }
}

- (void)jumpToListUser{
    PDListUser *listUserVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PDListUserID"];
    UINavigationController *listUserNAV = [[UINavigationController alloc] initWithRootViewController:listUserVC];
    [self presentViewController:listUserNAV animated:YES completion:nil];
}

-(void)jumpToUserDetail{
    [self performSegueWithIdentifier:@"login_identifier" sender:nil];
}

@end