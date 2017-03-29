//
//  MainCenterView.h
//  WolfKill
//
//  Created by 清正 on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainCenterView : UIView <UITableViewDelegate, UITableViewDataSource>

// 顶部黑框里的文字
@property(nonatomic, copy)NSString *topText;

// 中部的阴影文字
@property(nonatomic, copy)NSString *centerText;

// 准备按钮
@property (weak, nonatomic) IBOutlet UIButton *prepareButton;

// 多条消息信息
@property (strong, nonatomic) NSMutableArray<NSString*> *messArray;
// 一条消息信息
@property (copy, nonatomic) NSString *message;
// 消息表
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


/**
 *  文字黑边label
 */
@interface MyLabel : UILabel

@end
