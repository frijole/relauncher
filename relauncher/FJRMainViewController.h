//
//  FJRMainViewController.h
//  relauncher
//

#import "FJRFlipsideViewController.h"

@interface FJRMainViewController : UIViewController <FJRFlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (strong, nonatomic) NSURL *launchURL;

@end
