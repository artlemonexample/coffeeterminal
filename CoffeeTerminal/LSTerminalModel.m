//
//  LSTerminalModel.m
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/17/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSTerminalModel.h"

@interface LSTerminalModel ()

@property (nonatomic, strong) NSMutableArray *soldCoffies;

@property (nonatomic, assign) NSInteger fiveDollarCach;
@property (nonatomic, assign) NSInteger twoDollarCach;
@property (nonatomic, assign) NSInteger oneDollarCach;
@property (nonatomic, assign) NSInteger halfDollarCach;
@property (nonatomic, assign) NSInteger quarterDollarCach;

@property (nonatomic, strong) LSOrder *currentOrder;

@end

@implementation LSTerminalModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.fiveDollarCach = MIN(10, arc4random_uniform(20));
        self.twoDollarCach = MIN(10, arc4random_uniform(20));
        self.oneDollarCach = MIN(10, arc4random_uniform(20));
        self.halfDollarCach = MIN(10, arc4random_uniform(20));
        self.quarterDollarCach = MIN(10, arc4random_uniform(20));
        self.currentOrder = [LSOrder new];
        [NSKeyedArchiver archiveRootObject:[LSCoffee new] toFile:@"/path/to/archive"];
        self.soldCoffies = [NSMutableArray new];
    }
    return self;
}


#pragma mark - LSTerminalInterface

- (void)addSoldCoffee:(LSCoffee *)coffee {
    [self.soldCoffies addObject:coffee];
}

- (NSArray *)allSoldCoffies {
    return [self.soldCoffies copy];
}

- (void)incrementQuarters {
    self.quarterDollarCach++;
}

- (void)incrementHalfDollars {
    self.halfDollarCach++;
}

- (void)incrementOneDollars {
    self.oneDollarCach++;
}

- (void)incrementTwoDollars {
    self.twoDollarCach++;
}

- (void)incrementFiveDollars {
    self.fiveDollarCach++;
}

- (void)decrementQuartersDollars {
    self.quarterDollarCach--;
}

- (void)decrementHalfDollars {
    self.halfDollarCach--;
}

- (void)decrementOneDollars {
    self.oneDollarCach--;
}

- (void)decrementTwoDollars {
    self.twoDollarCach--;
}

- (void)decrementFiveDollars {
    self.fiveDollarCach--;
}

- (BOOL)existQuartersDollars {
    return self.quarterDollarCach != 0;
}

- (BOOL)existHalfDollars {
    return self.halfDollarCach != 0;
}

- (BOOL)existOneDollars {
    return self.oneDollarCach != 0;
}

- (BOOL)existTwoDollars {
    return self.twoDollarCach != 0;
}

- (BOOL)existFiveDollars {
    return self.fiveDollarCach != 0;
}


@end
