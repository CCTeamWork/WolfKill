//
//  PlayerInfoView.m
//  WolfKill
//
//  Created by 清正 on 2017/4/9.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "PlayerInfoView.h"

@implementation PlayerInfoView

- (void)awakeFromNib {
    [super awakeFromNib];
    _playerBtn.imageView.contentMode =UIViewContentModeScaleAspectFit;
    _playerBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 5, 0, 0);
}

- (IBAction)addFriendClick:(UIButton *)sender {
    if (_buttonClick) {
        _buttonClick(sender);
    }
}

- (IBAction)forwardButtonClick:(UIButton *)sender {
    if (_buttonClick) {
        _buttonClick(sender);
    }
}

- (IBAction)closeButtonClick:(UIButton *)sender {
    if (_buttonClick) {
        _buttonClick(sender);
    }
}

- (void)clickButtonCallbackFunction:(ClickBlock)newBlock {
    _buttonClick =newBlock;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
