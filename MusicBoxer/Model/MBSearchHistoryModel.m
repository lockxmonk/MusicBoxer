//
//  MBSearchHistoryModel.m
//  MusicBoxer
//
//  Created by 梁中豪 on 2017/9/27.
//  Copyright © 2017年 梁中豪. All rights reserved.
//

#import "MBSearchHistoryModel.h"
#import "MBSearchReacordCell.h"

@implementation MBSearchHistoryModel

-(instancetype)init{
    self = [super init];
    if (self) {
        _dataArray = [NSMutableArray array];
        NSArray *array = @[@"动漫",@"游戏",@"视频",@"小说",@"美食",@"动漫-日本动漫",@"影视",@"影视-楚乔传"];
        _dataArray = [array mutableCopy];
    }
    return self;
}
/**
#pragma mark -- tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (self.dataArray.count) {
        return self.dataArray.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [((MBSearchReacordCell *)cell) setItemWithTitle:self.dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *content = self.dataArray[indexPath.row];
    NSLog(@"===================选中%@",content);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
 **/
@end
