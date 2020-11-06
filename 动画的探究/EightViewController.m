//
//  EightViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/11/3.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "EightViewController.h"
#import "CustomPopGestureViewController.h"

@interface EightViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation EightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测滑返回手势测试";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button.center = self.view.center;
    [self.view addSubview:self.button];
}

- (UIButton *)button {
    if (_button) {
        return _button;
    }
    _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_button setTitle:@"跳转下一个播放器" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    return _button;
}

- (void)buttonClicked {
    NSLog(@"点击了跳转按钮");
    CustomPopGestureViewController *vc = [[CustomPopGestureViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
