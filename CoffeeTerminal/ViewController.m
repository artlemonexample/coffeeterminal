//
//  ViewController.m
//  CoffeeTerminal
//
//  Created by Artem Kravchenko on 3/15/17.
//  Copyright © 2017 LemonSchool. All rights reserved.
//

#import "ViewController.h"
#import "NSNumber+Formatting.h"

#import "LSTerminalModel.h"
#import "LSChocolate.h"
#import "LSCapuchino.h"
#import "LSLate.h"
#import "LSVipLate.h"
#import "LSTerminalInterface.h"

#import <JHChainableAnimations/JHChainableAnimations.h>

@interface ViewController ()

@property (strong) id<LSTerminalInterface> terminal;

@property (weak, nonatomic) IBOutlet UIView *levelView;
@property (weak, nonatomic) IBOutlet UILabel *vipLateLabel;
@property (weak, nonatomic) IBOutlet UILabel *lateLabel;
@property (weak, nonatomic) IBOutlet UILabel *capuchinoLabel;
@property (weak, nonatomic) IBOutlet UILabel *chocolateLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UIButton *payChocolateButton;
@property (weak, nonatomic) IBOutlet UIButton *payCapuchinoButton;
@property (weak, nonatomic) IBOutlet UIButton *payLateButton;
@property (weak, nonatomic) IBOutlet UIButton *payVipLateButton;

@property (weak, nonatomic) IBOutlet UILabel *fiveDollarsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoDollarsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneDollarsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *halfDollarsCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *quarterDollarsCountLabel;

@property (assign) CGFloat startHeight;
@property (assign) CGFloat startOriginY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.terminal = [LSTerminalModel new];
    self.chocolateLabel.text = [@(chocolatePrice) toDollar];
    self.capuchinoLabel.text = [@(capuchinoPrice) toDollar];
    self.lateLabel.text = [@(latePrice) toDollar];
    self.vipLateLabel.text = [@(vipLatePrice) toDollar];
    self.startHeight = self.levelView.frame.size.height;
    self.startOriginY = self.levelView.frame.origin.y;
    self.levelView.backgroundColor = [UIColor blueColor];
    [self updateViewState:0.0];
}

- (void)addSoldCoffee {
    [self.terminal addSoldCoffee:nil];
}


#pragma mark - Actions

- (IBAction)change:(id)sender {
    NSInteger fiveDollars = 0, twoDollars = 0, oneDollars = 0, halfDollars = 0, quarterDollars = 0;
    BOOL existFiveDollars = YES, existTwoDollars = YES, existOneDollars = YES, existHalfDollars = YES, existQuarterDollars = YES;
    CGFloat currentChange = self.terminal.currentOrder.deposit;
    while (existFiveDollars || existTwoDollars || existOneDollars || existHalfDollars || existQuarterDollars) {
        existFiveDollars = (currentChange > 5.0 && self.terminal.existFiveDollars);
        (existTwoDollars = currentChange > 2.0 && self.terminal.existTwoDollars);
        (existOneDollars = currentChange > 1.0 && self.terminal.existOneDollars);
        (existHalfDollars = currentChange > 0.5 && self.terminal.existHalfDollars);
        (existQuarterDollars = currentChange > 0.25 && self.terminal.existQuartersDollars);
        if (existFiveDollars) {
            [self.terminal decrementFiveDollars];
            currentChange -= 5.0;
            fiveDollars++;
        } else if (existTwoDollars) {
            [self.terminal decrementTwoDollars];
            currentChange -= 2.0;
            twoDollars++;
        } else if (existOneDollars) {
            [self.terminal decrementOneDollars];
            currentChange -= 1.0;
            oneDollars++;
        } else if (existHalfDollars) {
            [self.terminal decrementHalfDollars];
            currentChange -= 0.5;
            halfDollars++;
        } else if (existQuarterDollars) {
            [self.terminal decrementQuartersDollars];
            currentChange -= 0.25;
            quarterDollars++;
        }
    }
    self.terminal.currentOrder.deposit = currentChange;
    [self updateViewState:1.0];
}

- (IBAction)pay:(UIButton*)button {
    self.totalLabel.text = [@(0) toDollar];
    LSCoffee *coffee = nil;
    switch (button.tag) {
        case 1: {
            coffee = [LSChocolate defaultCoffee];
            
        } break;
        case 2: {
            coffee = [LSCapuchino defaultCoffee];
            
        } break;
        case 3: {
            coffee = [LSLate defaultCoffee];
            
        } break;
        case 4: {
            coffee = [LSVipLate defaultCoffee];
            
        } break;
            
        default:
            break;
    }
    [self.terminal addSoldCoffee:coffee];
    self.terminal.currentOrder.deposit -= coffee.price;
    [self updateViewState:1.0];
    // TODO: implement algorith of change
    // [self.terminal.currentOrder clean];
}

- (IBAction)putQuarterDollar:(id)sender {
    [self.terminal incrementQuarters];
    [self increase:0.25];
}

- (IBAction)putHalfDollar:(id)sender {
    [self.terminal incrementHalfDollars];
    [self increase:0.5];
}

- (IBAction)putOneDollar:(id)sender {
    [self.terminal incrementOneDollars];
    [self increase:1.0];
}

- (IBAction)purTwoDollar:(id)sender {
    [self.terminal incrementTwoDollars];
    [self increase:2.0];
}

- (IBAction)purFiveDollar:(id)sender {
    [self.terminal incrementFiveDollars];
    [self increase:5.0];
}


#pragma mark - Privte

- (void)increase:(CGFloat)increaseValue {
    self.terminal.currentOrder.deposit += increaseValue;
    [self updateViewState:0.2];
}

- (void)updateLevelViewState:(CGFloat)duration {
    self.totalLabel.text = [@(self.terminal.currentOrder.deposit) toDollar];
    UIColor *nextColor = nil;
    UILabel *usedLabel = nil;
    CGRect rect = self.levelView.frame;
    if (self.terminal.currentOrder.deposit <= chocolatePrice) {
        usedLabel = self.chocolateLabel;
        rect = [self rectForLabel:self.chocolateLabel price:chocolatePrice];
        nextColor = [UIColor yellowColor];
    } else if (self.terminal.currentOrder.deposit <= capuchinoPrice) {
        usedLabel = self.capuchinoLabel;
        rect = [self rectForLabel:self.capuchinoLabel price:capuchinoPrice];
        nextColor = [UIColor greenColor];
        self.terminal.currentOrder.currentCoffee = [LSChocolate defaultCoffee];
    } else if (self.terminal.currentOrder.deposit <= latePrice) {
        usedLabel = self.lateLabel;
        rect = [self rectForLabel:self.lateLabel price:latePrice];
        nextColor = [UIColor brownColor];
        self.terminal.currentOrder.currentCoffee = [LSCapuchino defaultCoffee];
    } else if (self.terminal.currentOrder.deposit <= vipLatePrice) {
        usedLabel = self.vipLateLabel;
        rect = [self rectForLabel:self.vipLateLabel price:vipLatePrice];
        nextColor = [UIColor redColor];
        self.terminal.currentOrder.currentCoffee = [LSLate defaultCoffee];
    } else {
        rect = [self rectForLabel:self.vipLateLabel price:vipLatePrice];
        nextColor = [UIColor redColor];
        self.terminal.currentOrder.currentCoffee = [LSVipLate defaultCoffee];
    }
    if (usedLabel) {
        JHChainableAnimator *labelAnimator = [[JHChainableAnimator alloc] initWithView:usedLabel].rotate(360);
        labelAnimator.animate(duration);
    }
    [UIView animateWithDuration:duration animations:^{
        self.levelView.frame = rect;
    }];
    JHChainableAnimator *animator = [[JHChainableAnimator alloc] initWithView:self.levelView].makeBackground(nextColor);
    animator.animate(duration);
}

- (void)updateViewState:(CGFloat)duration {
    [self updateLevelViewState:duration];
    [self updateButtonsState];
    [self updateCountLabels];
}

- (void)updateCountLabels {
    self.fiveDollarsCountLabel.text = [NSString stringWithFormat:@"%@", @(self.terminal.fiveDollarCach)];
    self.twoDollarsCountLabel.text = [NSString stringWithFormat:@"%@", @(self.terminal.twoDollarCach)];
    self.oneDollarsCountLabel.text = [NSString stringWithFormat:@"%@", @(self.terminal.oneDollarCach)];
    self.halfDollarsCountLabel.text = [NSString stringWithFormat:@"%@", @(self.terminal.halfDollarCach)];
    self.quarterDollarsCountLabel.text = [NSString stringWithFormat:@"%@", @(self.terminal.quarterDollarCach)];
}

- (void)updateButtonsState {
    self.payChocolateButton.enabled = (self.terminal.currentOrder.deposit >= chocolatePrice);
    self.payCapuchinoButton.enabled = (self.terminal.currentOrder.deposit >= capuchinoPrice);
    self.payLateButton.enabled = (self.terminal.currentOrder.deposit >= latePrice);
    self.payVipLateButton.enabled = (self.terminal.currentOrder.deposit >= vipLatePrice);
}

- (CGRect)rectForLabel:(UILabel*)label price:(CGFloat)price {
    CGRect rect = self.levelView.frame;
    CGFloat measure = fabs(label.frame.origin.y - self.startOriginY);
    rect.size.height = MIN(fabs(self.startOriginY - self.vipLateLabel.frame.origin.y), self.startHeight + self.terminal.currentOrder.deposit/price*measure);
    rect.origin.y = self.startOriginY + self.startHeight - rect.size.height;
    return rect;
}

@end
