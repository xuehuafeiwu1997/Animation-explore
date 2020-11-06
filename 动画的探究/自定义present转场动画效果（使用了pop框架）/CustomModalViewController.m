//
//  CustomModalViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/15.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "CustomModalViewController.h"

@interface CustomModalViewController ()

@property (nonatomic, strong) UIButton *dismissButton;

@end

@implementation CustomModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    self.view.layer.cornerRadius = 8.f;
    self.dismissButton.center = self.view.center;
    [self.view addSubview:self.dismissButton];
}

- (UIButton *)dismissButton {
    if (_dismissButton) {
        return _dismissButton;
    }
    _dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [_dismissButton setTitle:@"消失" forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_dismissButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    return _dismissButton;
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
