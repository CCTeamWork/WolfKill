//
//  ButtonView.h
//  WolfKill
//
//  Created by 清正 on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonView : UIView

// 玩家名称/等级
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
// 查看详情
@property (weak, nonatomic) IBOutlet UIButton *chackButton;
// 添加朋友
@property (weak, nonatomic) IBOutlet UIButton *addButton;
// 踢出玩家
@property (weak, nonatomic) IBOutlet UIButton *kickButton;

@end
