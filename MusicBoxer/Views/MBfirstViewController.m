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
#import "MBSearchHistoryModel.h"
#import "MBSearchTableViewController.h"


@interface MBfirstViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) DXPopover *popover;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) MBSearchHistoryModel *viewModel;
@property (nonatomic,strong) MBSearchTableViewController *historyViewController;


@end

@implementation MBfirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"音 乐";
    _viewModel  = [[MBSearchHistoryModel alloc] init];
    
    
    [self buildUIElements];    

    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark -- UI
-(void)buildUIElements{
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.showsCancelButton = NO;
    _searchBar.tintColor = UIColor.orangeColor;
    _searchBar.placeholder =@"请输入感兴趣的音乐";
    _searchBar.delegate = self;
    
    [self.view addSubview:_searchBar];
    [self.view addSubview:self.tableView];
    
    [_searchBar makeConstraints:^(MASConstraintMaker *make) {
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

- (MBSearchTableViewController *)historyViewController
{
    if (_historyViewController == nil)
    {
        _historyViewController = [[MBSearchTableViewController alloc] init];
//        _historyViewController.historyRecords = _historyArray;
    }
    return _historyViewController;
}
//popover 设置
- (DXPopover *)popover
{
    if (_popover == nil)
    {
        _popover = [DXPopover popover];
        _popover.cornerRadius = 0.0;
        _popover.arrowSize = CGSizeZero;
        _popover.animationSpring = NO;
        _popover.maskType = DXPopoverMaskTypeNone;
        _popover.animationOut = 0.15;
        _popover.animationIn = 0.15;
        _popover.applyShadow = NO;
//        _popover.isNeedtransform = NO;
//        _popover.blackOverlayInset = UIEdgeInsetsMake(64,0,0,0);
        _popover.backgroundColor = [UIColor clearColor];
        
    }
    return _popover;
}

#pragma mark ---searchBar delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self hiddenTheHistoryRecords];
    [self.searchBar resignFirstResponder];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self hiddenTheHistoryRecords];
    [self.searchBar resignFirstResponder];
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // when we start to write sth, the record should display to us
    [self showTheHistoryRecords];
    [self.searchBar becomeFirstResponder];
}
#pragma  mark- history records

- (void)showTheHistoryRecords
{
    CGPoint startPoint = CGPointMake(CGRectGetWidth(self.view.frame), 104);
    [self.popover showAtPoint:startPoint
               popoverPostion:DXPopoverPositionDown
              withContentView:self.historyViewController.view
                       inView:self.view];
    self.popover.didDismissHandler = ^{
        
    };
}

- (void)hiddenTheHistoryRecords
{
    [self.popover dismiss];
}
@end
