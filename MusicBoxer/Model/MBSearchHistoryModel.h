//
//  MBSearchHistoryModel.h
//  MusicBoxer
//
//  Created by 梁中豪 on 2017/9/27.
//  Copyright © 2017年 梁中豪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBSearchHistoryModel : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end
