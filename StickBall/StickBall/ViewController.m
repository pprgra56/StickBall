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


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cqview  = [[CQview alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
    [self.view addSubview: self.cqview];
    
    
    

    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}



@end
