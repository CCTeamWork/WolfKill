//
//  MSURightCharactorView.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSURightCharactorView.h"
#import "MSUHeader.h"

@implementation MSURightCharactorView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
        
    }
    return self;
}


- (void)createView{
    //右侧人物按钮
    self.charactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_charactBtn setImage:[UIImage imageNamed:@"moxing_1"] forState:UIControlStateNormal];
    _charactBtn.adjustsImageWhenHighlighted = NO;
//    _charactBtn.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_charactBtn];
    [_charactBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.right.equalTo(self.right).offset(-identiWidth);
        make.width.equalTo(characWidth);
        make.height.equalTo(characHeight);
    }];
    
    //身份识别-右侧 图片
    self.identiIma = [[UIImageView alloc] init];
    self.identiIma.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_identiIma];
    _identiIma.image = [UIImage imageNamed:@"huangsexingxing"];
    [_identiIma makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_charactBtn.bottom).offset(0);
        make.right.equalTo(_charactBtn.left).offset(10);
        make.width.equalTo(identiWidth);
        make.height.equalTo(identiWidth);
    }];
    
    
    //房主图标
    self.roomOwnerIma = [[UIImageView alloc] init];
    self.roomOwnerIma.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_roomOwnerIma];
    _roomOwnerIma.image = [UIImage imageNamed:@"fangzhu"];
    [_roomOwnerIma makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_charactBtn.bottom).offset(0);
        make.left.equalTo(_charactBtn.right).offset(-10);
        make.width.equalTo(identiWidth);
        make.height.equalTo(identiWidth);
    }];
    
    
    //准备图标
    self.prepareIma = [[UIImageView alloc] init];
    self.prepareIma.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_prepareIma];
    _prepareIma.image = [UIImage imageNamed:@"zhunbei"];
    [_prepareIma makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_charactBtn.top).offset(35);
        make.right.equalTo(_charactBtn.right).offset(0);
        make.width.equalTo(characWidth);
        make.height.equalTo(identiWidth);
    }];
    
    //死亡标识
    self.deathIma = [[UIImageView alloc] init];
    self.deathIma.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_deathIma];
    _deathIma.image = [UIImage imageNamed:@"siwang"];
    [_deathIma makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_charactBtn.top).offset(35);
        make.right.equalTo(_charactBtn.right).offset(0);
        make.width.equalTo(characWidth);
        make.height.equalTo(identiWidth);
    }];
    

    
    //狼人身份标识
    self.wolfIma = [[UIImageView alloc] init];
    self.wolfIma.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_wolfIma];
    _wolfIma.image = [UIImage imageNamed:@"xiaolang"];
    [_wolfIma makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_charactBtn.top).offset(topSpace);
        make.right.equalTo(_charactBtn.right).offset(leftSpace);
        make.width.equalTo(leftSpace);
        make.height.equalTo(leftSpace);
    }];
    
    //情侣身份标识
    self.cupidIma = [[UIImageView alloc] init];
    self.cupidIma.contentMode =UIViewContentModeScaleAspectFit;
    [self insertSubview:_cupidIma belowSubview:_charactBtn];
    _cupidIma.image = [UIImage imageNamed:@"aixin"];
    [_cupidIma makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_roomOwnerIma.top).offset(0);
        make.left.equalTo(_charactBtn.right).offset(0);
        make.width.equalTo(15);
        make.height.equalTo(15);
    }];
    
    //手掌标识
    self.handsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_handsBtn setBackgroundImage:[UIImage imageNamed:@"shou"] forState:UIControlStateNormal];
    [_handsBtn setTitle:@"2" forState:UIControlStateNormal];
    [_handsBtn setTitleColor:REDCOLOR forState:UIControlStateNormal];
    _handsBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [_handsBtn setTitleEdgeInsets:UIEdgeInsetsMake(5, 2, 0, 0)];
    _handsBtn.adjustsImageWhenHighlighted = NO;
    _handsBtn.userInteractionEnabled = NO;
    [self addSubview:_handsBtn];
    [_handsBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_charactBtn.top).offset(5);
        make.left.equalTo(_charactBtn.left).offset(-20);
        make.width.equalTo(rightSpace);
        make.height.equalTo(rightSpace);
    }];
    
    //语音标识
    self.audioIma = [[UIImageView alloc] init];
    self.audioIma.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_audioIma];
    _audioIma.image = [UIImage imageNamed:@"yuyin"];
    [_audioIma makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_identiIma.top).offset(0);
        make.right.equalTo(_charactBtn.left).offset(0);
        make.width.equalTo(15);
        make.height.equalTo(25);
    }];
    
    //倒计时标识
    self.timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_timeBtn setBackgroundImage:[UIImage imageNamed:@"qipao_right"] forState:UIControlStateNormal];
    [_timeBtn setTitle:@"45S" forState:UIControlStateNormal];
    [_timeBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    _timeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _timeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_timeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 3)];
    _timeBtn.adjustsImageWhenHighlighted = NO;
    _timeBtn.userInteractionEnabled = NO;
    [self addSubview:_timeBtn];
    [_timeBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_audioIma.top).offset(0);
        make.right.equalTo(_audioIma.left).offset(0);
        make.width.equalTo(30);
        make.height.equalTo(20);
    }];
    
    //警察身份图标
    self.policeIma = [[UIImageView alloc] init];
    self.policeIma.contentMode =UIViewContentModeScaleAspectFit;
    [self addSubview:_policeIma];
    _policeIma.image = [UIImage imageNamed:@"jinghui"];
    [_policeIma makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_audioIma.top).offset(0);
        make.right.equalTo(_charactBtn.left).offset(0);
        make.width.equalTo(identiWidth);
        make.height.equalTo(characWidth);
    }];

}

@end
