//
//  PushAnimationController.h
//  动画的探究
//
//  Created by 许明洋 on 2020/10/16.
//  Copyright © 2020 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PushAnimationController : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, copy) dispatch_block_t completeBlock;

@end

NS_ASSUME_NONNULL_END
