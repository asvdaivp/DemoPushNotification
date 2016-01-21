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
#import "PDUserObjectParser.h"

@interface PDLogin(){
    
    __weak IBOutlet UITextField *lblUsername;
    __weak IBOutlet UITextField *lblPassword;
    __weak IBOutlet UIButton *btnLogin;
    NSArray *listUsers;
}
@end

@implementation PDLogin

- (void)viewDidLoad{
    [self setupUI];
    NSString *username = ((PDUser *)[PDUserDefault getUserInformation]).username;
    if (username) {
        lblUsername.text = username;
    }
    
    NSData *data = [[self readDummyDataFromFile] dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    listUsers = [PDUserObjectParser parseJsonToList:json];
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
        [self jumpToListUser];
    } else {
        NSLog(@"Username is null");
    }
}

- (void)jumpToListUser{
    PDListUser *listUserVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PDListUserID"];
    UINavigationController *listUserNAV = [[UINavigationController alloc] initWithRootViewController:listUserVC];
    listUserVC.listUser = listUsers;
    [self presentViewController:listUserNAV animated:YES completion:nil];
}

-(void)jumpToUserDetail{
    [self performSegueWithIdentifier:@"login_identifier" sender:nil];
}

-(NSString *)readDummyDataFromFile{
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"DummyData" ofType:@"json"];
    NSError * error;
    NSString* fileContents;
    if (error) {
        fileContents = @"";
        NSLog(@"Error read data from file");
    } else {
        fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    }
    return fileContents;
}



@end
