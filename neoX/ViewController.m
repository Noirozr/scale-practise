//
//  ViewController.m
//  neoX
//
//  Created by Yongjia Liu on 13-7-30.
//  Copyright (c) 2013年 Yongjia Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UIView *newView1=[[UIView alloc]initWithFrame:CGRectMake(-30, -30, 200, 200)];
    [newView1.layer setMasksToBounds:YES];
    newView1.layer.cornerRadius=25;
    [newView1 setBackgroundColor:[UIColor colorWithRed:0.97f green:0.62f blue:0.69f alpha:1.00f]];
    CGPoint fromPoint1 = newView1.center;
    UIBezierPath *movePath1 = [UIBezierPath bezierPath];
    [movePath1 moveToPoint:fromPoint1];
    CGPoint toPoint1 = CGPointMake(100, 100);
    [movePath1 addQuadCurveToPoint:toPoint1
                      controlPoint:CGPointMake(100,100)];
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath1.CGPath;
    //旋转变化
    CABasicAnimation *scaleAnim1 = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim1.fillMode=kCAFillModeBackwards;
    scaleAnim1.removedOnCompletion=NO;
    scaleAnim1.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //x，y轴缩小到0.1,Z 轴不变
    
    scaleAnim1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.3, 0.3, 1.0)];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:moveAnim, scaleAnim1, nil];
    
    animGroup.fillMode=kCAFillModeForwards;
    animGroup.removedOnCompletion=NO;
    //    animGroup.duration = 1;
    [newView1.layer addAnimation:animGroup forKey:@"transform"];
    [self.view addSubview:newView1];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
