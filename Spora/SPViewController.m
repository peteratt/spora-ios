//
//  SampleRoutingViewController.m
//  Messly
//
//  Created by Pedro Alvarez-Tabio on 4/14/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import "SPViewController.h"
#import "SPConnectionManager.h"
#import "SPLocationManager.h"

@interface SPViewController ()

@end

@implementation SPViewController

@synthesize
textContent = _textContent;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendButton:(UIButton *)sender {
    // Send the content of the outlet
    [[SPConnectionManager sharedInstance] sendMessageWithText:_textContent.text andLocation:[[SPLocationManager sharedInstance] getUserLocation]];
}
- (IBAction)refreshButtonClick:(UIButton *)sender {
    // Get new messages
    [[SPConnectionManager sharedInstance] getMessagesForLocation:[[SPLocationManager sharedInstance] getUserLocation]];
}
@end
