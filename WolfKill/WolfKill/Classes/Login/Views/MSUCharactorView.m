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
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [self addSubview:bgView];
    bgView.backgroundColor = BLUECOLOR;
    
    for (int i = 0; i < 15; i++) {
        UIImageView *charactIma = [[UIImageView alloc] init];
        charactIma.image = nil;
        [bgView addSubview:charactIma];
        charactIma.backgroundColor = CAOGREENCOLOR;
        [charactIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.top).offset(20 + (characHeight + 10) * i);
            make.left.equalTo(bgView.left).offset(WIDTH * 0.5);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }];
    }
}

@end
