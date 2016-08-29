//
//  Tool.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/27.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "Tool.h"

@interface Tool ()
@property (nonatomic, assign) NSUInteger count;

@end

@implementation Tool

+ (instancetype)sharedInstance {
    static Tool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[Tool alloc] init];
    });
    return tool;
}

- (void)addCount {
    self.count += 1;
    NSLog(@"点击次数:%ld", self.count);
}

@end
