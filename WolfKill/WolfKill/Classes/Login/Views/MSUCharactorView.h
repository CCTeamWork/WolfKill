//
//  MSUCharactorView.h
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSUCharactorView : UIView

@property (nonatomic , strong) NSMutableArray *charactArr;
@property (nonatomic , strong) NSMutableArray *identiArr;
@property (nonatomic , strong) NSMutableArray *roomOwnerArr;
@property (nonatomic , strong) NSMutableArray *prepareArr;
@property (nonatomic , strong) NSMutableArray *policeArr;
@property (nonatomic , strong) NSMutableArray *wolfArr;
@property (nonatomic , strong) NSMutableArray *deathArr;
@property (nonatomic , strong) NSMutableArray *witchArr;
@property (nonatomic , strong) NSMutableArray *cupidArr;
@property (nonatomic , strong) NSMutableArray *handsArr;
@property (nonatomic , strong) NSMutableArray *audioArr;
@property (nonatomic , strong) NSMutableArray *timeArr;



//左侧人物
@property (nonatomic , strong) UIButton *charactBtn;
//左侧身份星标图片
@property (nonatomic , strong) UIImageView *identiLeftIma;
//右侧身份星标图片
@property (nonatomic , strong) UIImageView *identiRightIma;
//底部身份星标图片
@property (nonatomic , strong) UIImageView *identiBottomIma;

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

//键盘按钮
@property (nonatomic , strong) UIButton *wordBtn;
//语音按钮
@property (nonatomic , strong) UIButton *videoBtn;
//礼物按钮
@property (nonatomic , strong) UIButton *giftBtn;
//跳过语音按钮
@property (nonatomic , strong) UIButton *passBtn;

@end
