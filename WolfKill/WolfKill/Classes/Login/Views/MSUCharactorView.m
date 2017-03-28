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
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64 - 44)];
    [self addSubview:bgView];
    bgView.backgroundColor = BLUECOLOR;
    
    for (int i = 0; i < 6; i++) {
        self.leftCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftCharactBtn.backgroundColor = CAOGREENCOLOR;
        _leftCharactBtn.tag = i + 10;
        [self addSubview:_leftCharactBtn];
        [_leftCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(20 + (characHeight + 10) * i);
            make.left.equalTo(bgView.left).offset(20);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];

    }
    
    for (int i = 0; i < 6; i++) {
        self.rightCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightCharactBtn.backgroundColor = CAOGREENCOLOR;
        _rightCharactBtn.tag = i + 20;
        [self addSubview:_rightCharactBtn];
        [_rightCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(20 + (characHeight + 10) * i);
            make.right.equalTo(bgView.right).offset(-20);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        
    }
    
    for (int i = 0; i < 3; i++) {
        self.bottomCharactBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomCharactBtn.backgroundColor = CAOGREENCOLOR;
        _bottomCharactBtn.tag = i + 30;
        [self addSubview:_bottomCharactBtn];
        [_bottomCharactBtn makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(bgView.bottom).offset(-10);
            make.left.equalTo(bgView.left).offset(20 + characWidth + bottomSpace + (bottomSpace + characWidth) * i);
            make.width.equalTo(characWidth);
            make.height.equalTo(characHeight);
        }];
        
    }
    

}

@end
