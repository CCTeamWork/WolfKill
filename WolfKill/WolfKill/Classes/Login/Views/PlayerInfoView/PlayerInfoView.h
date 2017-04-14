//
//  PlayerInfoView.h
//  WolfKill
//
//  Created by 清正 on 2017/4/9.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^ClickBlock)(UIButton *button);
@interface PlayerInfoView : UIView

/// 头像
@property (weak, nonatomic) IBOutlet UIButton *headerImage;
/// 名称
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/// 版本号
@property (weak, nonatomic) IBOutlet UILabel *versionLabel;
/// 胜率
@property (weak, nonatomic) IBOutlet UILabel *winRateLabel;
///胜利
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
/// 失败
@property (weak, nonatomic) IBOutlet UILabel *loseLabel;
/// 添加好友
@property (weak, nonatomic) IBOutlet UIButton *addFriendBtn;
/// 踢出玩家
@property (weak, nonatomic) IBOutlet UIButton *forwardBtn;
/// 关闭
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
/// 人物形象
@property (weak, nonatomic) IBOutlet UIButton *playerBtn;

@property (copy, nonatomic) ClickBlock buttonClick;

/// 点击按钮回调
- (void)clickButtonCallbackFunction:(ClickBlock)newBlock;

@end
