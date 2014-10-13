//
//  ViewController.m
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "ViewController.h"
#import "HUDViewController.h"

@interface ViewController () <TopDelegate, HUDDelegate, UICollisionBehaviorDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLeadingSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTrailingSpaceConstraint;
@property BOOL isOpen;
@property NSMutableArray *lionImages;
@property HUDViewController *hudViewController;

@property UICollisionBehavior *collisionBehavior;
@property UIDynamicItemBehavior *dynamicsItemBehavior;
@property UIGravityBehavior *gravityBehavior;
@property UIPushBehavior *pushBehavior;
@property UIDynamicAnimator *dynamicsAnimator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)topRevalButtonTapped:(id)sender
{
    self.dynamicsAnimator     = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.collisionBehavior    = [[UICollisionBehavior alloc] initWithItems:[NSArray arrayWithObject:self.view]];
    self.gravityBehavior      = [[UIGravityBehavior alloc] initWithItems:[NSArray arrayWithObject:self.view]];
    self.dynamicsItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:[NSArray arrayWithObject:self.view]];
    self.pushBehavior         = [[UIPushBehavior alloc] initWithItems:[NSArray arrayWithObject:self.view] mode:UIPushBehaviorModeContinuous];

    [self.collisionBehavior addBoundaryWithIdentifier:@"bottom"
                                            fromPoint:CGPointMake(-10, self.view.frame.size.height)
                                              toPoint:CGPointMake(self.view.frame.size.height - 20, self.view.frame.size.height)];

    self.collisionBehavior.collisionDelegate = self;
    [self.gravityBehavior setGravityDirection:CGVectorMake(0, 0)];
    [self.dynamicsItemBehavior setElasticity:0.25];
    [self.dynamicsAnimator addBehavior:self.collisionBehavior];
    [self.dynamicsAnimator addBehavior:self.gravityBehavior];
    [self.dynamicsAnimator addBehavior:self.pushBehavior];
    [self.dynamicsAnimator addBehavior:self.dynamicsItemBehavior];

    if (!self.isOpen)
    {
        [self.topLeadingSpaceConstraint setConstant:300];
        [self.topTrailingSpaceConstraint setConstant:-300];
        self.isOpen = YES;
    }
    else
    {
        [self.topLeadingSpaceConstraint setConstant:0];
        [self.topTrailingSpaceConstraint setConstant:0];
        self.isOpen = NO;
    }

    // You can't put the above code to move the constraints in the animation block.
    // It won't animate. Putting self.view layoutIfNeed in the animation block will make
    // the change animate.
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
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
