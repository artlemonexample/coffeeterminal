//
//  LSCoffee.m
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/17/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSCoffee.h"

CGFloat const chocolatePrice = 3.5;
CGFloat const capuchinoPrice = 5.25;
CGFloat const latePrice = 7.25;
CGFloat const vipLatePrice = 9.75;

@implementation LSCoffee

- (id)copyWithZone:(NSZone *)zone {
    LSCoffee *copy = [[LSCoffee allocWithZone:zone] init];
    copy.price = self.price;
    copy.name = [self.name copy];
    return copy;
}

+ (LSCoffee*)defaultCoffee {
    return nil;
}


@end
