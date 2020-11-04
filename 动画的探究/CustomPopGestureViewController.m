//
//  CustomPopGestureViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/11/3.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "CustomPopGestureViewController.h"
#import "PopAnimation.h"

@interface CustomPopGestureViewController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation CustomPopGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"类似系统侧滑返回手势实现";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor yellowColor];
    
    //禁用系统自带的侧滑返回手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    [self.view addGestureRecognizer:self.pan];
    
    self.navigationController.delegate = self;
}

- (UIPanGestureRecognizer *)pan {
    if (_pan) {
        return _pan;
    }
    _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    return _pan;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    if (self.navigationController.childViewControllers.count == 1) {
        return;
    }
    CGPoint point = [pan translationInView:self.view];
    CGFloat percent = point.x / self.view.bounds.size.width;
    NSLog(@"percent的进度值为:%f",percent);
    percent = MIN(MAX(0, percent), 1);
    if (pan.state == UIGestureRecognizerStateBegan) {
        _interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self.navigationController popViewControllerAnimated:YES];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        [_interactiveTransition updateInteractiveTransition:percent];
    } else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        //手势结束后，若进度大于0.5就完成pop动画，否则取消
        if (percent > 0.5) {
            [_interactiveTransition finishInteractiveTransition];
        } else {
            [_interactiveTransition cancelInteractiveTransition];
        }
        _interactiveTransition = nil;
    }
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if ([animationController isKindOfClass:[PopAnimation class]]) {
        NSLog(@"执行了这个方法UIPercentDrivenInteractiveTransition");
        return _interactiveTransition;
    }
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        NSLog(@"执行了这个方法PopAnimation");
        return [[PopAnimation alloc] init];
    }
    return nil;
}

@end
