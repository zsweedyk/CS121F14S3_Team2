//
//  MainMenuButtonsView.m
//  FractionBlaster
//
//  Created by Laptop16 on 11/14/14.
//  Copyright (c) 2014 MatherTeresa. All rights reserved.
//

#import "MainMenuView.h"

@implementation MainMenuView
{
    UIImageView *_titleView;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    CGFloat frameHeight = CGRectGetHeight(self.frame);
    CGFloat frameWidth  = CGRectGetWidth(self.frame);
    
    // Title image
    UIImage *titleImage =[UIImage imageNamed:@"logo.png"];
    CGFloat titleXOffset = (frameWidth-titleImage.size.width)/2;
    CGFloat titleYOffset = 0.2 * frameHeight;
    _titleView = [[UIImageView alloc] initWithFrame:CGRectMake(titleXOffset, titleYOffset, titleImage.size.width, titleImage.size.height)];
    [_titleView setImage:titleImage];
    [self addSubview:_titleView];
    
    
    CGFloat buttonWidth = CGRectGetWidth(self.frame) * 0.6;
    CGFloat buttonHeight = CGRectGetHeight(self.frame) * 0.05;
    CGFloat xOffset = CGRectGetWidth(self.frame) * 0.2;
    CGFloat yOffset = CGRectGetHeight(self.frame) * 0.4;
    
    
    for (int i = 0; i < 3; ++i){
        yOffset += buttonHeight * 2.25;
        CGRect buttonFrame = CGRectMake(xOffset, yOffset, buttonWidth, buttonHeight);
        
        UIButton* button = [[UIButton alloc] initWithFrame:buttonFrame];
        
        // Create target for cell
        [button addTarget:self action:@selector(buttonSelected:)
              forControlEvents:UIControlEventTouchUpInside];
        
        // Set up title
        NSString *title;
        switch (i){
            case 0:
                title = @"start_mission";
                break;
            case 1:
                title = @"instructions";
                break;
            case 2:
                title = @"leaderboards";
                break;
            default:
                break;
        }
        [button setBackgroundImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
        button.tag = i;
        
        [self addSubview:button];
    }
    
    return self;
}

-(void)buttonSelected:(id)sender
{
    [self.delegate buttonSelected:sender];
}

@end