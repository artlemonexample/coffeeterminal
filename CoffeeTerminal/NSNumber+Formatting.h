//
//  NSNumber+Formatting.h
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/22/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Formatting)

- (NSString*)toEuro;
- (NSString*)toDollar;

@end
