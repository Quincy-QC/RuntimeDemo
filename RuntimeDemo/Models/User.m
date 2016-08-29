//
//  User.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/29.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "User.h"

@implementation User

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@--%@--%@", _name, _age, _sex];
}

@end
