//
//  AlertView.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/13.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor blueColor];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gsr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:gsr];
}

- (void)dismiss {
    if (self.superview) {
        [self removeFromSuperview];
    }
}

- (void)showToView:(UIView *)view {
    [view addSubview:self];
    self.center = view.center;
}

@end
