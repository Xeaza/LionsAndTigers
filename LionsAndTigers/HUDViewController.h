//
//  HUDViewController.h
//  LionsAndTigers
//
//  Created by Taylor Wright-Sanson on 10/9/14.
//  Copyright (c) 2014 Taylor Wright-Sanson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopViewController.h"

@protocol HUDDelegate

- (void)tigersButtonTapped;
- (void)lionsButtonTapped;

@end

@interface HUDViewController : UIViewController

@property (weak) id<HUDDelegate> delegate;

@end
