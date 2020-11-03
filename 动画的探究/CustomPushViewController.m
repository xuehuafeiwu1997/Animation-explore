//
//  CustomPushViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/15.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "CustomPushViewController.h"
#import "Masonry.h"
#import "FifthViewController.h"

@interface CustomPushViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *button;

@end

@implementation CustomPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"自定义push转场后的控制器";
    self.button.center = self.view.center;
    [self.view addSubview:self.button];
    
    //自定义push动画后，测滑返回手势失效(需要加上这样代码)
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (UIButton *)button {
    if (_button) {
        return _button;
    }
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_button setTitle:@"测试" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    return _button;
}

- (void)buttonClicked {
    NSLog(@"点击了按钮");
    NSLog(@"当前的测滑返回手势为%d",self.navigationController.interactivePopGestureRecognizer.enabled);
}
@end
