//
//  WUNSTimerWeakTarget.m
//  NSTimer+WeakTarget
//
//  Created by YuAo on 3/10/13.
//  Copyright (c) 2013 YuAo. All rights reserved.
//

#import "WUNSTimerWeakTarget.h"

@interface WUNSTimerWeakTarget()

@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, weak) id      target;
@property (nonatomic)       SEL     selector;

@end

@implementation WUNSTimerWeakTarget

- (id)initWithTarget:(id)target selector:(SEL)selector {
    if (self = [super init]) {
        _target = target;
        _selector = selector;
    }
    return self;
}

- (void)setupForTimer:(NSTimer *)timer {
    self.timer = timer;
}

- (void)WUNSTimerWeakTargetPlaceHolderEmptyMethod {}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = nil;
    if (aSelector == self.selector) {
        if (self.target) {
            signature = [self.target methodSignatureForSelector:aSelector];
        } else {
            signature = [self methodSignatureForSelector:@selector(WUNSTimerWeakTargetPlaceHolderEmptyMethod)];
        }
    } else {
        signature = [super methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if (self.target) {
        if (anInvocation.selector == self.selector) {
            [anInvocation invokeWithTarget:self.target];
        } else {
            [super forwardInvocation:anInvocation];
        }
    } else {
        [self.timer invalidate];
    }
}

@end
