//
//  ThirdViewController.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/27.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "ThirdViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ThirdViewController ()
@property (strong, nonatomic) IBOutlet UILabel *firstL;
@property (strong, nonatomic) IBOutlet UILabel *secondL;
@property (nonatomic, strong) Person *person;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[Person alloc] init];
}

- (IBAction)sayName:(id)sender {
    self.firstL.text = [NSString stringWithFormat:@"%@", self.person.sayName];
}

- (IBAction)sayGender:(id)sender {
    self.secondL.text = [NSString stringWithFormat:@"%@", self.person.sayGender];
}

- (IBAction)changeSelector:(id)sender {
    Method method1 = class_getInstanceMethod([self.person class], @selector(sayName));
    Method method2 = class_getInstanceMethod([self.person class], @selector(sayGender));
    /*!
     *  交换两个方法的实现方式
     */
    method_exchangeImplementations(method1, method2);
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
