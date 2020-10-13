//
//  AlertView.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/13.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor blueColor];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gsr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:gsr];
}

- (void)dismiss {
    CGAffineTransform originalTransform = self.transform;
    float originScale = sqrt(originalTransform.a * originalTransform.a + originalTransform.c + originalTransform.c);
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = @(originScale);
    animation1.toValue = @(1.1 * originScale);
    animation1.duration = 2.0;
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation1.beginTime = 0;//点击之后立马开始动画，动画的执行时间为2秒
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = @(1.1 * originScale);
    animation2.toValue = @(0);
    animation2.duration = 3;
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation2.beginTime = 2;//这里设置的时间必须大于等于第一个动画的duration，不然的话第一个动画会被覆盖
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation1,animation2];
    group.duration = animation1.duration + animation2.duration;
    //这两句代码是为了动画完成后依然保持动画后的状态
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    [self.layer addAnimation:group forKey:@"dismiss"];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    NSLog(@"执行了这个方法");
}

- (void)showToView:(UIView *)view {
    [view addSubview:self];
    self.center = view.center;
    
    //弹出动画的实现 就是设置数值从0 到1.1 再到1，这样有一个回弹的效果
//    CGAffineTransform originalTransform = self.transform;
//    float originScale = sqrt(originalTransform.a * originalTransform.a + originalTransform.c + originalTransform.c);
    float originScale = 1;
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = @(0);
    animation1.toValue = @(1.1 * originScale);
    animation1.duration = 2.0;
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation1.beginTime = 0;//点击之后立马开始动画，动画的执行时间为2秒
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation2.fromValue = @(1.1 * originScale);
    animation2.toValue = @(originScale);
    animation2.duration = 3;
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation2.beginTime = 2;//这里设置的时间必须大于等于第一个动画的duration，不然的话第一个动画会被覆盖
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation1,animation2];
    group.duration = animation1.duration + animation2.duration;
    //这两句代码是为了动画完成后依然保持动画后的状态
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    [self.layer addAnimation:group forKey:@"showAlert"];
}

@end
