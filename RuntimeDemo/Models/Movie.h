//
//  Movie.h
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/29.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Movie : NSObject <NSCoding>

@property (nonatomic, strong) NSString *movieId;
@property (nonatomic, strong) NSString *movieName;
@property (nonatomic, strong) NSString *pic_url;
@property (nonatomic, strong) User *user;

@end
