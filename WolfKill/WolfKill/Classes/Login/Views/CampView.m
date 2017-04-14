//
//  CampView.m
//  WolfKill
//
//  Created by 清正 on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "CampView.h"

@implementation CampView {
    __weak IBOutlet NSLayoutConstraint *center_place;
}

- (instancetype)initWithFrame:(CGRect)frame type:(CampViewType)type {
    self =[super initWithFrame:frame];
    if (self) {
        self =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        if (type == CampViewTypeWerewolf) {
            [self creactWerewolfNumber];
        } else if (type == CampViewTypeGoodPerson) {
            [self creactGoodPerson];
        } else {
            [self creactLoverView];
        }
    }
    return self;
}

- (NSMutableArray*)buttonArray {
    if (!_buttonArray) {
        _buttonArray =[NSMutableArray array];
    }
    return _buttonArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)creactWerewolfNumber {
    [_bgImageView setBackgroundImage:[UIImage imageNamed:@"langrenzhengyin"] forState:UIControlStateNormal];
    
    NSInteger count =4;
    CGFloat width =32;
    CGFloat space =(CGRectGetWidth(_bgImageView.frame)-count*width)/(count+1);

    for (NSInteger index=0; index<5; index++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[NSString stringWithFormat:@"%ld", (long)index] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"huangsexingxing"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"juwsexingxing"] forState:UIControlStateSelected];
        button.titleEdgeInsets =UIEdgeInsetsMake(0, 0, -3, 0);
        button.titleLabel.font =[UIFont boldSystemFontOfSize:15];
        button.frame =CGRectMake(space+((width+space)*(index%count))-5, 10+(width+10)*(index/count), width, width);
        [_btnBgView addSubview:button];
        [self.buttonArray addObject:button];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"siwang_bad"]];
        imageView.tag =201703;
        imageView.center =CGPointMake(width-5, width-5);
        [button addSubview:imageView];
        
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectZero];
        label.tag =201704;
        label.textAlignment =NSTextAlignmentCenter;
        label.textColor =[UIColor whiteColor];
        label.font =[UIFont systemFontOfSize:13];
        label.center =CGPointMake(5, width-5);
        label.bounds =CGRectMake(0, 0, 20, 20);
        label.text =@"";
        [button addSubview:label];
        
        label.hidden =YES;
    }
}

- (void)creactGoodPerson {
    [_bgImageView setBackgroundImage:[UIImage imageNamed:@"goodZY"] forState:UIControlStateNormal];

    NSInteger count =4;
    CGFloat width =32;
    CGFloat space =(CGRectGetWidth(_bgImageView.frame)-count*width)/(count+1);

    for (NSInteger index=0; index<10; index++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[NSString stringWithFormat:@"%ld", (long)index] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"huangsexingxing"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"juwsexingxing"] forState:UIControlStateSelected];
        button.titleEdgeInsets =UIEdgeInsetsMake(0, 0, -3, 0);
        button.titleLabel.font =[UIFont boldSystemFontOfSize:15];
        button.frame =CGRectMake(space+((width+space)*(index%count))-5, (width+5)*(index/count), width, width);
        [_btnBgView addSubview:button];
        [self.buttonArray addObject:button];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"siwang_bad"]];
        imageView.tag =201703;
        imageView.center =CGPointMake(width-5, width-5);
        [button addSubview:imageView];
        
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectZero];
        label.tag =201704;
        label.textAlignment =NSTextAlignmentCenter;
        label.textColor =[UIColor whiteColor];
        label.font =[UIFont systemFontOfSize:13];
        label.center =CGPointMake(5, width-5);
        label.bounds =CGRectMake(0, 0, 20, 20);
        label.text =@"";
        [button addSubview:label];
        
        label.hidden =YES;
    }
}

- (void)creactLoverView {
    [_bgImageView setBackgroundImage:[UIImage imageNamed:@"qinglvzhengyin"] forState:UIControlStateNormal];
    
    NSInteger count =4;
    CGFloat width =32;
    CGFloat space =(CGRectGetWidth(_bgImageView.frame)-count*width)/(count+1);
    
    for (NSInteger index=0; index<3; index++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[NSString stringWithFormat:@"%ld", (long)index] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"huangsexingxing"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"juwsexingxing"] forState:UIControlStateSelected];
        button.titleEdgeInsets =UIEdgeInsetsMake(0, 0, -3, 0);
        button.titleLabel.font =[UIFont boldSystemFontOfSize:15];
        button.frame =CGRectMake(space+((width+space)*(index%count))-5, (width+5)*(index/count), width, width);
        [_btnBgView addSubview:button];
        [self.buttonArray addObject:button];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"siwang_bad"]];
        imageView.tag =201703;
        imageView.center =CGPointMake(width-5, width-5);
        [button addSubview:imageView];
        
        UILabel *label =[[UILabel alloc]initWithFrame:CGRectZero];
        label.tag =201704;
        label.textAlignment =NSTextAlignmentCenter;
        label.textColor =[UIColor whiteColor];
        label.font =[UIFont systemFontOfSize:13];
        label.center =CGPointMake(5, width-5);
        label.bounds =CGRectMake(0, 0, 20, 20);
        label.text =@"";
        [button addSubview:label];
        
        label.hidden =YES;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
