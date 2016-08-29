//
//  FifthViewController.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/27.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "FifthViewController.h"
#import "NSObject+Item.h"
#import "Movie.h"
#import "User.h"

@interface FifthViewController () <ModelDelegate>
@property (nonatomic, strong) NSMutableArray *allDataArray;

@end

@implementation FifthViewController
- (NSMutableArray *)allDataArray {
    if (!_allDataArray) {
        _allDataArray = [NSMutableArray array];
    }
    return _allDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *user = @{ @"name":@"zhangsan",
                            @"age": @(12),
                            @"sex": @"man",
                            };
    
    
    NSDictionary *dict = @{ @"movieId":@"28678",
                            @"movieName": @"539fU8276",
                            @"pic_url": @"fsdfds",
                            @"user" : user
                            };
    
    
    NSArray *addarr = @[dict ,dict, dict];
    
//    NSMutableDictionary *mudict = [NSMutableDictionary dictionaryWithDictionary:dict];
//    [mudict setObject:user forKey:@"user"];
    
    for (NSDictionary *item in addarr) {
//        Movie *movie = [[Movie alloc] init];
//        [movie setValuesForKeysWithDictionary:item];
//        [self.allDataArray addObject:movie];
        
        Movie *movie = [Movie objectWithDictionary:item];
        [self.allDataArray addObject:movie];
    }
    
//    NSLog(@"%@", self.allDataArray);
    for (Movie *mo in self.allDataArray) {
        NSLog(@"%@", mo.user.name);
    }
    
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
