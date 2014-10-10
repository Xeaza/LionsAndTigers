//
//  ViewController.m
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <TopDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLeadingSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTrailingSpaceConstraint;
@property BOOL isOpen;

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

    if ([segue.identifier isEqualToString:@"NavigationSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        TopViewController *topViewController = [navController.childViewControllers objectAtIndex:0];
        topViewController.delegate = self;
    }
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
