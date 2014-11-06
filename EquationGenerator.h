//
//  EquationGenerator.h
//  FractionBlaster
//
//  Created by CS121 on 11/2/14.
//  Copyright (c) 2014 MatherTeresa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Equation.h"

@interface EquationGenerator : NSObject

@property (nonatomic) int denominatorLimit;

- (id) initWithOperators: (NSArray*) operators andDenominatorLimit: (int)denominatorLimit andDifficulty: (int)difficulty;
- (Equation*)generateRandomEquation;
- (NSMutableArray*)getInitialFractions;
- (Fraction*) generateRandomFractionWithLimit: (Fraction*)upper;

@end
