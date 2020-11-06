//
//  FourthViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/11/2.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"旋转-平移-旋转动画组";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.testView];
    [self.testView addSubview:self.blueView];
    self.button.frame = CGRectMake((self.view.bounds.size.width - 100) / 2, 400, 100, 50);
    [self.view addSubview:self.button];
}

- (void)beginAnimation {
    NSLog(@"开始动画效果");
    NSLog(@"开始顺时针旋转90度动画");
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    //旋转必须在前面加上transform
    animation1.keyPath = @"transform.rotation.z";
    animation1.fromValue = @(M_PI_2);
//    animation1.byValue = @(M_PI_2);
    animation1.toValue = @(0);
    animation1.duration = 2.0f;
    animation1.beginTime = 0.f;
    animation1.delegate = self;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    self.blueView.layer.anchorPoint = CGPointMake(1, 1);
    self.blueView.layer.position = CGPointMake(60, 200);
    [self.blueView.layer addAnimation:animation1 forKey:@"animation1"];
    
    NSLog(@"当前的anchorPoint的值为%f,%f",self.blueView.layer.anchorPoint.x,self.blueView.layer.anchorPoint.y);
    NSLog(@"当前的position的值为%f,%f",self.blueView.layer.position.x,self.blueView.layer.position.y);
//    [self beginTranslateAnimation];
}

- (void)resetOriginState {
    /*
     如果不注销这部分代码，那么在animation1动画执行完毕之后，会立刻将动画复原，之后再在原油的动画的基础上执行逆时针旋转90度
     注销这部分代码之后，动画的效果和符合我们的预期
     */
//    if ([self.blueView.layer animationForKey:@"animation1"]) {
//        [self.blueView.layer removeAnimationForKey:@"animation1"];
//    }
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"transform.rotation.z";
    animation2.byValue = @(-M_PI_2);
    animation2.duration = 5.0f;
    animation2.beginTime = 0.f;
    animation2.removedOnCompletion = NO;
    animation2.fillMode = kCAFillModeForwards;
    self.blueView.layer.anchorPoint = CGPointMake(1, 1);
    self.blueView.layer.position = CGPointMake(60, 200);
    [self.blueView.layer addAnimation:animation2 forKey:@"animation2"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"当前的anchorPoint的值为%f,%f",self.blueView.layer.anchorPoint.x,self.blueView.layer.anchorPoint.y);
    NSLog(@"当前的position的值为%f,%f",self.blueView.layer.position.x,self.blueView.layer.position.y);
}

- (void)beginTranslateAnimation {
    NSLog(@"开始平移动画");
    //在使用animationWithKeyPath时，不应该在前面加translation
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position.x"];
//    animation1.keyPath = @"position.x";
//    animation1.byValue = @(50);
    animation1.toValue = @(200);
    animation1.duration = 1.0f;
    animation1.beginTime = 0.f;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    [self.blueView.layer addAnimation:animation1 forKey:@"animation1"];
}

- (UIView *)testView {
    if (_testView) {
        return _testView;
    }
    _testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    _testView.backgroundColor = [UIColor redColor];
    return _testView;
}

- (UIView *)blueView {
    if (_blueView) {
        return _blueView;
    }
    _blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 60, 100)];
    _blueView.backgroundColor = [UIColor blueColor];
    return _blueView;
}

- (UIButton *)button {
    if (_button) {
        return _button;
    }
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    _button.backgroundColor = [UIColor whiteColor];
    [_button setTitle:@"开始动画" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(beginAnimation) forControlEvents:UIControlEventTouchUpInside];
    return _button;
}

#pragma mark - CAAniamtionDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"当前动画已经开始");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        NSLog(@"当前动画正常结束");
//        [self resetOriginState];
    } else {
        NSLog(@"动画过程中被打断");
    }
}

@end
