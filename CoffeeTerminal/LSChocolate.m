//
//  LSChocolate.m
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/17/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSChocolate.h"

@implementation LSChocolate

+ (LSChocolate*)defaultCoffee {
    LSChocolate *coffee = [LSChocolate new];
    coffee.price = chocolatePrice;
    coffee.name = @"Chocolate";
    return coffee;
}

@end
