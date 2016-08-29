//
//  SixthViewController.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/27.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "SixthViewController.h"
#import "Movie.h"

@interface SixthViewController ()

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Movie *movie = [[Movie alloc] init];
    movie.movieId = @"12345";
    movie.movieName = @"hahahah";
    movie.pic_url = @"ooooo";
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"archiver.text"];
    NSLog(@"%@", filePath);
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    // 归档至文件
    [NSKeyedArchiver archiveRootObject:movie toFile:filePath];
    // 反归档取出文件
    Movie *mo = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", mo);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
