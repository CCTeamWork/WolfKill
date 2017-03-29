//
//  MSURightCharactorView.h
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSURightCharactorView : UIView


//右侧人物
@property (nonatomic , strong) UIButton *charactBtn;
//右侧身份星标图片
@property (nonatomic , strong) UIImageView *identiIma;


//房主识别图片
@property (nonatomic , strong) UIImageView *roomOwnerIma;
//准备标识
@property (nonatomic , strong) UIImageView *prepareIma;
//死亡标识
@property (nonatomic , strong) UIImageView *deathIma;
//语音标识
@property (nonatomic , strong) UIImageView *audioIma;
//倒计时标识
@property (nonatomic , strong) UIButton *timeBtn;

//警察身份图片
@property (nonatomic , strong) UIImageView *policeIma;
//狼人身份标识
@property (nonatomic , strong) UIImageView *wolfIma;
//女巫身份标识
@property (nonatomic , strong) UIImageView *witchIma;
//丘比特身份标识
@property (nonatomic , strong) UIImageView *cupidIma;
//狼人杀人标识
@property (nonatomic , strong) UIButton *handsBtn;

@end
