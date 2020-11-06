//
//  PushAnimationController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/16.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "PushAnimationController.h"

@interface PushAnimationController()<CAAnimationDelegate>

@end

@implementation PushAnimationController

//用来处理具体的动画
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    NSLog(@"当前的fromView为%@",fromView);
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    NSLog(@"最终的toVC为%@",toVC);
    //需要将转场后的界面给加上去才行
    [[transitionContext containerView] addSubview:toVC.view];
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    [self beginAnimation:toView];
    self.completeBlock = ^{
        ////一定要记得动画完成后执行此方法，让系统管理 navigation
        [transitionContext completeTransition:YES];
    };
}

- (void)beginAnimation:(UIView *)toView {
//    CGSize size = toView.frame.size;
    CGSize size = [UIScreen mainScreen].bounds.size;
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    animation1.keyPath = @"transform.rotation.z";
    animation1.fromValue = @(M_PI_2);
    animation1.toValue = @(0);
    animation1.duration = 2.0f;
    animation1.beginTime = 0.f;
    animation1.delegate = self;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    toView.layer.anchorPoint = CGPointMake(1, 1);
    toView.layer.position = CGPointMake(size.width, size.height);
    [toView.layer addAnimation:animation1 forKey:@"animation1"];
}

//设置动画执行的时长
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"开始执行自定义的动画");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        NSLog(@"动画正常结束");
    }
    if (self.completeBlock) {
        self.completeBlock();
    }
}

@end
