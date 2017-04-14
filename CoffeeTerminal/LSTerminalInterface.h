//
//  LSTerminalInterface.h
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/22/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LSCoffee.h"

@protocol LSTerminalInterface <NSObject>

- (NSArray*)allSoldCoffies;
- (void)addSoldCoffee:(LSCoffee*)coffee;
// Working with cache
- (void)incrementQuarters;
- (void)incrementHalfDollars;
- (void)incrementOneDollars;
- (void)incrementTwoDollars;
- (void)incrementFiveDollars;

- (NSInteger)fiveDollarCach;
- (NSInteger)twoDollarCach;
- (NSInteger)oneDollarCach;
- (NSInteger)halfDollarCach;
- (NSInteger)quarterDollarCach;

- (void)decrementQuartersDollars;
- (void)decrementHalfDollars;
- (void)decrementOneDollars;
- (void)decrementTwoDollars;
- (void)decrementFiveDollars;

- (BOOL)existQuartersDollars;
- (BOOL)existHalfDollars;
- (BOOL)existOneDollars;
- (BOOL)existTwoDollars;
- (BOOL)existFiveDollars;


- (LSOrder*)currentOrder;

@end
