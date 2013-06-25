//
//  FJRMainViewController.h
//  relauncher
//
//  Created by Ian Meyer on 6/25/13.
//  Copyright (c) 2013 @frijole. All rights reserved.
//

#import "FJRFlipsideViewController.h"

@interface FJRMainViewController : UIViewController <FJRFlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
