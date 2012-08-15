//
//  CalculatorBrain.m
//  RPNCalculator
//
//  Created by Javier Martin on 15/08/12.
//  Copyright (c) 2012 Javier Martin. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray * operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack=_operandStack;


-(NSMutableArray *) operandStack
{
    if(!_operandStack)
        _operandStack=[[NSMutableArray alloc] init];
    
    return _operandStack;
}


-(void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
};
-(double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *)operation
{
    double result=0;
    if([operation isEqualToString:@"+"])
    {
        result= [self popOperand] + [self popOperand];
        
    }else if([operation isEqualToString:@"-"])
    {
        double operand1=[self popOperand];
        result= [self popOperand] - operand1;
        
    }else if([operation isEqualToString:@"*"])
    {
        result= [self popOperand] * [self popOperand];
        
    }else if([operation isEqualToString:@"/"])
    {
        double divisor = [self popOperand];
        if(divisor) result= [self popOperand] / divisor;
        
    }
        
    [self pushOperand:result];
    return result;
};

@end
