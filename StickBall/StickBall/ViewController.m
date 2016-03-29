//
//  ViewController.m
//  StickBall
//
//  Created by 常琼 on 16/3/21.
//  Copyright © 2016年 shouhuobao. All rights reserved.


#import "ViewController.h"
#import "CQview.h"

@interface ViewController ()


@property(strong,nonatomic) UIPanGestureRecognizer *pan;

@property(strong,nonatomic) CQview *cqview;

@property (weak, nonatomic) IBOutlet UITextField *textfile;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGPoint point = CGPointMake(25, self.view.frame.size.height-65);
    CQview *cqview = [[CQview alloc] initWithPoint:point andSuperView:self.view];

    cqview.viscosity = 20;
    cqview.bubbleWidth = 35;

    cqview.bubbleColor = [UIColor redColor];

    [cqview setup];
    cqview.text = @"R";



        
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textfile setEnabled:NO];
}



@end
