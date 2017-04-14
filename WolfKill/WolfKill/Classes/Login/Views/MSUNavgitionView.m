//
//  MSUNavgitionView.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUNavgitionView.h"
#import "MSUHeader.h"

@implementation MSUNavgitionView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView];

    }
    return self;
}

- (void)createView{
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    navView.backgroundColor = BGCOLOR;
    [self addSubview:navView];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(10, statusHeight + 5, 30, 30);
    [_backBtn setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    [navView addSubview:_backBtn];
    
    self.renBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _renBtn.frame = CGRectMake(WIDTH-40, statusHeight + 5, 30, 35);
    [_renBtn setImage:[UIImage imageNamed:@"renwu"] forState:UIControlStateNormal];
    [navView addSubview:_renBtn];
//    [_renBtn addTarget:self action:@selector(astBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *roomlab = [[UILabel alloc] init];
    roomlab.text = @"简单21122房";
    roomlab.textColor = WHITECOLOR;
    roomlab.textAlignment = NSTextAlignmentCenter;
    [roomlab setFont:[UIFont fontWithName:GAMEFONT1 size:16]];
    [navView addSubview:roomlab];
    [roomlab makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navView.top).offset(statusHeight + 5);
        make.left.equalTo(navView.left).offset(WIDTH * 0.5-50);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    
    
    UIImageView *wolfIma = [[UIImageView alloc] init];
    wolfIma.image = [UIImage imageNamed:@"xiaolang"];
    [navView addSubview:wolfIma];
    [wolfIma makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navView.top).offset(statusHeight + 5);
        make.left.equalTo(roomlab.left).offset(-30);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    
    self.lockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_lockBtn setImage:[UIImage imageNamed:@"lock"] forState:UIControlStateNormal];
    [navView addSubview:_lockBtn];
    _lockBtn.adjustsImageWhenHighlighted = NO;
    [_lockBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navView.top).offset(statusHeight + 5);
        make.left.equalTo(roomlab.right).offset(0);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];

    
}


@end
