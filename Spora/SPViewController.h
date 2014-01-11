//
//  SampleRoutingViewController.h
//  Messly
//
//  Created by Pedro Alvarez-Tabio on 4/14/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPViewController : UIViewController
- (IBAction)sendButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *textContent;
- (IBAction)refreshButtonClick:(UIButton *)sender;

@end
