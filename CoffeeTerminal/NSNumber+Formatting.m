//
//  NSNumber+Formatting.m
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/22/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "NSNumber+Formatting.h"

@implementation NSNumber (Formatting)

- (NSString*)toDollar
{
    return [NSString stringWithFormat:@"%@ $", self];
}

- (NSString*)toEuro
{
    return [NSString stringWithFormat:@"%@ E", self];
}

@end
