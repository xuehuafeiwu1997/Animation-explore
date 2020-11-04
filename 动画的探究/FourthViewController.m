//
//  FourthViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/14.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@property (nonatomic, strong) UIView *myView;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"CABasicAnimation实现平移、放大和旋转操作";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myView.center = self.view.center;
    [self.view addSubview:self.myView];
}

- (UIView *)myView {
    if (_myView) {
        return _myView;
    }
    _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _myView.backgroundColor = [UIColor yellowColor];
    return _myView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self beginTranslationAnimation];//平移动画
//    [self beginEnlargeAnimation];//放大动画
    [self beginRotationAnimation];//旋转动画
    
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

@end
