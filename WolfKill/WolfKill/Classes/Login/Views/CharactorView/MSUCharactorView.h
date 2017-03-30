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

//键盘按钮
@property (nonatomic , strong) UIButton *wordBtn;
//语音按钮
@property (nonatomic , strong) UIButton *videoBtn;
//礼物按钮
@property (nonatomic , strong) UIButton *giftBtn;
//跳过语音按钮
@property (nonatomic , strong) UIButton *passBtn;

@end
