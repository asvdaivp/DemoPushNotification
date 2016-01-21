//
//  PDEditUser.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDEditUser.h"

@interface PDEditUser (){
    
    __weak IBOutlet UITextField *txtUsername;
    __weak IBOutlet UITextField *txtFullName;
    __weak IBOutlet UITextField *txtEmail;
    __weak IBOutlet UITextField *txtJoinDate;
    __weak IBOutlet UITextField *txtNewPass;
    __weak IBOutlet UITextField *txtConfirmPass;
    __weak IBOutlet UIButton *btnDiscard;
    __weak IBOutlet UIButton *btnSave;
}

@end

@implementation PDEditUser
@synthesize userObj;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI{
    btnDiscard.layer.borderWidth = 1.0f;
    btnDiscard.layer.cornerRadius = 5.0f;
    btnDiscard.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    btnSave.layer.borderWidth = 1.0f;
    btnSave.layer.cornerRadius = 5.0f;
    btnSave.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    
    //Display user information to edit
    txtUsername.text = userObj.username;
    txtFullName.text = userObj.fullName;
    txtEmail.text = userObj.email;
    txtJoinDate.text = userObj.joinDate;
}

- (IBAction)didTouchOnDiscardButton:(id)sender {
}

- (IBAction)didTouchOnSaveButton:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
