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
        
        [UIView animateWithDuration:1 animations:^{
            [self createView];
        }];
    }
    return self;
}

- (void)createView{
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    navView.backgroundColor =  REDCOLOR;
    [self addSubview:navView];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(10, 5, 30, 30);
    _backBtn.backgroundColor = [UIColor blueColor];
    [_backBtn setImage:nil forState:UIControlStateNormal];
    _backBtn.backgroundColor = YELLOWCOLOR;
    [navView addSubview:_backBtn];
    
    self.renBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _renBtn.frame = CGRectMake(WIDTH-40, 5, 30, 40);
    _renBtn.backgroundColor = [UIColor blueColor];
    [_renBtn setImage:nil forState:UIControlStateNormal];
    _renBtn.backgroundColor = YELLOWCOLOR;
    [navView addSubview:_renBtn];
    
    UILabel *roomlab = [[UILabel alloc] init];
    roomlab.text = @"简单21122房";
    roomlab.textColor = WHITECOLOR;
    [navView addSubview:roomlab];
    [roomlab makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navView.top).offset(5);
        make.left.equalTo(navView.left).offset(WIDTH * 0.5-50);
        make.width.equalTo(100);
        make.height.equalTo(30);
    }];
    
    
    UIImageView *wolfIma = [[UIImageView alloc] init];
    wolfIma.image = nil;
    [navView addSubview:wolfIma];
    [wolfIma makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navView.top).offset(5);
        make.left.equalTo(roomlab.left).offset(-30);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
    
    UIImageView *lockIma = [[UIImageView alloc] init];
    lockIma.image = nil;
    [navView addSubview:lockIma];
    [lockIma makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(navView.top).offset(5);
        make.left.equalTo(roomlab.right).offset(0);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];

    
}

@end
