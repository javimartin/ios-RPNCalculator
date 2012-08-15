//
//  CalculatorBrain.h
//  RPNCalculator
//
//  Created by Javier Martin on 15/08/12.
//  Copyright (c) 2012 Javier Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;

@end
