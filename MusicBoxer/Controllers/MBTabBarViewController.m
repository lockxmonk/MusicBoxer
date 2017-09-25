//
//  MBTabBarViewController.m
//  MusicBoxer
//
//  Created by 梁中豪 on 2017/9/25.
//  Copyright © 2017年 梁中豪. All rights reserved.
//

#import "MBTabBarViewController.h"
#import "MBfirstViewController.h"
#import "MBsecondViewController.h"

@interface MBTabBarViewController ()

@end

@implementation MBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *vc1 = [[MBfirstViewController alloc] init];
    UIViewController *vc2 = [[MBsecondViewController alloc] init];
    UINavigationController *nv1 =[[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *nv2 =[[UINavigationController alloc] initWithRootViewController:vc2];
//    nv1.navigationItem.title = @"Music";
//    nv2.navigationItem.title = @"Setting";
    nv1.tabBarItem.title=@"音 乐";
    vc1.title = @"音 乐";
    nv2.tabBarItem.title=@"设 置";
    vc2.title = @"设 置";
    //UITabBarController *tab = [[UITabBarController alloc] init];
    self.viewControllers = @[nv1,nv2];
    self.delegate = self;
}



//当点击某个标签时,tabBar触发该方法
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"%ld",tabBarController.selectedIndex);
}




@end
