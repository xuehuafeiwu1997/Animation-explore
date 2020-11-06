//
//  FirstViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/12.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) UIView *myView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"UIView Animation实现动画效果";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    [self.view addSubview:self.myView];
    self.myView.center = self.view.center;
}

- (UIView *)myView {
    if (_myView) {
        return _myView;
    }
    _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _myView.backgroundColor = [UIColor redColor];
    return _myView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:1 animations:^{
        self.myView.frame = CGRectMake(200, 300, 100, 100);
        self.myView.backgroundColor = [UIColor blueColor];
    } completion:^(BOOL finished) {
        NSLog(@"动画效果完成");
    }];
}

@end
