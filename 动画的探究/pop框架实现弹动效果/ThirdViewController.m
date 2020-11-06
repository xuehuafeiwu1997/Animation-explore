//
//  ThirdViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/13.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "ThirdViewController.h"
#import <pop/POP.h>

@interface ThirdViewController ()

@property (nonatomic, strong) UIView *myView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"pop框架实现弹簧动画";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self.view addSubview:self.tableView];
    self.myView.center = self.view.center;
    [self.view addSubview:self.myView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //初始化弹簧动画
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    springAnimation.springSpeed = 0;//设置动画的速度
    springAnimation.springBounciness = 10;//设置弹性大小
    springAnimation.dynamicsFriction = 10;//设置阻力的大小
    springAnimation.dynamicsTension = 100;//设置张力的大小
    if (self.myView.frame.size.width == 100) {
        springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 50, 50)];
    } else {
        springAnimation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    }
    
    //添加动画
    [self.myView.layer pop_addAnimation:springAnimation forKey:@"animation"];
}

- (UIView *)myView {
    if (_myView) {
        return _myView;
    }
    _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _myView.backgroundColor = [UIColor yellowColor];
    return _myView;
}
@end
