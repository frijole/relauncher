//
//  FJRFlipsideViewController.h
//  relauncher
//

#import <UIKit/UIKit.h>

@class FJRFlipsideViewController;

@protocol FJRFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FJRFlipsideViewController *)controller;
@end

@interface FJRFlipsideViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <FJRFlipsideViewControllerDelegate> delegate;

@property IBOutlet UITextField *textField;

- (IBAction)done:(id)sender;

@end
