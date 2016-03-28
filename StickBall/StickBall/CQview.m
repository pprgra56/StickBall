//
//  CQview.m
//  StickBall
//
//  Created by 常琼 on 16/3/21.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "CQview.h"


@implementation CQview{
    CGPoint A,B,C,D,P,O;
    CGFloat radius;
    CGFloat distance;
    CGFloat sinAlpha,cosAlpha;
    
    CGPoint c1,c2;//好像没啥用
    CGFloat r1,r2;
    UIPanGestureRecognizer *pan;
    
    CGFloat x1,x2,y1,y2;
    
    CALayer *underLayer;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        self.layer.cornerRadius = frame.size.width/2;
        self.layer.masksToBounds = YES;
        self.layer.backgroundColor = [UIColor greenColor].CGColor;
        
        c1 = c2 = CGPointMake(frame.origin.x, frame.origin.y);
        x1 = x2 = self.center.x;
        y1 = y2 = self.center.y;
        
        
    }
    return self;
}

-(void)setup{
    pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:pan];
    
    
  


    underLayer = [CALayer layer];
    underLayer.frame = self.bounds;
    

    underLayer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.layer addSublayer:underLayer];

    
    
    
    
    
}
-(void)panAction:(UIPanGestureRecognizer *)sender{
    
    CGPoint point = [sender translationInView:self.superview];
    NSLog(@"Joker %f ,%f",point.x,point.y);
    
    [sender setTranslation:CGPointZero inView:self.superview];
    
    
    underLayer.affineTransform = CGAffineTransformTranslate(self.transform, point.x, point.y);
    
    
}
- (void)drawRect:(CGRect)rect {
    [super drawRect: rect];
    
}
 

@end
