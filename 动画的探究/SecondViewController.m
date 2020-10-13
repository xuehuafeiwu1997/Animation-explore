//
//  SecondViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/12.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"
#import "AlertView.h"

@interface SecondViewController ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) AlertView *alertView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CoreAnimation实现弹窗的弹出和消失";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    [self.view addSubview:self.label];
    self.label.center = self.view.center;
}

- (UILabel *)label {
    if (_label) {
        return _label;
    }
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    _label.textColor = [UIColor blackColor];
    _label.font = [UIFont systemFontOfSize:18];
    _label.text = @"点击弹出弹窗";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor grayColor];
    _label.userInteractionEnabled = YES;
    UITapGestureRecognizer *gsr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAlert)];
    [_label addGestureRecognizer:gsr];
    return _label;
}

- (void)showAlert {
    NSLog(@"展示弹窗的动画");
    [self.alertView showToView:self.view];
}

- (AlertView *)alertView {
    if (_alertView) {
        return _alertView;
    }
    _alertView = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    return _alertView;
}

@end
