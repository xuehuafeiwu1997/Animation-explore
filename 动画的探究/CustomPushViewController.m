//
//  CustomPushViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/15.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "CustomPushViewController.h"
#import "Masonry.h"

@interface CustomPushViewController ()

@end

@implementation CustomPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"自定义push转场后的控制器";
}



@end
