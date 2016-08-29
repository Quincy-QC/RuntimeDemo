//
//  Tool.h
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/27.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

+ (instancetype)sharedInstance;

- (void)addCount;

@end
