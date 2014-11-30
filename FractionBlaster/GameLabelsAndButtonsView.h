//
//  LabelsAndButtonsView.h
//  FractionBlaster
//
//  Created by CS121 on 11/17/14.
//  Copyright (c) 2014 MatherTeresa. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GoBack
- (void)backToMainMenu;
- (void)backToGameWithNextLevel:(BOOL)won;
@end

@interface GameLabelsAndButtonsView : UIView

@property (assign, nonatomic) id <GoBack> delegate;

- (id)initWithFrame:(CGRect)frame andLevel:(int)level andScore:(int)score;
- (void)updateScore:(int)score;

@end