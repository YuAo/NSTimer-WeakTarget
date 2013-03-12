//
//  WUNSTimerTargetLifecycleTracker.m
//  NSTimer+WeakTarget
//
//  Created by YuAo on 3/12/13.
//  Copyright (c) 2013 YuAo. All rights reserved.
//

#import "WUNSTimerTargetLifecycleTracker.h"
#import "WUNSTimerWeakTarget.h"

@interface WUNSTimerTargetLifecycleTracker ()

@property (nonatomic, weak) WUNSTimerWeakTarget *weakTarget;

@end

@implementation WUNSTimerTargetLifecycleTracker

- (id)initWithTimerWeakTarget:(WUNSTimerWeakTarget *)weakTarget {
    if (self = [super init]) {
        _weakTarget = weakTarget;
    }
    return self;
}

- (void)dealloc {
    [self.weakTarget.timer invalidate];
}

@end
