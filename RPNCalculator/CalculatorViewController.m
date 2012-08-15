//
//  CalculatorViewController.m
//  RPNCalculator
//
//  Created by Javier Martin on 15/08/12.
//  Copyright (c) 2012 Javier Martin. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInthMiddleOfEnteringNumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize display=_display;
@synthesize userIsInthMiddleOfEnteringNumber=_userIsInthMiddleOfEnteringNumber;

@synthesize brain=_brain;

-(CalculatorBrain *) brain
{
    if(!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender

{
    NSString *digit = [sender currentTitle];
    if(self.userIsInthMiddleOfEnteringNumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
    }else{
        self.display.text = digit;
        self.userIsInthMiddleOfEnteringNumber = YES;
    }
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInthMiddleOfEnteringNumber = NO;
    }
- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInthMiddleOfEnteringNumber) {
        [self enterPressed];
    }
    NSString *operation = sender.currentTitle;
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
    
}
@end
