//
//  TopViewController.m
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "TopViewController.h"
#import "CustomCollectionViewCell.h"
#import "HUDViewController.h"

@interface TopViewController () <HUDDelegate, UICollectionViewDataSource, UICollectionViewDelegate>


@property NSMutableArray *currentImages;
@end

@implementation TopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.currentImages = [NSMutableArray array];
//    self.hudViewController = [[HUDViewController alloc] init];
//    self.hudViewController.delegate = self;
    //[self tigersButtonTapped];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.currentImages = [NSMutableArray array];
    self.hudViewController = [[HUDViewController alloc] init];
    self.hudViewController.delegate = self;
    NSLog(@"HUD Delegate in TopVC: %@", self.hudViewController.delegate);
    NSLog(@"self Delegate in TopVC: %@", self.delegate);
}

- (IBAction)onHamburglerButtonPressed:(id)sender
{
    [self.delegate topRevalButtonTapped:self.hudViewController];
}

- (void)tigersButtonTapped
{
    NSLog(@"🐯");
}

- (void)lionsButtonTapped:(NSMutableArray *)lions
{
    self.currentImages = lions;
    NSLog(@"🐨");
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.currentImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image = [self.currentImages objectAtIndex:indexPath.row];

    return cell;
}

@end
