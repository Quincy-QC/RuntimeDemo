//
//  Person.h
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/25.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;

- (NSString *)sayName;
- (NSString *)sayGender;

@end
