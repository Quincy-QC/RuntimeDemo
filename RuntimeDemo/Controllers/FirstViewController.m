//
//  FirstViewController.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/25.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "FirstViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@property (strong, nonatomic) IBOutlet UILabel *nameL;
@property (nonatomic, strong) Person *person;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.person = [[Person alloc] init];
    self.nameL.text = [NSString stringWithFormat:@"My name is %@", self.person.name];
}


- (IBAction)changeNameAction:(UIButton *)sender {
    
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([self.person class], &count);
    NSLog(@"ivar--%p", ivar);
    for (int i = 0; i < count; i++) {
        /*!
         *  Ivar 定义对象的实例变量,包括类型和名字
         */
        Ivar var = ivar[i];
        NSLog(@"var--%p", var);
        const char *varName = ivar_getName(var);
        NSString *proName = [NSString stringWithUTF8String:varName];
        if ([proName isEqualToString:@"_name"]) { // 关键的下划线
            
            object_setIvar(self.person, var, self.nameTF.text);
            break;
        }
    }
    self.nameL.text = [NSString stringWithFormat:@"My name is %@", self.person.name];
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
