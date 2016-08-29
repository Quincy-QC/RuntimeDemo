//
//  Movie.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/29.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "Movie.h"
#import <objc/runtime.h>

@implementation Movie

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList([Movie class], &count);
    
    for (int i = 0; i < count; i++) {
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    
    free(ivars);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self) {
        
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([Movie class], &count);
        for (int i = 0; i < count; i++) {
            // 取出i位置对于的成员变量
            Ivar ivar = ivars[i];
            // 查看成员变量
            const char *name = ivar_getName(ivar);
            // 归档
            NSString *key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            // 设置到成员变量身上
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    
    return self;
}










- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

/*!
 *  对该类的描述
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"%@--%@--%@--%@", _movieId, _movieName, _pic_url, _user];
}

@end
