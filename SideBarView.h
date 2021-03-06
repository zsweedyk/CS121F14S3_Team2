//
//  SideBarView.h
//  FractionBlaster
//
//  Created by CS121 on 11/2/14.
//  Copyright (c) 2014 MatherTeresa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fraction.h"
#import "MainMenuView.h"

@interface SideBarView : UIView

@property (assign, nonatomic) id <LaserFrequencyChosen> delegate;

- (void)setValueAtIndex:(int)index withValue:(Fraction*)value;

@end
