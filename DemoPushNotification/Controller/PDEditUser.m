//
//  PDEditUser.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDEditUser.h"

@interface PDEditUser ()<UITextFieldDelegate>{
    
    __weak IBOutlet UITextField *txtUsername;
    __weak IBOutlet UITextField *txtFullName;
    __weak IBOutlet UITextField *txtEmail;
    __weak IBOutlet UITextField *txtJoinDate;
    __weak IBOutlet UITextField *txtNewPass;
    __weak IBOutlet UITextField *txtConfirmPass;
    __weak IBOutlet UIButton *btnDiscard;
    __weak IBOutlet UIButton *btnSave;
    __weak IBOutlet UIScrollView *scrollView;
    UITextField *activeField;
}

@end

@implementation PDEditUser
@synthesize userObj, selectedIndexPathFromList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    [self registerForKeyboardNotifications];
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
    
    //set delegate text field
    txtUsername.delegate = self;
    txtFullName.delegate = self;
    txtEmail.delegate = self;
    txtJoinDate.delegate = self;
    txtNewPass.delegate = self;
    txtConfirmPass.delegate = self;
}

#pragma mark - Custom Method

- (void)registerForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardWasShown:(NSNotification *)aNotification{
    NSDictionary *info = [aNotification userInfo];
    NSLog(@"%@", info);
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillBeHidden:(NSNotification *)aNotification{
    int statusAndNavHeight = 64.0;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(statusAndNavHeight, 0.0, 0.0, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
}

#pragma mark - UI Event

- (IBAction)didTouchOnDiscardButton:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (IBAction)didTouchOnSaveButton:(id)sender {
    userObj.username = txtUsername.text;
    userObj.fullName = txtFullName.text;
    userObj.email = txtEmail.text;
    userObj.joinDate = txtJoinDate.text;    
    [self.delegate didUpdateAUserAt:self updateUser:userObj atIndexPath:selectedIndexPathFromList];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    activeField = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
