//
//  OperatorsSelectView.m
//  FractionBlaster
//
//  Created by CS121 on 11/30/14.
//  Copyright (c) 2014 MatherTeresa. All rights reserved.
//

#import "OperatorsSelectView.h"

CGFloat INSET_RATIO;

@implementation OperatorsSelectView
{
    UIButton* _startButton;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _operatorsSelected = [[NSMutableArray alloc] init];
        [self createTitle];
        [self createOperatorButtons];
        [self createBackButton];
        [self createStartButton];
        [self setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"main_background"]]];
    }
    return self;
}

// Creates the level select title image at the top of the screen
-(void)createTitle
{
    // Get frame and frame dimensions
    CGRect frame = self.frame;
    CGFloat frameWidth = CGRectGetWidth(frame);
    CGFloat frameHeight = CGRectGetHeight(frame);
    
    // Add the level select image to the top of the view
    CGRect title = CGRectMake(0, -50, frameWidth, frameHeight*.5);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:title];
    imageView.image = [UIImage imageNamed:@"Levels.png"];
    [self addSubview:imageView];
}

-(void)createStartButton
{
    // Get frame and frame dimensions
    CGRect frame = self.frame;
    CGFloat width = CGRectGetWidth(frame);
    CGFloat height = CGRectGetHeight(frame);
    
    // Create start button with the appropriate delegate
    CGRect startButtonFrame = CGRectMake(width * 0.2, height * 0.8, width * 0.6, height * 0.15);
    _startButton = [[UIButton alloc] initWithFrame:startButtonFrame];
    
    UIImage *image = [UIImage imageNamed:@"launch2.png"];
    [_startButton setImage:image forState:UIControlStateNormal];
    
    [_startButton addTarget:self action:@selector(buttonSelected:)
          forControlEvents:UIControlEventTouchUpInside];
    _startButton.tag = 5;
    [_startButton setEnabled:NO];
    [self addSubview:_startButton];
}

- (void)createBackButton
{
    CGRect frame = self.frame;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame));
    CGFloat itemWidth = size / 15;
    CGFloat backButtonLength = itemWidth;
    CGFloat backButtonWidth = itemWidth;
    CGFloat backButtonX = CGRectGetWidth(frame) * INSET_RATIO;
    CGFloat backButtonY = CGRectGetHeight(frame) * INSET_RATIO;
    CGRect backButtonFrame = CGRectMake(backButtonX, backButtonY, backButtonLength, backButtonWidth);
    UIButton* backButton = [[UIButton alloc] initWithFrame:backButtonFrame];
    [backButton setBackgroundImage:[UIImage imageNamed:@"StartOverIcon"] forState:UIControlStateNormal];
    [[backButton layer] setBorderWidth:2.5f];
    [[backButton layer] setBorderColor:[UIColor blackColor].CGColor];
    [[backButton layer] setCornerRadius:12.0f];
    [backButton addTarget:self action:@selector(buttonSelected:)
          forControlEvents:UIControlEventTouchUpInside];
    backButton.tag = -1;
    [self addSubview:backButton];
}

- (void)createOperatorButtons
{
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat buttonSize = width / 8;
    CGFloat baseOffset = buttonSize / 4;
    CGFloat yOffset = CGRectGetHeight(self.frame) * 0.5;
    CGFloat xOffset = buttonSize;
    int tag = 0;
    for (int i = 0; i < 5; i++) {
        CGRect buttonFrame = CGRectMake(xOffset, yOffset, buttonSize, buttonSize);
        UIButton* currentButton = [[UIButton alloc] initWithFrame:buttonFrame];
        [currentButton setBackgroundColor:[UIColor whiteColor]];
        [currentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        switch (tag){
            case 0:
            {
                [currentButton setTitle:@"+" forState:UIControlStateNormal];
                [currentButton addTarget:self action:@selector(operatorSelected:)
                            forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 1:
                {
                [currentButton setTitle:@"-" forState:UIControlStateNormal];
                [currentButton addTarget:self action:@selector(operatorSelected:)
                        forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 2:
            {
                [currentButton setTitle:@"X" forState:UIControlStateNormal];
                [currentButton addTarget:self action:@selector(operatorSelected:)
                            forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 3:
            {
                [currentButton setTitle:@"÷" forState:UIControlStateNormal];
                [currentButton addTarget:self action:@selector(operatorSelected:)
                            forControlEvents:UIControlEventTouchUpInside];
                break;
            }
            case 4:
            {
                [currentButton setTitle:@"Simplify" forState:UIControlStateNormal];
                [currentButton addTarget:self action:@selector(operatorSelected:)
                            forControlEvents:UIControlEventTouchUpInside];
                break;
            }
        }
        currentButton.tag = tag;
        tag++;
        
        [self addSubview:currentButton];
        xOffset += baseOffset + buttonSize;
    }
}

- (void)buttonSelected:(id)sender
{
    [self.delegate buttonSelected:sender];
}

- (void)operatorSelected:(id)sender
{
    UIButton* button = (UIButton*)sender;
    
    NSString* operator;
    switch (button.tag){
        case 0:
        {
            operator = @"+";
            break;
        }
        case 1:
        {
            operator = @"-";
            break;
        }
        case 2:
        {
            operator = @"*";
            break;
        }
        case 3:
        {
            operator = @"/";
            break;
        }
        case 4:
        {
            operator = @"$";
            break;
        }
    }
    
    if (button.backgroundColor == [UIColor grayColor]) {
        [_operatorsSelected removeObject:operator];
        [button setBackgroundColor:[UIColor whiteColor]];
    }
    else {
        [_operatorsSelected addObject:operator];
        [button setBackgroundColor:[UIColor grayColor]];
    }
    
    if ([_operatorsSelected count] == 0) {
        [_startButton setEnabled:NO];
    }
    else {
        [_startButton setEnabled:YES];
    }
}

@end
