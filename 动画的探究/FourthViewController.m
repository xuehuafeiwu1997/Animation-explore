//
//  FourthViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/14.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"pop实现转场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}


@end
