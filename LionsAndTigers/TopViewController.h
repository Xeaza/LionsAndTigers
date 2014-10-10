//
//  TopViewController.h
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HUDViewController.h"

@protocol TopDelegate

-(void)topRevalButtonTapped:(id)sender;

@end

@interface TopViewController : UIViewController

@property id <TopDelegate> delegate;

- (void)showMeTigers;
- (void)showMeLions;

@end
