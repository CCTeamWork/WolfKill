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
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    [self addSubview:bgView];
    
    UIImageView *bgImaView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    bgImaView.image = [UIImage imageNamed:@"bg"];
    [bgView addSubview:bgImaView];
    
    for (int i = 0; i < 6; i++) {
        self.leftCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftCharactBtn setImage:[UIImage imageNamed:@"moxing_2"] forState:UIControlStateNormal];
        _leftCharactBtn.tag = i + 10;
        [bgView addSubview:_leftCharactBtn];
        [_leftCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(20 + (characHeight + 10) * i);
            make.left.equalTo(bgView.left).offset(20);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        
        self.identiLeftIma = [[UIImageView alloc] init];
        _identiLeftIma.image = [UIImage imageNamed:@"huangsexingxing"];
        [bgView addSubview:_identiLeftIma];
        [_identiLeftIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_leftCharactBtn.bottom).offset(0);
            make.left.equalTo(_leftCharactBtn.right).offset(-15);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];


    }
    
    for (int i = 0; i < 6; i++) {
        self.rightCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightCharactBtn setImage:[UIImage imageNamed:@"moxing_1"] forState:UIControlStateNormal];
        _rightCharactBtn.tag = i + 20;
        [bgView addSubview:_rightCharactBtn];
        [_rightCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(20 + (characHeight + 10) * i);
            make.right.equalTo(bgView.right).offset(-20);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        
        self.identiRightIma = [[UIImageView alloc] init];
        _identiRightIma.image = [UIImage imageNamed:@"huangsexingxing"];
        [bgView addSubview:_identiRightIma];
        [_identiRightIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_rightCharactBtn.bottom).offset(0);
            make.right.equalTo(_rightCharactBtn.left).offset(15);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];
        
    }
    
    for (int i = 0; i < 3; i++) {
        self.bottomCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomCharactBtn setImage:[UIImage imageNamed:@"moxing_1"] forState:UIControlStateNormal];
        _bottomCharactBtn.tag = i + 30;
        [bgView addSubview:_bottomCharactBtn];
        [_bottomCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(bgView.bottom).offset(-(10 + 44));
            make.left.equalTo(bgView.left).offset(20 + characWidth + bottomSpace + (bottomSpace + characWidth) * i);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        
        self.identiBottomIma = [[UIImageView alloc] init];
        _identiBottomIma.image = [UIImage imageNamed:@"huangsexingxing"];
        [bgView addSubview:_identiBottomIma];
        [_identiBottomIma makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_bottomCharactBtn.bottom).offset(0);
            make.left.equalTo(_bottomCharactBtn.right).offset(-15);
            make.width.equalTo(25);
            make.height.equalTo(25);
        }];
    }
    
    self.wordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _wordBtn.backgroundColor = [UIColor yellowColor];
    [self addSubview:_wordBtn];
    [_wordBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView.bottom).offset(10);
        make.left.equalTo(bgView.left).offset(10);
        make.width.equalTo(50);
        make.height.equalTo(50);
    }];

    [_wordBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    

}

@end
