//
//  SixthViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/16.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SixthViewController.h"

@interface SixthViewController ()

@property (nonatomic) UIView *myView;

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"图形旋转90度的实现";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myView.center = self.view.center;
    [self.view addSubview:self.myView];
}

- (UIView *)myView {
    if (_myView) {
        return _myView;
    }
    _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    _myView.backgroundColor = [UIColor yellowColor];
    return _myView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"开始动画");
    [self beginAnimation];
}

- (void)beginAnimation {
    //实现绕圈旋转，只能使用static定义i，因为animation.toValue是以最初的作为计算的
    static int i = 1;
    if ([self.myView.layer animationForKey:@"rotation"]) {
        [self.myView.layer removeAnimationForKey:@"rotation"];
    }
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = [NSNumber numberWithFloat:M_PI_4 * i];//旋转45度
    animation.duration = 1.0f;
    animation.beginTime = 0.5f;
    //如果不加这句话，动画会回归到原点，此时表现为没有动画的样子
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.myView.layer addAnimation:animation forKey:@"rotation"];
    i++;
}

@end
