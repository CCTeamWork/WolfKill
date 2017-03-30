//
//  MSUPoliceView.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUPoliceView.h"
#import "MSUHeader.h"
#import "NSString+ChangeString.h"

@implementation MSUPoliceView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
        
    }
    return self;
}


//代码替你写好，到时候你自己看情况复制代码，改一下frame就可以了
- (void)createView{
//    //背景视图
//    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH-80, 200)];
//    [self addSubview:navView];
    
    //警徽标识
    CGFloat policeWid = 100;
    UIImageView *policIma = [[UIImageView alloc] init];
    policIma.contentMode =UIViewContentModeScaleAspectFit;
    policIma.image = [UIImage imageNamed:@"jinghui"];
    [self addSubview:policIma];
    [policIma makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.left.equalTo(self.left).offset(self.frame.size.width * 0.5 - policeWid * 0.5);
        make.width.equalTo(policeWid);
        make.height.equalTo(policeWid);
    }];

    //文字
    self.getPoliceLab = [[UILabel alloc] init];
    _getPoliceLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_getPoliceLab];
//    _getPoliceLab.text = [NSString stringWithFormat:@"恭喜%@获得警长",];
    [_getPoliceLab setAttributedText:[NSString changeLabelWithText:@"恭喜3号获得警长" FontFormatName:GAMEFONT FontSize:30 ReplaceOtherSize:22 RangeLocation:2 WithRangeLenth:2]];
    [_getPoliceLab makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(policIma.bottom).offset(5);
        make.left.equalTo(self.left).offset(0);
        make.width.equalTo(self.frame.size.width);
        make.height.equalTo(policeWid * 0.5);
    }];

    
}

@end
