//
//  LSVipLate.m
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/17/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "LSVipLate.h"

@implementation LSVipLate

+ (LSVipLate*)defaultCoffee {
    LSVipLate *coffee = [LSVipLate new];
    coffee.price = vipLatePrice;
    coffee.name = @"Vip Late";
    return coffee;
}

@end
