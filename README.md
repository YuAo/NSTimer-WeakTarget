#NSTimer-WeakTarget

A NSTimer category which adds the support of weak target for NSTimer.

With this NSTimer category. You will NEVER worry about NSTimer retaining it's target.

##What's included?

Tree methods.

Turn the target-action based NSTimer, to the weak target-action based NSTimer.

NSTimer created with these methods will NOT retain it's target, and the timer will automatically be invalidated after the target is disposed.

```
@interface NSTimer (WeakTarget)

- (id)initWithFireDate:(NSDate *)date
              interval:(NSTimeInterval)timeInterval
            weakTarget:(id)target
              selector:(SEL)selector
              userInfo:(id)userInfo
               repeats:(BOOL)repeats;

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval
                        weakTarget:(id)target
                          selector:(SEL)selector
                          userInfo:(id)userInfo
                           repeats:(BOOL)repeats;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                 weakTarget:(id)target
                                   selector:(SEL)selector
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;

@end
```
##Requirements

- Automatic Reference Counting (ARC)
- iOS 5.0+
- Xcode 4.5+

##Contributing

If you find a bug and know exactly how to fix it, please open a pull request.

If you can't make the change yourself, please open an issue after making sure that one isn't already logged.

##License

The MIT license, as aways.
