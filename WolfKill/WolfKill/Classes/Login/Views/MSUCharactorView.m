//
//  MSUCharactorView.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUCharactorView.h"
#import "MSUHeader.h"
#import "MSULeftCharactorView.h"
#import "MSURightCharactorView.h"
#import "MSUBottomCharactorView.h"

@implementation MSUCharactorView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self createView];
        
    }
    return self;
}

/*====================================初始化==================================================*/
- (NSMutableArray *)policeArr{
    if (!_policeArr) {
        _policeArr = [NSMutableArray array];
    }
    return _policeArr;
}

- (NSMutableArray *)prepareArr{
    if (!_prepareArr) {
        _prepareArr = [NSMutableArray array];
    }
    return _prepareArr;
}

- (NSMutableArray *)roomOwnerArr{
    if (!_roomOwnerArr) {
        _roomOwnerArr = [NSMutableArray array];
    }
    return _roomOwnerArr;
}

- (NSMutableArray *)identiArr{
    if (!_identiArr) {
        _identiArr = [NSMutableArray array];
    }
    return _identiArr;
}

- (NSMutableArray *)charactArr{
    if (!_charactArr) {
        _charactArr = [NSMutableArray array];
    }
    return _charactArr;
}

- (NSMutableArray *)deathArr{
    if (!_deathArr) {
        _deathArr = [NSMutableArray array];
    }
    return _deathArr;
}

- (NSMutableArray *)wolfArr{
    if (!_wolfArr) {
        _wolfArr = [NSMutableArray array];
    }
    return _wolfArr;
}

- (NSMutableArray *)cupidArr{
    if (!_cupidArr) {
        _cupidArr = [NSMutableArray array];
    }
    return _cupidArr;
}

- (NSMutableArray *)handsArr{
    if (!_handsArr) {
        _handsArr = [NSMutableArray array];
    }
    return _handsArr;
}

- (NSMutableArray *)audioArr{
    if (!_audioArr) {
        _audioArr = [NSMutableArray array];
    }
    return _audioArr;
}

- (NSMutableArray *)timeArr{
    if (!_timeArr) {
        _timeArr = [NSMutableArray array];
    }
    return _timeArr;
}

- (void)createView{
    //背景视图
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    [self addSubview:bgView];
    
    //背景图片
    UIImageView *bgImaView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
    bgImaView.image = [UIImage imageNamed:@"bg"];
    [bgView addSubview:bgImaView];
    
/*====================================左侧==================================================*/
    for (int i = 0; i < 6; i++) {
        MSULeftCharactorView *leftView = [[MSULeftCharactorView alloc] initWithFrame:CGRectMake(0, 20 + (characHeight + 10) * i, 20 + characWidth + 60, characHeight  )];
        [bgView addSubview:leftView];
        [self.charactArr addObject:leftView.charactBtn];
        [self.identiArr addObject:leftView.identiIma];
        [self.roomOwnerArr addObject:leftView.roomOwnerIma];
        [self.prepareArr addObject:leftView.prepareIma];
        [self.deathArr addObject:leftView.deathIma];
        [self.audioArr addObject:leftView.audioIma];
        [self.timeArr addObject:leftView.timeBtn];
        [self.policeArr addObject:leftView.policeIma];
        [self.wolfArr addObject:leftView.wolfIma];
        [self.witchArr addObject:leftView.witchIma];
        [self.cupidArr addObject:leftView.cupidIma];
        [self.handsArr addObject:leftView.handsBtn];
        
        
        MSURightCharactorView *rightView = [[MSURightCharactorView alloc] initWithFrame:CGRectMake(WIDTH - (20 + characWidth + 60), 20 + (characHeight + 10) * i, 20 + characWidth + 60, characHeight)];
        [bgView addSubview:rightView];
        [self.charactArr addObject:rightView.charactBtn];
        [self.charactArr addObject:rightView.charactBtn];
        [self.identiArr addObject:rightView.identiIma];
        [self.roomOwnerArr addObject:rightView.roomOwnerIma];
        [self.prepareArr addObject:rightView.prepareIma];
        [self.deathArr addObject:rightView.deathIma];
        [self.audioArr addObject:rightView.audioIma];
        [self.timeArr addObject:rightView.timeBtn];
        [self.policeArr addObject:rightView.policeIma];
        [self.wolfArr addObject:rightView.wolfIma];
        [self.witchArr addObject:rightView.witchIma];
        [self.cupidArr addObject:rightView.cupidIma];
        [self.handsArr addObject:rightView.handsBtn];

    }
    
    for (NSInteger index = 0; index < 3; index++) {
        CGFloat botCenHei;
        if (index == 1) {
            botCenHei = HEIGHT - 64 - 44 - 10 - characHeight - 40;
        }else{
            botCenHei = HEIGHT - 64 - 44 - 10 - characHeight;
        }
        MSUBottomCharactorView *bottomView = [[MSUBottomCharactorView alloc] initWithFrame:CGRectMake( leftSpace + bottomSpace + (bottomSpace + characWidth) * index,  botCenHei, 30 + characWidth + 20, characHeight)];
        [bgView addSubview:bottomView];
        [self.charactArr addObject:bottomView.charactBtn];
        [self.charactArr addObject:bottomView.charactBtn];
        [self.identiArr addObject:bottomView.identiIma];
        [self.roomOwnerArr addObject:bottomView.roomOwnerIma];
        [self.prepareArr addObject:bottomView.prepareIma];
        [self.deathArr addObject:bottomView.deathIma];
        [self.audioArr addObject:bottomView.audioIma];
        [self.timeArr addObject:bottomView.timeBtn];
        [self.policeArr addObject:bottomView.policeIma];
        [self.wolfArr addObject:bottomView.wolfIma];
        [self.witchArr addObject:bottomView.witchIma];
        [self.cupidArr addObject:bottomView.cupidIma];
        [self.handsArr addObject:bottomView.handsBtn];
    }
    
    

/*====================================遍历取帽==================================================*/

    /*
    
    for (NSInteger index = 0; index < _policeArr.count; index++) {
        UIImageView *ima = _policeArr[index];
        ima.hidden = YES;
    }
    
    for (NSInteger index = 0; index < _roomOwnerArr.count; index++) {
        UIImageView *ima = _roomOwnerArr[index];
        ima.hidden = YES;
    }
    
    for (NSInteger index = 0; index < _prepareArr.count; index++) {
        UIImageView *ima = _prepareArr[index];
        ima.hidden = YES;
    }

    for (NSInteger index = 0; index < _wolfArr.count; index++) {
        UIImageView *ima = _wolfArr[index];
        ima.hidden = YES;
    }
    
    for (NSInteger index = 0; index < _deathArr.count; index++) {
        UIImageView *ima = _deathArr[index];
        ima.hidden = YES;
    }

    for (NSInteger index = 0; index < _cupidArr.count; index++) {
        UIImageView *ima = _cupidArr[index];
        ima.hidden = YES;
    }

    for (NSInteger index = 0; index < _handsArr.count; index++) {
        UIImageView *ima = _handsArr[index];
        ima.hidden = YES;
    }
    
     */
     
//    for (NSInteger index = 0; index < _audioArr.count; index++) {
//        UIImageView *ima = _audioArr[index];
//        ima.hidden = YES;
//    }
    
    for (NSInteger index = 0; index < _identiArr.count; index++) {
    }
    
    for (NSInteger index = 0; index < _charactArr.count; index++) {
    }
    
/*====================================最下面三个按钮==================================================*/
    //键盘按钮
    self.wordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView addSubview:_wordBtn];
    _wordBtn.adjustsImageWhenHighlighted = NO;
    [_wordBtn setImage:[UIImage imageNamed:@"jianpan"] forState:UIControlStateNormal];
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
