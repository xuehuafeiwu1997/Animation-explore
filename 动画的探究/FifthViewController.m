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

@interface FifthViewController ()

@property (nonatomic, strong) UIButton *pushButton;

@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"push的自定义转场动画";
    self.navigationController.delegate = self;
    
    self.pushButton.center = self.view.center;
    [self.view addSubview:self.pushButton];
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
//当这个协议方法存在时，执行的是交互式的转场动画，下方的协议方法不再实现
//- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
//    return [[PushInteractiveViewController alloc] init];
//}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return [[PushAnimationController alloc] init];
}
@end
