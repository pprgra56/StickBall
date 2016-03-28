//
//  ViewController.m
//  sabreadklinke
//
//  Created by 常琼 on 16/3/24.
//  Copyright © 2016年 shouhuobao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];


    NSMutableParagraphStyle *pstyle = [[NSMutableParagraphStyle alloc] init];

    [pstyle setLineBreakMode:NSLineBreakByTruncatingTail];
    pstyle.lineSpacing = 14;
    pstyle.paragraphSpacing = 20;


    NSMutableAttributedString *attributeString  = [[NSMutableAttributedString alloc] initWithString:@"近日，《中华人民共和国国民经济和社会发展第十三个五年规划纲要》（以下简称《纲要》）在十二届全国人大第四次会议上通过。\n/“十三五”规划是实现全面建成小康社会第一个百年奋斗目标决胜阶段的行动纲领，也是对十八大以来以习近平为总书记的党中央形成的一系列治国理政的新理念、新思想、新战略的集中体现。" ];

    [attributeString addAttribute:NSParagraphStyleAttributeName
                            value:pstyle
                            range:NSMakeRange(0,20)];
    [attributeString addAttribute:NSKernAttributeName value:@20 range:NSMakeRange(0, 20)];




    self.lbl.attributedText = attributeString;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
