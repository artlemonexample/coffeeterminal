//
//  LSOrder.h
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/17/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#import "LSCoffee.h"

@interface LSOrder : NSObject

@property (assign) CGFloat deposit;
@property (nonatomic, strong) LSCoffee *currentCoffee;

- (void)clean;

@end
