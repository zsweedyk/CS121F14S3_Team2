//
//  ShipSelectViewController.m
//  FractionBlaster
//
//  Created by Alejandro Mendoza on 12/4/14.
//  Copyright (c) 2014 MatherTeresa. All rights reserved.
//

#import "ShipSelectViewController.h"
#import "GameViewController.h"

// Enum object for button tags, we include the ship buttons so that
// proper sounds can be played when buttonSelected is called
typedef enum {
    BlueShip,
    BrownShip,
    SilverShip,
    RedShip,
    StartTag,
    BackTag
} ButtonTags;

@implementation ShipSelectViewController
{
    ShipSelectView *_shipSelectView;
    NSArray *_operators;
    int _level;
}

// Keep track of the levels and the operators array so that
// we can pass these values to the Game View Controller
- (id)initWithLevel:(int)level andOperators:(NSArray*)operators
{
    self = [super init];
    _level = level;
    _operators = operators;
    return self;
}

// Initialize the level ship select view controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up the view and delegate
    _shipSelectView = [[ShipSelectView alloc] initWithFrame:self.view.frame];
    [_shipSelectView setDelegate:self];
    [self.view addSubview: _shipSelectView];
}

// Function to perform action according to button selected
- (void)buttonSelected:(id)sender
{
    // Figure out which button was selected
    UIButton *button = (UIButton *)sender;
    int tag = (int)button.tag;
    
    switch (tag) {
        // This case starts the game
        case StartTag:
        {
            // Play the sound of the launch button
            [self launchSound];
            
            // Determine which ship was selected
            int shipNum = [_shipSelectView currentShipSelected];
            
            // Create the game
            GameViewController *gvc = [[GameViewController alloc]
                                           initWithLevel:_level
                                           andOperators:_operators
                                           andShipNumber:shipNum];
            
            CATransition* transition = [CATransition animation];
            transition.duration = 1;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = kCATransitionFade;
            
            [self.navigationController.view.layer addAnimation:transition forKey:nil];
            [self.navigationController pushViewController:gvc animated:NO];
            
            break;
        }
            
        // Back button selected, move to previous screen
        case BackTag:
        {
            // Play the back button sound and pop the view
            [self backSound];
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
            
        // One of the ship buttons was selected
        default:
        {
            // Play the ship button sound
            [self shipSelectedSound];
            break;
        }
    }
}

// Play the sound to the select a ship
- (void)shipSelectedSound {
    NSError *error;
    NSURL *progressButton = [[NSBundle mainBundle] URLForResource:@"ship-select" withExtension:@"mp3"];
    self.shipSelectSound = [[AVAudioPlayer alloc] initWithContentsOfURL:progressButton error:&error];
    [self.shipSelectSound prepareToPlay];
    [self.shipSelectSound play];
}

// Play the sound to go to the previous screen
- (void)backSound {
    NSError *error;
    NSURL *backButton = [[NSBundle mainBundle] URLForResource:@"button-09" withExtension:@"wav"];
    self.shipBackSound = [[AVAudioPlayer alloc] initWithContentsOfURL:backButton error:&error];
    [self.shipBackSound prepareToPlay];
    [self.shipBackSound play];
}

// Play the sound to go to the next screen
- (void)launchSound
{
    NSError *error;
    NSURL *backButton = [[NSBundle mainBundle] URLForResource:@"button-3" withExtension:@"wav"];
    self.shipLaunch = [[AVAudioPlayer alloc] initWithContentsOfURL:backButton error:&error];
    [self.shipLaunch prepareToPlay];
    [self.shipLaunch play];
}

@end
