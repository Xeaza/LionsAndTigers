//
//  HUDViewController.m
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "HUDViewController.h"

@interface HUDViewController ();

@end

@implementation HUDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"self Delegate in HUDVC: %@", self.delegate);
}

- (IBAction)lionPressed:(UIButton *)sender
{
    [self.delegate lionsButtonTapped];
    NSLog(@"HUD Delegate on lion pressed: %@", self.delegate);
    // When pressed say, Delegate I want you to initlize an array of lions and reload your data
}

- (IBAction)tigerPressed:(id)sender
{
    // When pressed say, Delegate I want you to initlize an array of tigers and reload your data
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
