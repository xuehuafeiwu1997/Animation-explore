//
//  CustomPopGestureViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/11/3.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "CustomPopGestureViewController.h"

@interface CustomPopGestureViewController ()

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
}


@end
