//
//  FJRFlipsideViewController.m
//  relauncher
//
//  Created by Ian Meyer on 6/25/13.
//  Copyright (c) 2013 @frijole. All rights reserved.
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
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end