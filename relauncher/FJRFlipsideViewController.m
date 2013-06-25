//
//  FJRFlipsideViewController.m
//  relauncher
//

#import "FJRFlipsideViewController.h"

@interface FJRFlipsideViewController ()

@end

@implementation FJRFlipsideViewController

- (void)awakeFromNib
{
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

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

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    // if the field contains a valid URL, we're done here.
    if ( [NSURL URLWithString:self.textField.text] )
    {
        [self.delegate flipsideViewControllerDidFinish:self];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self done:nil];
    
    return NO;
}

@end
