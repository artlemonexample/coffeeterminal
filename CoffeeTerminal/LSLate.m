//
//  LSLate.m
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/17/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSLate.h"

@implementation LSLate

+ (LSLate*)defaultCoffee {
    LSLate *coffee = [LSLate new];
    coffee.price = latePrice;
    coffee.name = @"Late";
    return coffee;
}

@end
