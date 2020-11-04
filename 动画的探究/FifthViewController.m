//
//  FifthViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/15.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "FifthViewController.h"
#import "CustomPushViewController.h"
#import "PushAnimationController.h"
#import "PushInteractiveViewController.h"

@interface FifthViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *pushButton;

@end

@implementation FifthViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"push的自定义转场动画";
    
    self.pushButton.center = self.view.center;
    [self.view addSubview:self.pushButton];
    
    self.navigationController.delegate = self;
    
    //自定义push动画后，测滑返回手势失效(需要加上这样代码)
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (UIButton *)pushButton {
    if (_pushButton) {
        return _pushButton;
    }
    _pushButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_pushButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_pushButton setTitle:@"开始push自定义转场动画" forState:UIControlStateNormal];
    [_pushButton addTarget:self action:@selector(pushButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    return _pushButton;
}

- (void)pushButtonClicked {
    CustomPushViewController *vc = [[CustomPushViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return [[PushAnimationController alloc] init];
    }
    return nil;
}
@end
