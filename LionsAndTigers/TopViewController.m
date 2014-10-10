//
//  TopViewController.m
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import "TopViewController.h"
#import "CustomCollectionViewCell.h"

@interface TopViewController () <UICollectionViewDataSource, UICollectionViewDelegate, HUDDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic)  NSMutableArray *photosArray;
@property HUDViewController *hudViewController;
@end

@implementation TopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photosArray = [NSMutableArray array];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_1"]];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_2"]];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_3"]];
    // Do any additional setup after loading the view.
    self.hudViewController = [[HUDViewController alloc] init];
    // Didn't work here
    //[self.hudViewController setDelegate:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

//    self.hudViewController = [[HUDViewController alloc] init];
//    self.hudViewController.delegate = self;
//    NSLog(@"HUD Delegate in TopVC: %@", self.hudViewController.delegate);
    NSLog(@"self Delegate in TopVC: %@", self.delegate);
}

- (IBAction)onHamburglerButtonPressed:(id)sender
{
    [self.delegate topRevalButtonTapped:self];
    NSLog(@"dlkj %@", self);
    // Setting delegate here doens't work... even though self.hudViewController is not nil
    //self.hudViewController.delegate = self;
}

- (void)lionsButtonTapped
{
    self.photosArray = [NSMutableArray array];
    [self.photosArray addObject:[UIImage imageNamed:@"lion_1"]];
    [self.photosArray addObject:[UIImage imageNamed:@"lion_2"]];
    [self.photosArray addObject:[UIImage imageNamed:@"lion_3"]];
    //[self.delegate tigersButtonTapped];;
    [self.collectionView reloadData];
    NSLog(@"Lions loaded 🐨");
}

- (void)tigersButtonTapped
{
    self.photosArray = [NSMutableArray array];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_1"]];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_2"]];
    [self.photosArray addObject:[UIImage imageNamed:@"tiger_3"]];
    //[self.delegate tigersButtonTapped];;
    [self.collectionView reloadData];
    NSLog(@"Tigers loaded 🐧");
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
