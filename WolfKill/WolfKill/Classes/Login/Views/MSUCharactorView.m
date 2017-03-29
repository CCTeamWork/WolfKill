//
//  MSUCharactorView.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUCharactorView.h"
#import "MSUHeader.h"

@implementation MSUCharactorView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
        
    }
    return self;
}

/*====================================初始化==================================================*/
- (NSMutableArray *)policeArr{
    if (!_policeArr) {
        _policeArr = [NSMutableArray array];
    }
    return _policeArr;
}

- (NSMutableArray *)prepareArr{
    if (!_prepareArr) {
        _prepareArr = [NSMutableArray array];
    }
    return _prepareArr;
}

- (NSMutableArray *)roomOwnerArr{
    if (!_roomOwnerArr) {
        _roomOwnerArr = [NSMutableArray array];
    }
    return _roomOwnerArr;
}

- (NSMutableArray *)identiArr{
    if (!_identiArr) {
        _identiArr = [NSMutableArray array];
    }
    return _identiArr;
}

- (NSMutableArray *)charactArr{
    if (!_charactArr) {
        _charactArr = [NSMutableArray array];
    }
    return _charactArr;
}

- (NSMutableArray *)deathArr{
    if (!_deathArr) {
        _deathArr = [NSMutableArray array];
    }
    return _deathArr;
}

- (NSMutableArray *)wolfArr{
    if (!_wolfArr) {
        _wolfArr = [NSMutableArray array];
    }
    return _wolfArr;
}

- (NSMutableArray *)cupidArr{
    if (!_cupidArr) {
        _cupidArr = [NSMutableArray array];
    }
    return _cupidArr;
}

- (NSMutableArray *)handsArr{
    if (!_handsArr) {
        _handsArr = [NSMutableArray array];
    }
    return _handsArr;
}

- (NSMutableArray *)audioArr{
    if (!_audioArr) {
        _audioArr = [NSMutableArray array];
    }
    return _audioArr;
}

- (NSMutableArray *)timeArr{
    if (!_timeArr) {
        _timeArr = [NSMutableArray array];
    }
    return _timeArr;
}

- (void)createView{
    //背景视图
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    [self addSubview:bgView];
    
    //背景图片
    UIImageView *bgImaView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    bgImaView.image = [UIImage imageNamed:@"bg"];
    [bgView addSubview:bgImaView];
    
/*====================================左侧==================================================*/
    for (int i = 0; i < 6; i++) {
        //左侧人物按钮
        self.charactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_charactBtn setImage:[UIImage imageNamed:@"moxing_2"] forState:UIControlStateNormal];
        _charactBtn.tag = i + 10;
        _charactBtn.backgroundColor = [UIColor clearColor];
        _charactBtn.adjustsImageWhenHighlighted = NO;
        [bgView addSubview:_charactBtn];
        [_charactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(leftSpace + (characHeight + 10) * i);
            make.left.equalTo(bgView.left).offset(20);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        [self.charactArr addObject:_charactBtn];
        
        //人物识别-左侧 图片
        self.identiLeftIma = [[UIImageView alloc] init];
        _identiLeftIma.tag = i + 10;
        [bgView addSubview:_identiLeftIma];
        _identiLeftIma.image = [UIImage imageNamed:@"huangsexingxing"];
        [_identiLeftIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_charactBtn.bottom).offset(0);
            make.left.equalTo(_charactBtn.right).offset(-10);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        [self.identiArr addObject:_identiLeftIma];
        
        //房主图标
        self.roomOwnerIma = [[UIImageView alloc] init];
        _roomOwnerIma.tag = i + 10;
        [bgView addSubview:_roomOwnerIma];
        _roomOwnerIma.image = [UIImage imageNamed:@"fangzhu"];
        [_roomOwnerIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_identiLeftIma.bottom).offset(0);
            make.right.equalTo(_charactBtn.left).offset(10);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        [self.roomOwnerArr addObject:_roomOwnerIma];
        
        //准备图标
        self.prepareIma = [[UIImageView alloc] init];
        _prepareIma.tag = i + 10;
        [bgView addSubview:_prepareIma];
        _prepareIma.image = [UIImage imageNamed:@"zhunbei"];
        [_prepareIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(35);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];
        [self.prepareArr addObject:_prepareIma];
        
        //死亡标识
        self.deathIma = [[UIImageView alloc] init];
        _deathIma.tag = i + 10;
        [bgView addSubview:_deathIma];
        _deathIma.image = [UIImage imageNamed:@"siwang"];
        [_deathIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(35);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];
        [self.deathArr addObject:_deathIma];
        
        //警察身份图标
        self.policeIma = [[UIImageView alloc] init];
        _policeIma.tag = i + 10;
        [bgView addSubview:_policeIma];
        _policeIma.image = [UIImage imageNamed:@"tubiao"];
        [_policeIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(0);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(characWidth);
            make.height.equalTo(leftSpace);
        }];
        [self.policeArr addObject:_policeIma];
        
        //狼人身份标识
        self.wolfIma = [[UIImageView alloc] init];
        _wolfIma.tag = i + 10;
        [bgView addSubview:_wolfIma];
        _wolfIma.image = [UIImage imageNamed:@"xiaolang"];
        [_wolfIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(20);
            make.centerX.equalTo(_charactBtn.centerX).offset(-25);
            make.width.equalTo(leftSpace);
            make.height.equalTo(leftSpace);
        }];
        [self.wolfArr addObject:_wolfIma];

        //丘比特身份标识
        self.cupidIma = [[UIImageView alloc] init];
        _cupidIma.tag = i + 10;
        [bgView insertSubview:_cupidIma belowSubview:_charactBtn];
        _cupidIma.image = [UIImage imageNamed:@"jian"];
        [_cupidIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_charactBtn.bottom).offset(0);
            make.centerX.equalTo(_charactBtn.centerX).offset(0);
            make.width.equalTo(characWidth + 15);
            make.height.equalTo(characHeight - 25);
        }];
        [self.cupidArr addObject:_cupidIma];
        
        //手掌标识
        self.handsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_handsBtn setBackgroundImage:[UIImage imageNamed:@"shou"] forState:UIControlStateNormal];
        [_handsBtn setTitle:@"2" forState:UIControlStateNormal];
        [_handsBtn setTitleColor:REDCOLOR forState:UIControlStateNormal];
        _handsBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_handsBtn setTitleEdgeInsets:UIEdgeInsetsMake(5, 2, 0, 0)];
        _handsBtn.tag = i + 10;
        _handsBtn.adjustsImageWhenHighlighted = NO;
        _handsBtn.userInteractionEnabled = NO;
        [bgView addSubview:_handsBtn];
        [_handsBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(5);
            make.right.equalTo(_charactBtn.right).offset(20);
            make.width.equalTo(rightSpace);
            make.height.equalTo(rightSpace);
        }];
        [self.handsArr addObject:_handsBtn];

        //语音标识
        self.audioIma = [[UIImageView alloc] init];
        _audioIma.tag = i + 10;
        [bgView addSubview:_audioIma];
        _audioIma.image = [UIImage imageNamed:@"yuyin"];
        [_audioIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(10);
            make.left.equalTo(_charactBtn.right).offset(0);
            make.width.equalTo(20);
            make.height.equalTo(30);
        }];
        [self.audioArr addObject:_audioIma];
        
        //倒计时标识
        self.timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeBtn setBackgroundImage:[UIImage imageNamed:@"qipao_left"] forState:UIControlStateNormal];
        [_timeBtn setTitle:@"45S" forState:UIControlStateNormal];
        [_timeBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        _timeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _timeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_timeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
        _timeBtn.tag = i + 10;
        _timeBtn.adjustsImageWhenHighlighted = NO;
        _timeBtn.userInteractionEnabled = NO;
        [bgView addSubview:_timeBtn];
        [_timeBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_audioIma.top).offset(0);
            make.left.equalTo(_audioIma.right).offset(0);
            make.width.equalTo(30);
            make.height.equalTo(20);
        }];
        [self.timeArr addObject:_timeBtn];
    }
    
    
/*====================================右侧==================================================*/
    for (int i = 0; i < 6; i++) {
        //右侧人物按钮
        self.charactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_charactBtn setImage:[UIImage imageNamed:@"moxing_1"] forState:UIControlStateNormal];
        _charactBtn.adjustsImageWhenHighlighted = NO;
        _charactBtn.tag = i + 16;
        [bgView addSubview:_charactBtn];
        [_charactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(leftSpace + (characHeight + 10) * i);
            make.right.equalTo(bgView.right).offset(-20);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        [self.charactArr addObject:_charactBtn];

        //身份识别-右侧 图片
        self.identiRightIma = [[UIImageView alloc] init];
        [bgView addSubview:_identiRightIma];
        _identiRightIma.image = [UIImage imageNamed:@"huangsexingxing"];
        _identiRightIma.tag = i + 16;
        [_identiRightIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_charactBtn.bottom).offset(0);
            make.right.equalTo(_charactBtn.left).offset(10);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        [self.identiArr addObject:_identiRightIma];

        
        //房主图标
        self.roomOwnerIma = [[UIImageView alloc] init];
        _roomOwnerIma.tag = i + 16;
        [bgView addSubview:_roomOwnerIma];
        _roomOwnerIma.image = [UIImage imageNamed:@"fangzhu"];
        [_roomOwnerIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_charactBtn.bottom).offset(0);
            make.left.equalTo(_charactBtn.right).offset(-10);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        [self.roomOwnerArr addObject:_roomOwnerIma];

        
        //准备图标
        self.prepareIma = [[UIImageView alloc] init];
        _prepareIma.tag = i + 16;
        [bgView addSubview:_prepareIma];
        _prepareIma.image = [UIImage imageNamed:@"zhunbei"];
        [_prepareIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(35);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];
        [self.prepareArr addObject:_prepareIma];

        //死亡标识
        self.deathIma = [[UIImageView alloc] init];
        _deathIma.tag = i + 10;
        [bgView addSubview:_deathIma];
        _deathIma.image = [UIImage imageNamed:@"siwang"];
        [_deathIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(35);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];
        [self.deathArr addObject:_deathIma];
        
        //警察身份图标
        self.policeIma = [[UIImageView alloc] init];
        _policeIma.tag = i + 16;
        [bgView addSubview:_policeIma];
        _policeIma.image = [UIImage imageNamed:@"tubiao"];
        [_policeIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(0);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(characWidth);
            make.height.equalTo(leftSpace);
        }];
        [self.policeArr addObject:_policeIma];

        //狼人身份标识
        self.wolfIma = [[UIImageView alloc] init];
        _wolfIma.tag = i + 10;
        [bgView addSubview:_wolfIma];
        _wolfIma.image = [UIImage imageNamed:@"xiaolang"];
        [_wolfIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(20);
            make.centerX.equalTo(_charactBtn.centerX).offset(-25);
            make.width.equalTo(leftSpace);
            make.height.equalTo(leftSpace);
        }];
        [self.wolfArr addObject:_wolfIma];
        
        //丘比特身份标识
        self.cupidIma = [[UIImageView alloc] init];
        _cupidIma.tag = i + 10;
        [bgView insertSubview:_cupidIma belowSubview:_charactBtn];
        _cupidIma.image = [UIImage imageNamed:@"jian"];
        [_cupidIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_charactBtn.bottom).offset(0);
            make.centerX.equalTo(_charactBtn.centerX).offset(0);
            make.width.equalTo(characWidth + 15);
            make.height.equalTo(characHeight - 25);
        }];
        [self.cupidArr addObject:_cupidIma];
        
        //手掌标识
        self.handsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_handsBtn setBackgroundImage:[UIImage imageNamed:@"shou"] forState:UIControlStateNormal];
        [_handsBtn setTitle:@"2" forState:UIControlStateNormal];
        [_handsBtn setTitleColor:REDCOLOR forState:UIControlStateNormal];
        _handsBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_handsBtn setTitleEdgeInsets:UIEdgeInsetsMake(5, 2, 0, 0)];
        _handsBtn.tag = i + 10;
        _handsBtn.adjustsImageWhenHighlighted = NO;
        _handsBtn.userInteractionEnabled = NO;
        [bgView addSubview:_handsBtn];
        [_handsBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(5);
            make.left.equalTo(_charactBtn.left).offset(-20);
            make.width.equalTo(rightSpace);
            make.height.equalTo(rightSpace);
        }];
        [self.handsArr addObject:_handsBtn];
        
        //语音标识
        self.audioIma = [[UIImageView alloc] init];
        _audioIma.tag = i + 10;
        [bgView addSubview:_audioIma];
        _audioIma.image = [UIImage imageNamed:@"yuyin"];
        [_audioIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(10);
            make.right.equalTo(_charactBtn.left).offset(0);
            make.width.equalTo(20);
            make.height.equalTo(30);
        }];
        [self.audioArr addObject:_audioIma];
        
        //倒计时标识
        self.timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeBtn setBackgroundImage:[UIImage imageNamed:@"qipao_right"] forState:UIControlStateNormal];
        [_timeBtn setTitle:@"45S" forState:UIControlStateNormal];
        [_timeBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        _timeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _timeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_timeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 3)];
        _timeBtn.tag = i + 10;
        _timeBtn.adjustsImageWhenHighlighted = NO;
        _timeBtn.userInteractionEnabled = NO;
        [bgView addSubview:_timeBtn];
        [_timeBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_audioIma.top).offset(0);
            make.right.equalTo(_audioIma.left).offset(0);
            make.width.equalTo(30);
            make.height.equalTo(20);
        }];
        [self.timeArr addObject:_timeBtn];


    }
    
/*====================================底部==================================================*/
    for (int i = 0; i < 3; i++) {
        //底部人物按钮
        self.charactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_charactBtn setImage:[UIImage imageNamed:@"moxing_1"] forState:UIControlStateNormal];
        _charactBtn.tag = i + 22;
        _charactBtn.adjustsImageWhenHighlighted = NO;
        [bgView addSubview:_charactBtn];
        [_charactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(bgView.bottom).offset(-(10 + 44));
            make.left.equalTo(bgView.left).offset(leftSpace + characWidth + bottomSpace + (bottomSpace + characWidth) * i);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        [self.charactArr addObject:_charactBtn];

        
        //身份识别-底部 图片
        self.identiBottomIma = [[UIImageView alloc] init];
        [bgView addSubview:_identiBottomIma];
        _identiBottomIma.tag = i + 22;
        _identiBottomIma.image = [UIImage imageNamed:@"huangsexingxing"];
        [_identiBottomIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_charactBtn.bottom).offset(0);
            make.left.equalTo(_charactBtn.right).offset(-10);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        [self.identiArr addObject:_identiBottomIma];

        
        //房主图标
        self.roomOwnerIma = [[UIImageView alloc] init];
        _roomOwnerIma.tag = i + 22;
        [bgView addSubview:_roomOwnerIma];
        _roomOwnerIma.image = [UIImage imageNamed:@"fangzhu"];
        [_roomOwnerIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_charactBtn.bottom).offset(0);
            make.right.equalTo(_charactBtn.left).offset(10);
            make.width.equalTo(20);
            make.height.equalTo(20);
        }];
        [self.roomOwnerArr addObject:_roomOwnerIma];

        
        //准备图标
        self.prepareIma = [[UIImageView alloc] init];
        _prepareIma.tag = i + 20;
        [bgView addSubview:_prepareIma];
        _prepareIma.image = [UIImage imageNamed:@"zhunbei"];
        [_prepareIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(35);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];
        [self.prepareArr addObject:_prepareIma];

        //死亡标识
        self.deathIma = [[UIImageView alloc] init];
        _deathIma.tag = i + 10;
        [bgView addSubview:_deathIma];
        _deathIma.image = [UIImage imageNamed:@"siwang"];
        [_deathIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(35);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];
        [self.deathArr addObject:_deathIma];
        
        //警察身份图标
        self.policeIma = [[UIImageView alloc] init];
        _policeIma.tag = i + 20;
        [bgView addSubview:_policeIma];
        _policeIma.image = [UIImage imageNamed:@"tubiao"];
        [_policeIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(0);
            make.centerX.equalTo(_charactBtn.centerX);
            make.width.equalTo(characWidth);
            make.height.equalTo(leftSpace);
        }];
        [self.policeArr addObject:_policeIma];
        
        //狼人身份标识
        self.wolfIma = [[UIImageView alloc] init];
        _wolfIma.tag = i + 10;
        [bgView addSubview:_wolfIma];
        _wolfIma.image = [UIImage imageNamed:@"xiaolang"];
        [_wolfIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(20);
            make.centerX.equalTo(_charactBtn.centerX).offset(-25);
            make.width.equalTo(leftSpace);
            make.height.equalTo(leftSpace);
        }];
        [self.wolfArr addObject:_wolfIma];
        
        //丘比特身份标识
        self.cupidIma = [[UIImageView alloc] init];
        _cupidIma.tag = i + 10;
        [bgView insertSubview:_cupidIma belowSubview:_charactBtn];
        _cupidIma.image = [UIImage imageNamed:@"jian"];
        [_cupidIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_charactBtn.bottom).offset(0);
            make.centerX.equalTo(_charactBtn.centerX).offset(0);
            make.width.equalTo(characWidth + 15);
            make.height.equalTo(characHeight - 25);
        }];
        [self.cupidArr addObject:_cupidIma];

        //手掌标识
        self.handsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_handsBtn setBackgroundImage:[UIImage imageNamed:@"shou"] forState:UIControlStateNormal];
        [_handsBtn setTitle:@"2" forState:UIControlStateNormal];
        [_handsBtn setTitleColor:REDCOLOR forState:UIControlStateNormal];
        _handsBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_handsBtn setTitleEdgeInsets:UIEdgeInsetsMake(5, 2, 0, 0)];
        _handsBtn.tag = i + 10;
        _handsBtn.adjustsImageWhenHighlighted = NO;
        _handsBtn.userInteractionEnabled = NO;
        [bgView addSubview:_handsBtn];
        [_handsBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(5);
            make.right.equalTo(_charactBtn.right).offset(15);
            make.width.equalTo(rightSpace);
            make.height.equalTo(rightSpace);
        }];
        [self.handsArr addObject:_handsBtn];
        
        //语音标识
        self.audioIma = [[UIImageView alloc] init];
        _audioIma.tag = i + 10;
        [bgView addSubview:_audioIma];
        _audioIma.image = [UIImage imageNamed:@"yuyin"];
        [_audioIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_charactBtn.top).offset(10);
            make.left.equalTo(_charactBtn.right).offset(0);
            make.width.equalTo(20);
            make.height.equalTo(30);
        }];
        [self.audioArr addObject:_audioIma];
        
        //倒计时标识
        self.timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeBtn setBackgroundImage:[UIImage imageNamed:@"qipao_right"] forState:UIControlStateNormal];
        [_timeBtn setTitle:@"45S" forState:UIControlStateNormal];
        [_timeBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        _timeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _timeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_timeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 3)];
        _timeBtn.tag = i + 10;
        _timeBtn.adjustsImageWhenHighlighted = NO;
        _timeBtn.userInteractionEnabled = NO;
        [bgView addSubview:_timeBtn];
        [_timeBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_audioIma.top).offset(0);
            make.right.equalTo(_charactBtn.left).offset(0);
            make.width.equalTo(30);
            make.height.equalTo(20);
        }];
        [self.timeArr addObject:_timeBtn];
    }
    

/*====================================遍历取帽==================================================*/

    for (NSInteger index = 0; index < _policeArr.count; index++) {
        UIImageView *ima = _policeArr[index];
        ima.hidden = YES;
    }
    
    for (NSInteger index = 0; index < _roomOwnerArr.count; index++) {
        UIImageView *ima = _roomOwnerArr[index];
        ima.hidden = YES;
    }
    
    for (NSInteger index = 0; index < _prepareArr.count; index++) {
        UIImageView *ima = _prepareArr[index];
        ima.hidden = YES;
    }

    for (NSInteger index = 0; index < _wolfArr.count; index++) {
        UIImageView *ima = _wolfArr[index];
        ima.hidden = YES;
    }
    
    for (NSInteger index = 0; index < _deathArr.count; index++) {
        UIImageView *ima = _deathArr[index];
        ima.hidden = YES;
    }

    for (NSInteger index = 0; index < _cupidArr.count; index++) {
        UIImageView *ima = _cupidArr[index];
        ima.hidden = YES;
    }

    for (NSInteger index = 0; index < _handsArr.count; index++) {
        UIImageView *ima = _handsArr[index];
        ima.hidden = YES;
    }
    
//    for (NSInteger index = 0; index < _audioArr.count; index++) {
//        UIImageView *ima = _audioArr[index];
//        ima.hidden = YES;
//    }
    
    for (NSInteger index = 0; index < _identiArr.count; index++) {
    }
    
    for (NSInteger index = 0; index < _charactArr.count; index++) {
    }
    
/*====================================最下面三个按钮==================================================*/
    //键盘按钮
    self.wordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView addSubview:_wordBtn];
    _wordBtn.adjustsImageWhenHighlighted = NO;
    [_wordBtn setImage:[UIImage imageNamed:@"jianpan"] forState:UIControlStateNormal];
    [_wordBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView.bottom).offset(-10);
        make.left.equalTo(bgView.left).offset(leftSpace);
        make.width.equalTo(35);
        make.height.equalTo(35);
    }];

    //跳过按钮（结束语音）
    self.passBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView addSubview:_passBtn];
    _passBtn.adjustsImageWhenHighlighted = NO;
    [_passBtn setImage:[UIImage imageNamed:@"jieshuyuyin"] forState:UIControlStateNormal];
    [_passBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView.bottom).offset(-10);
        make.left.equalTo(bgView.left).offset(WIDTH * 0.5 - 60);
        make.width.equalTo(120);
        make.height.equalTo(35);
    }];
    
    //语音按钮
    self.videoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_videoBtn setImage:[UIImage imageNamed:@"anzhushuohuaquan"] forState:UIControlStateNormal];
    [bgView addSubview:_videoBtn];
    _videoBtn.adjustsImageWhenHighlighted = NO;
    [_videoBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView.bottom).offset(-10);
        make.right.equalTo(bgView.right).offset(-leftSpace);
        make.width.equalTo(35);
        make.height.equalTo(35);
    }];
    
    
//    self.giftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    _giftBtn.backgroundColor = [UIColor yellowColor];
//    [_giftBtn setImage:[UIImage imageNamed:@"liwu_button"] forState:UIControlStateNormal];
//    [bgView addSubview:_giftBtn];
//    [_giftBtn makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(bgView.bottom).offset(-10);
//        make.right.equalTo(bgView.right).offset(-leftSpace);
//        make.width.equalTo(35);
//        make.height.equalTo(35);
//    }];

}



@end
