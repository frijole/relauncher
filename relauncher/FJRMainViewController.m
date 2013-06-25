//
//  FJRMainViewController.m
//  relauncher
//

#import "FJRMainViewController.h"

#define FJRLaunchURLInfoKey         @"FJRLaunchURLInfoKey"
#define FJRLaunchURLPreferenceKey   @"FJRLaunchURLPreferenceKey"

@interface FJRMainViewController ()

@end

@implementation FJRMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // try to load the launch URL from the preferences
    [self setLaunchURL:[[NSUserDefaults standardUserDefaults] objectForKey:FJRLaunchURLPreferenceKey]];
    
    // if none, try the info.plist
    if ( !self.launchURL )
        [self setLaunchURL:[NSURL URLWithString:[[NSBundle mainBundle] objectForInfoDictionaryKey:FJRLaunchURLInfoKey]]];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ( self.launchURL )
        [self performSelector:@selector(launch) withObject:nil afterDelay:2.0f];
    else
    {
        UIAlertView *tmpAlertView = [[UIAlertView alloc] initWithTitle:@"relauncher"
                                                               message:[NSString stringWithFormat:@"unable to open the url:\n%@",self.launchURL]
                                                              delegate:nil
                                                     cancelButtonTitle:@"Bummer."
                                                     otherButtonTitles:nil];
        [tmpAlertView show];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)launch
{
    [[UIApplication sharedApplication] openURL:self.launchURL];
}

- (void)setLaunchURL:(NSURL *)launchURL
{
    // set it
    _launchURL = launchURL;
    
    // and save it
    [[NSUserDefaults standardUserDefaults] setObject:launchURL forKey:FJRLaunchURLPreferenceKey];
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FJRFlipsideViewController *)controller
{
    // save the url from the flip side
    [self setLaunchURL:[NSURL URLWithString:controller.textField.text]];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
