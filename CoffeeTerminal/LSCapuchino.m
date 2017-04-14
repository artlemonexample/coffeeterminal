//
//  LSCapuchino.m
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/17/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSCapuchino.h"

@implementation LSCapuchino

+ (LSCapuchino*)defaultCoffee {
    LSCapuchino *coffee = [LSCapuchino new];
    coffee.price = capuchinoPrice;
    coffee.name = @"Capuchino";
    return coffee;
}

@end
