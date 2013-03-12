//
//  WUNSTimerWeakTarget.m
//  NSTimer+WeakTarget
//
//  Created by YuAo on 3/10/13.
//  Copyright (c) 2013 YuAo. All rights reserved.
//

#import "WUNSTimerWeakTarget.h"

@interface WUNSTimerWeakTarget()

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

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = nil;
    if (aSelector == self.selector) {
        signature = [self.target methodSignatureForSelector:aSelector];
    } else {
        signature = [super methodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if (anInvocation.selector == self.selector) {
        [anInvocation invokeWithTarget:self.target];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

@end
