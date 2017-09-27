//
//  MBfirstViewController.m
//  MusicBoxer
//
//  Created by 梁中豪 on 2017/9/25.
//  Copyright © 2017年 梁中豪. All rights reserved.
//

#import "MBfirstViewController.h"
#import "DXPopover.h"
#import "MBSearchReacordCell.h"


@interface MBfirstViewController ()

@property (nonatomic, strong) DXPopover *popover;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation MBfirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"音 乐";
    
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark -- UI
-(void)buildUIElements{
    UISearchBar *bar = [[UISearchBar alloc] init];
    bar.showsCancelButton = NO;
    bar.tintColor = UIColor.orangeColor;
    bar.placeholder =@"请输入感兴趣的音乐";
    
    [self.view addSubview:bar];
    
    [bar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@40);
    }];
}

-(UITableView*)tableView{
    if (_tableView == nil)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        [_tableView registerClass:[MBSearchReacordCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
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
