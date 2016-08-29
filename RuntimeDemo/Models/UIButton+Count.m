//
//  UIButton+Count.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/27.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "UIButton+Count.h"
#import <objc/runtime.h>
#import "Tool.h"

@implementation UIButton (Count)

// The load message is sent to classes and categories that are both dynamically loaded and statically linked, but only if the newly loaded class or category implements a method that can respond.
// A class’s +load method is called after all of its superclasses’ +load methods.
// A category +load method is called after the class’s own +load method.
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class selfClass = [self class];
        
        SEL oriSEL = @selector(sendAction:to:forEvent:);
        Method oriMethod = class_getInstanceMethod(selfClass, oriSEL);
        
        SEL cusSEL = @selector(mySendAction:to:forEvent:);
        Method cusMethod = class_getInstanceMethod(selfClass, cusSEL);
        
        BOOL addSuccess = class_addMethod(selfClass, oriSEL, method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSuccess) {
            class_replaceMethod(selfClass, cusSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        } else {
            method_exchangeImplementations(oriMethod, cusMethod);
        }
        
    });
}

- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [[Tool sharedInstance] addCount];
    [self mySendAction:action to:target forEvent:event];
}

@end
