//
//  cqview.m
//  newshapeLayer
//
//  Created by 常琼 on 16/3/23.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "cqview.h"

@implementation cqview


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path  = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(300, 300)];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = self.bounds;
    shape.path = path.CGPath;
    
    
    [self.layer addSublayer:shape];
    
    
   
    
    
    
    
    
    
    
    
    
    
}


@end
