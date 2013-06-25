//
//  FJRFlipsideViewController.h
//  relauncher
//
//  Created by Ian Meyer on 6/25/13.
//  Copyright (c) 2013 @frijole. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FJRFlipsideViewController;

@protocol FJRFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FJRFlipsideViewController *)controller;
@end

@interface FJRFlipsideViewController : UIViewController

@property (weak, nonatomic) id <FJRFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
