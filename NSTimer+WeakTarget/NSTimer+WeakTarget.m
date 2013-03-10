//
//  NSTimer+WeakTarget.m
//  NSTimer+WeakTarget
//
//  Created by YuAo on 3/10/13.
//  Copyright (c) 2013 YuAo. All rights reserved.
//

#import "NSTimer+WeakTarget.h"
#import "WUNSTimerWeakTarget.h"

@implementation NSTimer (WeakTarget)

- (id)initWithFireDate:(NSDate *)date
              interval:(NSTimeInterval)timeInterval
            weakTarget:(id)target selector:(SEL)selector
              userInfo:(id)userInfo
               repeats:(BOOL)repeats
{
    WUNSTimerWeakTarget *weakTarget = [[WUNSTimerWeakTarget alloc] initWithTarget:target selector:selector];
    NSTimer *timer = [self initWithFireDate:date interval:timeInterval target:weakTarget selector:selector userInfo:userInfo repeats:repeats];
    [weakTarget setupForTimer:timer];
    return timer;
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval
                        weakTarget:(id)target
                          selector:(SEL)selector
                          userInfo:(id)userInfo
                           repeats:(BOOL)repeats
{
    WUNSTimerWeakTarget *weakTarget = [[WUNSTimerWeakTarget alloc] initWithTarget:target selector:selector];
    NSTimer *timer = [self timerWithTimeInterval:timeInterval target:weakTarget selector:selector userInfo:userInfo repeats:repeats];
    [weakTarget setupForTimer:timer];
    return timer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                 weakTarget:(id)target
                                   selector:(SEL)selector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats
{
    WUNSTimerWeakTarget *weakTarget = [[WUNSTimerWeakTarget alloc] initWithTarget:target selector:selector];
    NSTimer *timer = [self scheduledTimerWithTimeInterval:timeInterval target:weakTarget selector:selector userInfo:userInfo repeats:repeats];
    [weakTarget setupForTimer:timer];
    return timer;
}

@end
