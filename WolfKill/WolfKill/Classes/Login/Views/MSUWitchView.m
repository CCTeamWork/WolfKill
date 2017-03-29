//
//  MSUWitchView.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUWitchView.h"
#import "MSUHeader.h"

@implementation MSUWitchView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
        
    }
    return self;
}


- (void)createView{
    //背景视图
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH-80, 150)];
    [self addSubview:navView];

    
    UILabel *witchWordLab = [[UILabel alloc] init];
    [witchWordLab setAttributedText:[self changeLabelWithText:@"4号玩家被刀\n是否使用解药"]];
//    witchWordLab.font = [UIFont systemFontOfSize:20];
    witchWordLab.numberOfLines = 0;
    witchWordLab.textAlignment = NSTextAlignmentCenter;
    [navView addSubview:witchWordLab];
    [witchWordLab makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.left.equalTo(self.left).offset(0);
        make.width.equalTo(WIDTH-80);
        make.height.equalTo(100);
    }];
    
    NSArray *textArr = @[@"是",@"否"];
    for (NSInteger index = 0; index < 2; index++) {
        self.witchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_witchBtn];
        [_witchBtn setTitle:textArr[index] forState:UIControlStateNormal];
        [_witchBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -60, 0, 0)];
        _witchBtn.titleLabel.font = [UIFont fontWithName:GAMEFONT size:24];
        [_witchBtn setImage:[UIImage imageNamed:@"fang"] forState:UIControlStateNormal];
        [_witchBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 40, 0, 0)];
        [_witchBtn makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.bottom).offset(0);
            make.left.equalTo(self.left).offset(self.frame.size.width * 0.5 - 80 + index * 80);
            make.width.equalTo(80);
            make.height.equalTo(50);
        }];

    }
}

- (NSMutableAttributedString *)changeLabelWithText:(NSString*)needText
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:GAMEFONT size:26] range:NSMakeRange(0,2)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:255/255.0 green:71/255.0 blue:89/255.0 alpha:1] range:NSMakeRange(0,2)];
    
    [attrString addAttribute:NSKernAttributeName value:@1.0f range:NSMakeRange(0, needText.length)];
    
    [attrString addAttribute:NSFontAttributeName value:[UIFont fontWithName:GAMEFONT size:20] range:NSMakeRange(2,needText.length-2)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(2,needText.length-2)];
    
    return attrString;
}

@end
