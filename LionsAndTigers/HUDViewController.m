//
//  HUDViewController.m
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "HUDViewController.h"

@interface HUDViewController ()

@property NSMutableArray *tigerImages;
@property NSMutableArray *lionImages;

@end

@implementation HUDViewController

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//
//}

- (IBAction)lionPressed:(id)sender
{
    NSLog(@"HUD delegate: %@", self.delegate);
    self.lionImages = [NSMutableArray array];
    [self.lionImages addObject:[UIImage imageNamed:@"lion_1"]];
    [self.lionImages addObject:[UIImage imageNamed:@"lion_2"]];
    [self.lionImages addObject:[UIImage imageNamed:@"lion_3"]];
    
    [self.delegate lionsButtonTapped:self.lionImages];
}

- (IBAction)tigerPressed:(id)sender
{
    self.tigerImages = [NSMutableArray array];
    [self.tigerImages addObject:[UIImage imageNamed:@"tiger_1"]];
    [self.tigerImages addObject:[UIImage imageNamed:@"tiger_2"]];
    [self.tigerImages addObject:[UIImage imageNamed:@"tiger_3"]];
    [self.delegate tigersButtonTapped];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
