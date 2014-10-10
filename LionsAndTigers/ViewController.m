//
//  ViewController.m
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ViewController.h"
#import "HUDViewController.h"

@interface ViewController () <TopDelegate, HUDDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLeadingSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTrailingSpaceConstraint;
@property BOOL isOpen;
@property NSMutableArray *lionImages;
@property HUDViewController *hudViewController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)topRevalButtonTapped:(id)sender
{
    if (!self.isOpen) {
        [self.topLeadingSpaceConstraint setConstant:300];
        self.isOpen = YES;
    }
    else
    {
        [self.topLeadingSpaceConstraint setConstant:0];
        self.isOpen = NO;
    }
//    [UIView animateWithDuration:3.0 animations:^{
//
//    }];

    NSLog(@"🍔");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"NavigationSegue"])
    {
        // Tell topViewController that I (ViewController) will be it's delegate
        UINavigationController *navController = segue.destinationViewController;
        self.topViewController = [navController.childViewControllers objectAtIndex:0];
        self.topViewController.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"HUDSegue"])
    {
        // Tell hudViewController that I (ViewController) will be it's delegate
        HUDViewController *hudViewController = segue.destinationViewController;
        hudViewController.delegate = self;
    }
}

-(void)lionsButtonTapped
{
    // I can call showMeLions on topViewController because I'm it's delegate
    [self.topViewController showMeLions];
}

-(void)tigersButtonTapped
{
    // I can call showMeTigers on topViewController because I'm it's delegate
    [self.topViewController showMeTigers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
