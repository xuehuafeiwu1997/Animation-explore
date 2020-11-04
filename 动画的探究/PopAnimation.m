//
//  PopAnimation.m
//  动画的探究
//
//  Created by 许明洋 on 2020/11/4.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "PopAnimation.h"

@interface PopAnimation()<CAAnimationDelegate>

@end

@implementation PopAnimation

//- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
//    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
//    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
//    [[transitionContext containerView] addSubview:toView];
//    [self beginFromViewAnimation:fromView WithDuration:10.0f];
//    self.completeBlock = ^{
//        [transitionContext completeTransition:YES];
//    };
//}

//设置动画执行的时常
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

//用来处理具体的动画
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //需要将转场后的界面给加上去才行
//    [[transitionContext containerView] addSubview:toVC.view];
    [[transitionContext containerView] insertSubview:toVC.view belowSubview:fromVC.view];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [self beginFromViewAnimation:fromView WithDuration:duration];
    self.completeBlock = ^{
        //当动画执行完时，这个方法必须调用，否则系统会认为你的所有操作都在动画执行过程中
//        [transitionContext completeTransition:YES];
        BOOL isComplete = [transitionContext transitionWasCancelled];
        NSLog(@"当前的状态为:%d",isComplete);
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    };
}

- (void)beginFromViewAnimation:(UIView *)fromView WithDuration:(NSTimeInterval)duration {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.byValue = @(fromView.frame.size.width);
    animation.duration = duration;
    animation.delegate = self;
    animation.beginTime = 0.f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [fromView.layer addAnimation:animation forKey:@"animation"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"开始执行自定义动画");
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
