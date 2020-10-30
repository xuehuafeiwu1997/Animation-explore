//
//  SeventhViewController.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/16.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "SeventhViewController.h"

@interface SeventhViewController ()

@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UIView *blueView;

@end

@implementation SeventhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"由于锚点变化导致的旋转异常";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    testView.backgroundColor = [UIColor redColor];
    [self.view addSubview:testView];
    self.testView = testView;
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 140, 100, 60)];
    blueView.backgroundColor = [UIColor blueColor];
    [testView addSubview:blueView];
    self.blueView = blueView;
    NSLog(@"当前的锚点的坐标为x为%f,y为%f",blueView.layer.anchorPoint.x,blueView.layer.anchorPoint.y);
    NSLog(@"当前position的位置为x为%f,y为%f",blueView.layer.position.x,blueView.layer.position.y);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //点击空白处开始动画
    [self blueViewBeginAnimation];
//    [self testViewBeginAnimation];
    
}

- (void)translationBeginAnimation {
    
}

- (void)testViewBeginAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = [NSNumber numberWithFloat:-M_PI_2];//旋转90度
    animation.duration = 1.0f;
    animation.beginTime = 0;
    //如果不加这句话，动画会回归原点，此时表现为没有动画的样子
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    //设置锚点
    /*
     未设置锚点时，旋转是围绕中心旋转的，一切表现正常
     设置锚点为（0，0），旋转异常，围绕的是self.view的中心进行的旋转
     设置position时,位置会发生变化，会以position那个点为中心进行旋转，位置发生了平移
     
     只有两个同时设置，才可以实现其绕左上角的旋转动画
     */
    
    self.testView.layer.anchorPoint = CGPointMake(0, 1);
    self.testView.layer.position = CGPointMake(100, 300);
    [self.testView.layer addAnimation:animation forKey:@"rotationOne"];
}

- (void)blueViewBeginAnimation {
    //先要横向平移一个宽度，之后再旋转才能达到我们要的效果。平移动画未实现，还没有查找到相应的原因
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.position.x"];//横向移动
    animation1.fromValue = @(50);
    animation1.toValue = @(110);
    animation1.duration = 0.5f;
    animation1.beginTime = 0;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
//    [self.blueView.layer addAnimation:animation1 forKey:@"transform"];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = [NSNumber numberWithFloat:-M_PI_2];//旋转90度
    animation.duration = 1.0f;
    animation.beginTime = 0.5f;
    //如果不加这句话，动画会回归原点，此时表现为没有动画的样子
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    //设置锚点
    self.blueView.layer.anchorPoint = CGPointMake(0, 1);//发生异常
    //设置position
    self.blueView.layer.position = CGPointMake(60, 200);
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation1,animation];
    group.duration = 1.5f;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.repeatCount = 1;
    
    [self.blueView.layer addAnimation:group forKey:@"group"];
//    [self.blueView.layer addAnimation:animation forKey:@"rotation"];
    /*
     使用默认锚点和默认的旋转位置时，逆时针旋转90度，锚点和position的位置没有发生变化
     */
    NSLog(@"旋转过后------------------------------");
    NSLog(@"当前的锚点的坐标为x为%f,y为%f",self.blueView.layer.anchorPoint.x,self.blueView.layer.anchorPoint.y);
    NSLog(@"当前position的位置为x为%f,y为%f",self.blueView.layer.position.x,self.blueView.layer.position.y);
}

@end
