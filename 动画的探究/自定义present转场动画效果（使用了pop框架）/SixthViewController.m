//
//  CustomVCTransitionViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/15.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SixthViewController.h"
#import "CustomModalViewController.h"
#import "PresentingAnimationController.h"
#import "DismissingAnimationController.h"

@interface SixthViewController ()

@property (nonatomic, strong) UIButton *presentButton;

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"自定义present的转场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.presentButton.center = self.view.center;
    [self.view addSubview:self.presentButton];
}



- (void)didClickOnPresent:(UIButton *)button {
    NSLog(@"点击了开启转场动画的按钮");
    CustomModalViewController *modalVC = [[CustomModalViewController alloc] init];
    modalVC.transitioningDelegate = self;
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:modalVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitionDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[PresentingAnimationController alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[DismissingAnimationController alloc] init];
}

- (UIButton *)presentButton {
    if (_presentButton) {
        return _presentButton;
    }
    _presentButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_presentButton setTitle:@"点击开始自定义转场动画" forState:UIControlStateNormal];
    [_presentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _presentButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [_presentButton addTarget:self action:@selector(didClickOnPresent:) forControlEvents:UIControlEventTouchUpInside];
    [_presentButton sizeToFit];
    return _presentButton;
}

@end
