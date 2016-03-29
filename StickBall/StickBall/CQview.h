//
//  CQview.h
//  StickBall
//
//  Created by 常琼 on 16/3/21.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQview : UIView

@property(assign,nonatomic) CGFloat viscosity;//黏度
@property(assign,nonatomic) CGFloat bubbleWidth;//气泡宽度
@property(strong,nonatomic) UIColor *bubbleColor;//气泡颜色

@property(nonatomic,copy)  NSString *text;


-(void)setup;
-(id)initWithPoint:(CGPoint )point andSuperView:(UIView *)view;

@end
