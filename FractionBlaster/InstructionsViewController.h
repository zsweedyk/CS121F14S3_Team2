//
//  InstructionsViewController.h
//  FractionBlaster
//
//  Created by Laptop16 on 11/17/14.
//  Copyright (c) 2014 MatherTeresa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstructionsView.h"
#import <AVFoundation/AVFoundation.h>

@interface InstructionsViewController : UIViewController<GoBack>

@property (nonatomic) AVAudioPlayer *instrBackSound;
@property (nonatomic) AVAudioPlayer *instrButtonSound;

@end
