//
//  MBSearchTableViewController.m
//  MusicBoxer
//
//  Created by 梁中豪 on 2017/9/26.
//  Copyright © 2017年 梁中豪. All rights reserved.
//

#import "MBSearchTableViewController.h"
#import "MBSearchReacordCell.h"
#import "MBSearchHistoryModel.h"

@interface MBSearchTableViewController ()

@end

@implementation MBSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = UIColor.whiteColor;
    [self.tableView registerClass:[MBSearchReacordCell class] forCellReuseIdentifier:@"historyCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    MBSearchHistoryModel *modal = [[MBSearchHistoryModel alloc] init];
    _historyRecords = modal.dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//当popover视图弹出时，dismiss后再点击 需要重新排版这些视图
- (void)viewWillLayoutSubviews
{
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height);
    [super viewWillLayoutSubviews];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _historyRecords.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    }
    return 45;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"historyCell";
    MBSearchReacordCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier      forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[MBSearchReacordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        [cell setItem:nil row:indexPath.row];
    }
    else
    {
        [cell setItem:_historyRecords[indexPath.row - 1] row:indexPath.row];
//        [cell setDelegate:self];
    }
    return cell;
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
