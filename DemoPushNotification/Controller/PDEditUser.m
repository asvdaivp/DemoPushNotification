//
//  PDEditUser.m
//  DemoPushNotification
//
//  Created by phuocdai on 1/12/16.
//  Copyright © 2016 phuocdai. All rights reserved.
//

#import "PDEditUser.h"

@interface PDEditUser (){
    
    __weak IBOutlet UIButton *btnDiscard;
    __weak IBOutlet UIButton *btnSave;
}

@end

@implementation PDEditUser

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
