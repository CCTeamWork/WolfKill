//
//  SelectFriendView.h
//  WolfKill
//
//  Created by 清正 on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectDataClick)(NSMutableArray *selectData);
typedef void(^ViodBlock)(void);
@interface SelectFriendView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (copy, nonatomic) SelectDataClick dataBlock;
@property (copy, nonatomic) ViodBlock removeBlock;

/// 邀请的人
- (void)inviteButtonWithBlock:(SelectDataClick)newBlock;

/// 移除背景
- (void)removeButtonWithBlock:(ViodBlock)newBlock;

@end
