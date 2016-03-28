//
//  ViewController.m
//  newshapeLayer
//
//  Created by 常琼 on 16/3/23.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController.h"
#import "cqview.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self shaeLayer];
    
    

}


-(void)shaeLayer{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];

    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint:CGPointMake(10,10)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path closePath];

   [path stroke];
    shapeLayer.path = path.CGPath;


    shapeLayer.frame = self.view.bounds;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];


}


-(void)shapeLayer{

    // 贝塞尔曲线(创建一个圆)


    // 创建一个shapeLayer
    CAShapeLayer *layer = [CAShapeLayer layer];


    //    layer.frame         = showView.bounds;                // 与showView的frame一致
    //    layer.strokeColor   = [UIColor greenColor].CGColor;   // 边缘线的颜色
    //    layer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
    //    layer.lineCap       = kCALineCapSquare;               // 边缘线的类型
    //    layer.path          = path.CGPath;                    // 从贝塞尔曲线获取到形状
    //    layer.lineWidth     = 4.0f;                           // 线条宽度
    //    layer.strokeStart   = 0.0f;
    //    layer.strokeEnd     = 0.1f;

//    layer.frame = showView.bounds;
//    layer.strokeColor = [UIColor blueColor].CGColor;




    // 将layer添加进图层
//    [showView.layer addSublayer:layer];



    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 5.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.5f];
    pathAnimation.toValue = [NSNumber numberWithFloat:0.8f];
    [layer addAnimation:pathAnimation forKey:nil];
    
    

}



@end
