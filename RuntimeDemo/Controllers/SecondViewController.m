//
//  SecondViewController.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/25.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "SecondViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@property (strong, nonatomic) IBOutlet UILabel *nameL;
@property (nonatomic, strong) Person *person;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.person = [[Person alloc] init];
    
}

- (IBAction)addMethodAction:(UIButton *)sender {
    
    /*!
     *  IMP 实现方法地址
     *  "v@:" v表示void; @表示id sel; :表示 SEL _cmd;
     *  "v@:@@" 两个参数没有返回值
     */
    class_addMethod([self.person class], @selector(answer), (IMP)answerIMP, "v@:");
    if ([self.person respondsToSelector:@selector(answer)]) {
        [self.person performSelector:@selector(answer)];
    } else {
        NSLog(@"i don't know");
    }
    self.nameL.text = [NSString stringWithFormat:@"My name is %@", self.nameTF.text];
}

void answerIMP(id self, SEL _cmd) {
    NSLog(@"我是添加方法的实现");
}

/*!
 *  该方法在OC消息转发生效时被调用
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"instanceMethod ------ %@", NSStringFromSelector(sel));
    return [super resolveInstanceMethod:sel];
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    NSLog(@"classMethod ------ %@", NSStringFromSelector(sel));
    return [super resolveClassMethod:sel];
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
