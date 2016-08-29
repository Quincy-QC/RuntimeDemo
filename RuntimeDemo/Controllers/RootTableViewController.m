//
//  RootTableViewController.m
//  RuntimeDemo
//
//  Created by UntilYou-QC on 16/8/25.
//  Copyright © 2016年 UntilYou-QC. All rights reserved.
//

#import "RootTableViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"

#define URL http://gcblog.github.io/2016/04/16/runtime详解/#more

@interface RootTableViewController ()
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.dataSource = @[@"动态变量控制", @"动态添加方法", @"动态交换两个方法的实现", @"在方法上增加额外功能", @"实现字典转模型的自动转换", @"实现NSCoding的自动归档与解档"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    switch (indexPath.row) {
        case 0:{
            FirstViewController *firstVC =[storyboard instantiateViewControllerWithIdentifier:@"first"];
            firstVC.title = self.dataSource[indexPath.row];
            [self.navigationController pushViewController:firstVC animated:YES];
            break;
        }
        case 1:{
            SecondViewController *secondVC = [storyboard instantiateViewControllerWithIdentifier:@"second"];
            secondVC.title = self.dataSource[indexPath.row];
            [self.navigationController pushViewController:secondVC animated:YES];
            break;
        }
        case 2:{
            ThirdViewController *thirdVC = [storyboard instantiateViewControllerWithIdentifier:@"third"];
            thirdVC.title = self.dataSource[indexPath.row];
            [self.navigationController pushViewController:thirdVC animated:YES];
            break;
        }
        case 3:{
            ForthViewController *forthVC = [[ForthViewController alloc] init];
            forthVC.title = self.dataSource[indexPath.row];
            [self.navigationController pushViewController:forthVC animated:YES];
            break;
        }
        case 4:{
            FifthViewController *fifthVC = [[FifthViewController alloc] init];
            fifthVC.title = self.dataSource[indexPath.row];
            [self.navigationController pushViewController:fifthVC animated:YES];
            break;
        }
        case 5:{
            SixthViewController *sixthVC = [[SixthViewController alloc] init];
            sixthVC.title = self.dataSource[indexPath.row];
            [self.navigationController pushViewController:sixthVC animated:YES];
            break;
        }
            
        default:
            break;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
