//
//  SettingsViewController.m
//  EasyCards
//
//  Created by Mohammad Azam on 12/2/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()<UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *nameTextField;
@property (nonatomic,weak) IBOutlet UISwitch *startAdvertisingSwitch;

@end

@implementation SettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    // get the new advertiser name
    Card *card = [Card cardFromArchive];
    card.name = textField.text;
    
    [card archive];
    
    [[PeerHelper sharedHelper] restart];
   
    return [textField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setup];
}

-(void) setup
{
    [self.startAdvertisingSwitch addTarget:self action:@selector(startAdvertisingValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    // unarchive the card
    Card *card = [Card cardFromArchive];
    
    if(card)
    {
        self.nameTextField.text = card.name;
    }
}

-(void) startAdvertisingValueChanged:(id) sender
{
    if([sender isOn])
    {
        [[PeerHelper sharedHelper] start];
    }
    else
    {
        [[PeerHelper sharedHelper] stop];
    }
}

-(IBAction) done:(id) sender
{
    Card *card = [[Card alloc] init];
    card.name = self.nameTextField.text;

    [card archive];

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
