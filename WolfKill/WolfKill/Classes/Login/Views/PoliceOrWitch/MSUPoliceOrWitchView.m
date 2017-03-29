//
//  PoliceOrWitchView.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUPoliceOrWitchView.h"
#import "MSUWitchView.h"
#import "MSUPoliceView.h"
#import "MSUHeader.h"

@implementation MSUPoliceOrWitchView

- (instancetype)initWithFrame:(CGRect)frame isPolice:(BOOL)isPolice
{
    if (self = [super initWithFrame:frame]) {
        _IsPoliceOrWitch =isPolice;
        [self createView];
        
    }
    return self;
}


- (void)createView{
    if (!self.IsPoliceOrWitch) {
        MSUPoliceView *poliView = [[MSUPoliceView alloc] initWithFrame:CGRectMake(0, 0, WIDTH-80, 150)];
        [self addSubview:poliView];
    }else{
        MSUWitchView *witch = [[MSUWitchView alloc] initWithFrame:CGRectMake(0, 0, WIDTH-80, 150)];
        [self addSubview:witch];
    }
}

@end
