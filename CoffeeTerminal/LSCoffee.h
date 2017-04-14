//
//  LSCoffee.h
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/17/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

extern CGFloat const chocolatePrice;
extern CGFloat const capuchinoPrice;
extern CGFloat const latePrice;
extern CGFloat const vipLatePrice;

@interface LSCoffee : NSObject <NSCopying>

@property (assign) CGFloat price;
@property (strong) NSString *name;

+ (LSCoffee*)defaultCoffee;

@end
