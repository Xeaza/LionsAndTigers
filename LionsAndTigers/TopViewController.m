//
//  TopViewController.m
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "TopViewController.h"
#import "CustomCollectionViewCell.h"

@interface TopViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic)  NSMutableArray *photosArray;
@property HUDViewController *hudViewController;
@end

@implementation TopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Initlize an array filled with lions for the collection view
    self.photosArray = [NSMutableArray array];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_1"]];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_2"]];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_3"]];

    self.hudViewController = [[HUDViewController alloc] init];
}

- (IBAction)onHamburglerButtonPressed:(id)sender
{
    // Tell my delegate that I pressed the topRevalButton
    [self.delegate topRevalButtonTapped:self];
}

- (void)showMeLions
{
    // Reinitlize photosArray (not sure if I have to do that) and then
    // fill it with hungry lions
    self.photosArray = [NSMutableArray array];
    [self.photosArray addObject:[UIImage imageNamed:@"lion_1"]];
    [self.photosArray addObject:[UIImage imageNamed:@"lion_2"]];
    [self.photosArray addObject:[UIImage imageNamed:@"lion_3"]];
    [self.collectionView reloadData];
    // Shut the topViewController
    [self.delegate topRevalButtonTapped:self];
}

- (void)showMeTigers
{
    // Reinitlize photosArray (not sure if I have to do that) and then
    // fill it with hungry tigers
    self.photosArray = [NSMutableArray array];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_1"]];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_2"]];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_3"]];
    [self.collectionView reloadData];
    // Shut the topViewController
    [self.delegate topRevalButtonTapped:self];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photosArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image = [self.photosArray objectAtIndex:indexPath.row];

    return cell;
}

@end
