//
//  CQview.m
//  StickBall
//
//  Created by 常琼 on 16/3/21.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "CQview.h"

@interface CQview()

@property (nonatomic,strong)UIView *containerView;
@property (nonatomic,strong)UIView *frontView;
@property(strong,nonatomic) UILabel *bubbleLabel;

@end



@implementation CQview{
    CGPoint A,B,C,D,P,O;
    CGFloat radius;

    CGFloat sinAlpha,cosAlpha;
    
    CGPoint c1,c2;
    CGFloat r1,r2;

    
    CGFloat x1,x2,y1,y2;
    
    CALayer *underLayer;

    CGPoint initialPoint;
    UIView *backView;
    CAShapeLayer *shapeLayer;

    CGRect oldBackViewFrame;
    CGPoint oldbackViewCenter;


    UIColor *fillColorForCute;
    CGFloat centerDistance;
    UIBezierPath *cutePath;
}

-(id)initWithPoint:(CGPoint )point andSuperView:(UIView *)view{
    self = [super initWithFrame:CGRectMake(point.x, point.y, self.bubbleWidth, self.bubbleWidth)];
    if(self){
        initialPoint = point;
        self.containerView = view;
        [self.containerView addSubview:self];

    }
    return self;

}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    shapeLayer  = [CAShapeLayer layer];
    self.backgroundColor = [UIColor redColor];
    self.frontView = [[UIView alloc] initWithFrame:CGRectMake(initialPoint.x, initialPoint.y, self.bubbleWidth, self.bubbleWidth)];
    r2 = self.bubbleWidth/2;
    self.frontView.layer.cornerRadius = self.bubbleWidth/2;
    self.frontView.backgroundColor = self.bubbleColor;


    backView = [[UIView alloc] initWithFrame:self.frontView.frame ];
    r1 = backView.frame.size.width/2;
    backView.layer.cornerRadius = r1;
    backView.backgroundColor = [UIColor blueColor];

    self.bubbleLabel  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frontView.frame.size.width, self.frontView.frame.size.height)];
    self.bubbleLabel.textColor = [UIColor whiteColor];
    self.bubbleLabel .textAlignment  = NSTextAlignmentCenter;

    [self.frontView addSubview:self.bubbleLabel];

    [self.containerView addSubview:backView];
    [self.containerView addSubview:self.frontView];

    x1 = backView.center.x;
    y1 = backView.center.y;
    x2 = self.frontView.center.x;
    y2 = self.frontView.center.y;

    A = CGPointMake(x1-r1,y1);   // A
    B = CGPointMake(x1+r1, y1);  // B
    D = CGPointMake(x2-r2, y2);  // D
    C = CGPointMake(x2+r2, y2);  // C
    O = CGPointMake(x1-r1,y1);   // O
    P = CGPointMake(x2+r2, y2);  // P

    oldBackViewFrame = backView.frame;
    oldbackViewCenter = backView.center;

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.frontView addGestureRecognizer:pan];




}
-(void)panAction:(UIPanGestureRecognizer *)sender{
    CGPoint dragPoint = [sender locationInView:self.containerView];
    NSLog(@"Joker %f-%f",dragPoint.x,dragPoint.y);
    if (sender.state == UIGestureRecognizerStateBegan) {
        backView.hidden = NO;
        fillColorForCute = self.bubbleColor;
    }else if(sender.state == UIGestureRecognizerStateChanged){
        self.frontView.center = dragPoint;
        if(r1<=6){
            fillColorForCute = [UIColor clearColor];
            backView.hidden = YES;
            [shapeLayer removeFromSuperlayer];
        }
        [self rect];




    }else if (sender.state == UIGestureRecognizerStateEnded||sender.state ==UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateFailed){
        //over animation
        backView.hidden= YES;
        fillColorForCute = [UIColor clearColor];
        [shapeLayer removeFromSuperlayer];
        [UIView animateWithDuration:.5f delay:0 usingSpringWithDamping:.4f initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.frontView.center = oldbackViewCenter;


        } completion:^(BOOL finished) {


        }];
    }






}


- (void)rect{
     x1 = backView.center.x;
     y1 = backView.center.y;
     x2 = self.frontView.center.x;
     y2 = self.frontView.center.y;

     centerDistance = sqrtf((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
     if (centerDistance == 0) {
         cosAlpha = 1;
         sinAlpha = 0;
     }else{
         cosAlpha = (y2-y1)/centerDistance;
         sinAlpha = (x2-x1)/centerDistance;
     }

     r1 = oldBackViewFrame.size.width / 2 - centerDistance/self.viscosity;

     A = CGPointMake(x1-r1*cosAlpha, y1+r1*sinAlpha);// A
     B = CGPointMake(x1+r1*cosAlpha, y1-r1*sinAlpha);// B
     D = CGPointMake(x2-r2*cosAlpha, y2+r2*sinAlpha);// D
     C = CGPointMake(x2+r2*cosAlpha, y2-r2*sinAlpha);// C
     O = CGPointMake(A.x + (centerDistance / 2)*sinAlpha, A.y + (centerDistance / 2)*cosAlpha);
     P = CGPointMake(B.x + (centerDistance / 2)*sinAlpha, B.y + (centerDistance / 2)*cosAlpha);

     backView.center = oldbackViewCenter;
     backView.bounds = CGRectMake(0, 0, r1*2, r1*2);
     backView.layer.cornerRadius = r1;

     cutePath = [UIBezierPath bezierPath];
     [cutePath moveToPoint:A];
     [cutePath addQuadCurveToPoint:D controlPoint:O];
     [cutePath addLineToPoint:C];
     [cutePath addQuadCurveToPoint:B controlPoint:P];
     [cutePath addLineToPoint:A];

     if (backView .hidden == NO) {
         shapeLayer.path = cutePath.CGPath;
         shapeLayer.fillColor = [UIColor grayColor].CGColor;
         [self.containerView.layer insertSublayer:shapeLayer below:self.frontView.layer];
         
     }
    
}
 

@end
