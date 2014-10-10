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
}

- (IBAction)lionPressed:(UIButton *)sender
{
    // Tell my delegate (ViewController) to exicute the method lionsButtonTapped
    // becuase I pressed on the lion button
    [self.delegate lionsButtonTapped];
}

- (IBAction)tigerPressed:(id)sender
{
    // Tell my delegate (ViewController) to exicute the method tigerButtonTapped
    // becuase I pressed on the tiger button
    [self.delegate tigersButtonTapped];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
