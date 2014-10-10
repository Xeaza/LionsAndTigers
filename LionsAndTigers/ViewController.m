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

-(void)viewWillAppear:(BOOL)animated
{
    //self.hudViewController = [[HUDViewController alloc] init];
    //self.hudViewController.delegate = self;
}

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
        self.topViewController = [navController.childViewControllers objectAtIndex:0];
        self.topViewController.delegate = self;
        //self.hudViewController = [[HUDViewController alloc] init];//[self.childViewControllers objectAtIndex:0];
        //self.hudViewController.delegate = self.topViewController;
        //NSLog(@"Navcontroller %@", [self.childViewControllers objectAtIndex:0]);
    }
    else if ([segue.identifier isEqualToString:@"HUDSegue"])
    {
        HUDViewController *hudViewController = segue.destinationViewController;
        hudViewController.delegate = self;
    }
}

-(void)lionsButtonTapped
{
    //NSLog(@"HUD delegate: %@", self.hudViewController.delegate);
    self.lionImages = [NSMutableArray array];
    [self.lionImages addObject:[UIImage imageNamed:@"lion_1"]];
    [self.lionImages addObject:[UIImage imageNamed:@"lion_2"]];
    [self.lionImages addObject:[UIImage imageNamed:@"lion_3"]];
    NSLog(@"Lions pressed");
}

-(void)tigersButtonTapped
{
    NSLog(@"Tigers!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
