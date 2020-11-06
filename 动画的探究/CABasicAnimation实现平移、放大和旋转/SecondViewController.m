//
//  SecondViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/14.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"

@interface SecondViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UIButton *transformButton;//平移按钮
@property (nonatomic, strong) UIButton *scaleButton;//旋转按钮
@property (nonatomic, strong) UIButton *rotationButton;//放大按钮

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"CABasicAnimation实现平移、放大和旋转操作";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.myView];
    [self.myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
        make.width.equalTo(@200);
        make.height.equalTo(@100);
    }];
    [self.view addSubview:self.transformButton];
    [self.transformButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.myView.mas_bottom).offset(100);
        make.width.greaterThanOrEqualTo(@0);
        make.height.greaterThanOrEqualTo(@0);
    }];
    [self.view addSubview:self.scaleButton];
    [self.scaleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.transformButton.mas_bottom).offset(20);
        make.width.greaterThanOrEqualTo(@0);
        make.height.greaterThanOrEqualTo(@0);
    }];
    [self.view addSubview:self.rotationButton];
    [self.rotationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.scaleButton.mas_bottom).offset(20);
        make.width.greaterThanOrEqualTo(@0);
        make.height.greaterThanOrEqualTo(@0);
    }];
}

- (UIView *)myView {
    if (_myView) {
        return _myView;
    }
    _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _myView.backgroundColor = [UIColor yellowColor];
    return _myView;
}

- (UIButton *)transformButton {
    if (_transformButton) {
        return _transformButton;
    }
    _transformButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_transformButton setTitle:@"平移按钮" forState:UIControlStateNormal];
    [_transformButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_transformButton addTarget:self action:@selector(beginTranslationAnimation) forControlEvents:UIControlEventTouchUpInside];
    return _transformButton;
}

- (UIButton *)scaleButton {
    if (_scaleButton) {
        return _scaleButton;
    }
    _scaleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_scaleButton setTitle:@"放大按钮" forState:UIControlStateNormal];
    [_scaleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_scaleButton addTarget:self action:@selector(beginEnlargeAnimation) forControlEvents:UIControlEventTouchUpInside];
    return _scaleButton;
}

- (UIButton *)rotationButton {
    if (_rotationButton) {
        return _rotationButton;
    }
    _rotationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_rotationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_rotationButton setTitle:@"旋转按钮" forState:UIControlStateNormal];
    [_rotationButton addTarget:self action:@selector(beginRotationAnimation) forControlEvents:UIControlEventTouchUpInside];
    return _rotationButton;
}

//开始平移动画
- (void)beginTranslationAnimation {
    NSLog(@"开始执行平移动画");
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    //注意：不能使用transform.position.x,那样的话动画无效
    animation1.keyPath = @"position.x";
    animation1.duration = 1.0f;
    animation1.byValue = @(100);
    animation1.beginTime = 0.f;
    animation1.delegate = self;
    //动画维持结束后的状态
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:animation1 forKey:@"animation1"];
}

//开始放大动画
- (void)beginEnlargeAnimation {
    NSLog(@"开始执行放大动画");
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"transform.scale";
    animation2.fromValue = @(1.0);
    animation2.toValue = @(2.0);
    animation2.duration = 1.0f;
    animation2.beginTime = 0.f;
    animation2.removedOnCompletion = NO;
    animation2.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:animation2 forKey:@"animation2"];
}

//开始旋转动画
- (void)beginRotationAnimation {
    NSLog(@"开始执行旋转动画");
    CABasicAnimation *animation3 = [CABasicAnimation animation];
    animation3.keyPath = @"transform.rotation.z";
    animation3.byValue = @(M_PI_2);
    animation3.beginTime = 0.f;
    animation3.duration = 1.0f;
    animation3.removedOnCompletion = NO;
    animation3.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:animation3 forKey:@"animation3"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"动画开始执行");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        NSLog(@"动画正常结束");
    } else {
        NSLog(@"动画被打断，未正常结束");
    }
}

@end
