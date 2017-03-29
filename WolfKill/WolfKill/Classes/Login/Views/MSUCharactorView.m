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


- (void)createView{
    //背景视图
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    [self addSubview:bgView];
    
    //背景图片
    UIImageView *bgImaView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    bgImaView.image = [UIImage imageNamed:@"bg"];
    [bgView addSubview:bgImaView];
    
    for (int i = 0; i < 6; i++) {
        //左侧人物按钮
        self.leftCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftCharactBtn setImage:[UIImage imageNamed:@"moxing_2"] forState:UIControlStateNormal];
        _leftCharactBtn.tag = i + 10;
        _leftCharactBtn.adjustsImageWhenHighlighted = NO;
        [bgView addSubview:_leftCharactBtn];
        [_leftCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(leftSpace + (characHeight + 10) * i);
            make.left.equalTo(bgView.left).offset(20);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        
        //人物识别-左侧 图片
        self.identiLeftIma = [[UIImageView alloc] init];
        _identiLeftIma.tag = i + 10;
        [bgView addSubview:_identiLeftIma];
        _identiLeftIma.image = [UIImage imageNamed:@"huangsexingxing"];
        [_identiLeftIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_leftCharactBtn.bottom).offset(0);
            make.left.equalTo(_leftCharactBtn.right).offset(-15);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];
        
        //房主图标
        self.roomOwnerIma = [[UIImageView alloc] init];
        _roomOwnerIma.tag = i + 10;
        [bgView addSubview:_roomOwnerIma];
        _roomOwnerIma.image = [UIImage imageNamed:@"fangzhu"];
        [_roomOwnerIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_identiLeftIma.bottom).offset(0);
            make.right.equalTo(_leftCharactBtn.left).offset(10);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];
        
        //准备图标
        self.prepareIma = [[UIImageView alloc] init];
        _prepareIma.tag = i + 10;
        [bgView addSubview:_prepareIma];
        _prepareIma.image = [UIImage imageNamed:@"zhunbei"];
        [_prepareIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_leftCharactBtn.top).offset(35);
            make.centerX.equalTo(_leftCharactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];

    }
    
    for (int i = 0; i < 6; i++) {
        //右侧人物按钮
        self.rightCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightCharactBtn setImage:[UIImage imageNamed:@"moxing_1"] forState:UIControlStateNormal];
        _rightCharactBtn.adjustsImageWhenHighlighted = NO;
        _rightCharactBtn.tag = i + 20;
        [bgView addSubview:_rightCharactBtn];
        [_rightCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(leftSpace + (characHeight + 10) * i);
            make.right.equalTo(bgView.right).offset(-20);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        
        //身份识别-右侧 图片
        self.identiRightIma = [[UIImageView alloc] init];
        [bgView addSubview:_identiRightIma];
        _identiRightIma.image = [UIImage imageNamed:@"huangsexingxing"];
        _identiRightIma.tag = i + 20;
        [_identiRightIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_rightCharactBtn.bottom).offset(0);
            make.right.equalTo(_rightCharactBtn.left).offset(15);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];
        
        //房主图标
        self.roomOwnerIma = [[UIImageView alloc] init];
        _roomOwnerIma.tag = i + 20;
        [bgView addSubview:_roomOwnerIma];
        _roomOwnerIma.image = [UIImage imageNamed:@"fangzhu"];
        [_roomOwnerIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_rightCharactBtn.bottom).offset(0);
            make.left.equalTo(_rightCharactBtn.right).offset(-10);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];
        
        //准备图标
        self.prepareIma = [[UIImageView alloc] init];
        _prepareIma.tag = i + 20;
        [bgView addSubview:_prepareIma];
        _prepareIma.image = [UIImage imageNamed:@"zhunbei"];
        [_prepareIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_rightCharactBtn.top).offset(35);
            make.centerX.equalTo(_rightCharactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];
        
    }
    
    for (int i = 0; i < 3; i++) {
        //底部人物按钮
        self.bottomCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomCharactBtn setImage:[UIImage imageNamed:@"moxing_1"] forState:UIControlStateNormal];
        _bottomCharactBtn.tag = i + 30;
        _bottomCharactBtn.adjustsImageWhenHighlighted = NO;
        [bgView addSubview:_bottomCharactBtn];
        [_bottomCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(bgView.bottom).offset(-(10 + 44));
            make.left.equalTo(bgView.left).offset(leftSpace + characWidth + bottomSpace + (bottomSpace + characWidth) * i);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        
        //身份识别-底部 图片
        self.identiBottomIma = [[UIImageView alloc] init];
        [bgView addSubview:_identiBottomIma];
        _identiBottomIma.tag = i + 30;
        _identiBottomIma.image = [UIImage imageNamed:@"huangsexingxing"];
        [_identiBottomIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_bottomCharactBtn.bottom).offset(0);
            make.left.equalTo(_bottomCharactBtn.right).offset(-15);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];
        
        //房主图标
        self.roomOwnerIma = [[UIImageView alloc] init];
        _roomOwnerIma.tag = i + 30;
        [bgView addSubview:_roomOwnerIma];
        _roomOwnerIma.image = [UIImage imageNamed:@"fangzhu"];
        [_roomOwnerIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_identiLeftIma.bottom).offset(0);
            make.right.equalTo(_bottomCharactBtn.left).offset(10);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];
        
        //准备图标
        self.prepareIma = [[UIImageView alloc] init];
        _prepareIma.tag = i + 20;
        [bgView addSubview:_prepareIma];
        _prepareIma.image = [UIImage imageNamed:@"zhunbei"];
        [_prepareIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_bottomCharactBtn.top).offset(35);
            make.centerX.equalTo(_bottomCharactBtn.centerX);
            make.width.equalTo(35);
            make.height.equalTo(leftSpace);
        }];

    }

    //键盘按钮
    self.wordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView addSubview:_wordBtn];
    _wordBtn.adjustsImageWhenHighlighted = NO;
    [_wordBtn setImage:[UIImage imageNamed:@"liwu_button"] forState:UIControlStateNormal];
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
