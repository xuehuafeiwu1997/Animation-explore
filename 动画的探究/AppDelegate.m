//
//  AppDelegate.m
//  动画的探究
//
//  Created by 许明洋 on 2020/10/12.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "CustomVCTransitionViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"
#import "EighthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
//    FirstViewController *vc = [[FirstViewController alloc] init];
//    SecondViewController *vc = [[SecondViewController alloc] init];
//    ThirdViewController *vc = [[ThirdViewController alloc] init];
//    CustomVCTransitionViewController *vc = [[CustomVCTransitionViewController alloc] init];
    FifthViewController *vc = [[FifthViewController alloc] init];
//    SixthViewController *vc = [[SixthViewController alloc] init];
//    SeventhViewController *vc = [[SeventhViewController alloc] init];
//    EighthViewController *vc = [[EighthViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    return YES;
}

@end
