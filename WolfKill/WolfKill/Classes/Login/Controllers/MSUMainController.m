//
//  MSUMainController.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyri/System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearchght © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUMainController.h"
#import "LiveViewController.h"
#import "MSUHeader.h"
#import "MSUNavgitionView.h"
#import "MSUCharactorView.h"

#import "MSUAlertDetailView.h"
//弹出框背景
#import "AlertBgView.h"
// 中间显示提示框
#import "MainCenterView.h"
// 对战阵营
#import "CampView.h"
// 选择邀请好友
#import "SelectFriendView.h"
// 查看玩家资料
#import "ButtonView.h"

#import "PlayerInfoView.h"

#import "MSUPoliceOrWitchView.h"


@interface MSUMainController ()<UITextFieldDelegate>

//两边人物视图
@property (nonatomic, strong) MSUCharactorView *characView;
//中间所有的视图
@property (nonatomic, strong) MainCenterView *centerView;
//设置密码视图
@property (nonatomic , strong) MSUAlertDetailView *msuAlertView;

@property (nonatomic , strong) UIImageView *labaView;

@end

@implementation MSUMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }

    self.view.backgroundColor = BGCOLOR;
    
    [self createNavi];
    [self createCharactorRoom];
    // 中间视图
    self.centerView =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([MainCenterView class]) owner:nil options:nil]firstObject];
    _centerView.backgroundColor =[UIColor clearColor];
    [self.centerView.prepareButton addTarget:self action:@selector(prepareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_centerView];
    [_centerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(64+15);
        make.left.equalTo(self.view.left).offset(100);
        make.right.equalTo(self.view.right).offset(-100);
        make.bottom.equalTo(self.view.bottom).offset(100);
    }];
    _centerView.centerText =@"";
    
//    LiveViewController *liveVC =[[LiveViewController alloc]init];
//    [self addChildViewController:liveVC];
//    [self.view insertSubview:liveVC.view aboveSubview:self.centerView];
    
    MSUPoliceOrWitchView *chooseView = [[MSUPoliceOrWitchView alloc] initWithFrame:CGRectMake(40, HEIGHT*0.5 - 120, WIDTH-80, 150) isPolice:NO];
    chooseView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:chooseView];
    
}

//导航栏
- (void)createNavi{
    MSUNavgitionView *nav = [[MSUNavgitionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    [self.view addSubview:nav];
    [nav.backBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [nav.renBtn addTarget:self action:@selector(renBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)sender {
    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =YES;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.4];
    [alert showView];
    
    self.msuAlertView = [[MSUAlertDetailView alloc] initWithFrame:CGRectMake(40, 0, WIDTH-80, 100)];
    [alert.centerView addSubview:_msuAlertView];
    [_msuAlertView.gouBtn addTarget:self action:@selector(gouBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_msuAlertView.sureOrCancelBtn addTarget:self action:@selector(sureOrCancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _centerView.topText =@"宋清正\n测试文字\n(0s)";
    _centerView.centerText =@"是否使用毒药?";
}

- (void)gouBtnClick:(UIButton *)sender{
    
}

- (void)sureOrCancelBtnClick:(UIButton *)sender {
    [_msuAlertView.superview.superview removeFromSuperview];

    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =YES;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.4];
    [alert showView];
    
    alert.centerView_height.constant =200;
    ButtonView *btnView =[[[NSBundle mainBundle]loadNibNamed:@"ButtonView" owner:nil options:nil] firstObject];
    [alert.centerView addSubview:btnView];

    [btnView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.centerView.top);
        make.left.equalTo(alert.centerView.left);
        make.right.equalTo(alert.centerView.right);
        make.height.equalTo(200);
    }];
}

- (void)renBtnClick:(UIButton *)sender{
    _centerView.topText =@"sqz宋清正sqz\n测试文字\n(15s)";
    
    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =NO;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.8];
    [alert showView];
    alert.centerView_height.constant =400;
    
    PlayerInfoView *playerView =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([PlayerInfoView class]) owner:nil options:nil] lastObject];
    [alert.centerView addSubview:playerView];
    [playerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.centerView.top);
        make.left.equalTo(alert.centerView.left).offset(10);
        make.right.equalTo(alert.centerView.right).offset(-10);
        make.bottom.equalTo(alert.centerView.bottom);
    }];
    [playerView clickButtonCallbackFunction:^(UIButton *button) {
        if (button ==playerView.closeButton) {
            [alert removeView];
        }
    }];
}

- (void)keywordsButtonClick:(UIButton*)button {
    [self gameResultView:@[@""].mutableCopy werewolf:@[@"", @"", @""].mutableCopy civilian:@[@"",@"",@""].mutableCopy];
}

/// 布局阵营视图
- (void)gameResultView:(NSMutableArray*)lovers werewolf:(NSMutableArray*)werewolfs civilian:(NSMutableArray*)civilians {
    
    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =YES;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.8];
    [alert showView];
    
    //对阵信息上一部分
    CampView *oneView =[[CampView alloc]initWithFrame:CGRectZero type:CampViewTypeWerewolf];
    oneView.typeImageView.image =[UIImage imageNamed:@"lose"];
    [alert.topView addSubview:oneView];
    [oneView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.topView.bottom).offset(-150);
        make.left.equalTo(alert.topView.left).offset(10);
        make.right.equalTo(alert.topView.right).offset(-10);
        make.height.equalTo(150);
    }];
    // 对阵信息文字
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectZero];
    imageView.contentMode =UIViewContentModeScaleAspectFit;
    imageView.image =[UIImage imageNamed:@"duizhantongji"];
    [alert.topView addSubview:imageView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oneView.bgImageView.top).offset(-25);
        make.left.equalTo(oneView.left).offset(10);
        make.right.equalTo(oneView.right).offset(-10);
        make.height.equalTo(35);
    }];
    if (lovers.count>0) {
        alert.centerView_height.constant =170;
        
        //对阵信息中间部分
        CampView *twoView =[[CampView alloc]initWithFrame:CGRectZero type:CampViewTypeGoodPerson];
        twoView.typeImageView.image =[UIImage imageNamed:@"win"];
        [alert.centerView addSubview:twoView];
        
        [twoView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(alert.centerView.top).offset(10);
            make.left.equalTo(alert.centerView.left).offset(10);
            make.right.equalTo(alert.centerView.right).offset(-10);
            make.height.equalTo(150);
        }];
        
        //对阵信息下方部分
        CampView *threeView =[[CampView alloc]initWithFrame:CGRectZero type:CampViewTypeLover];
        threeView.typeImageView.image =[UIImage imageNamed:@"lose"];
        [alert.btmView addSubview:threeView];
        
        [threeView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(alert.btmView.top).offset(0);
            make.left.equalTo(alert.btmView.left).offset(10);
            make.right.equalTo(alert.btmView.right).offset(-10);
            make.height.equalTo(150);
        }];
    } else {
        alert.centerView_height.constant =0;
        //对阵信息下方部分
        CampView *threeView =[[CampView alloc]initWithFrame:CGRectZero type:CampViewTypeGoodPerson];
        threeView.typeImageView.image =[UIImage imageNamed:@"win"];
        [alert.btmView addSubview:threeView];
        
        [threeView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(alert.btmView.top).offset(0);
            make.left.equalTo(alert.btmView.left).offset(10);
            make.right.equalTo(alert.btmView.right).offset(-10);
            make.height.equalTo(150);
        }];
    }
}

//人物形象
- (void)createCharactorRoom {
    self.characView = [[MSUCharactorView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    [self.view addSubview:_characView];
    [_characView.wordBtn addTarget:self action:@selector(keywordsButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_characView.videoBtn addTarget:self action:@selector(characBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_characView.passBtn addTarget:self action:@selector(characBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)characBtnClick:(UIButton *)sender{
    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =NO;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.8];
    [alert showView];
    alert.centerView_center.constant =HEIGHT/2-20;
    alert.centerView_height.constant =0;
    
    SelectFriendView *friendView =[[[NSBundle mainBundle]loadNibNamed:@"SelectFriendView" owner:nil options:nil] firstObject];
    [friendView removeButtonWithBlock:^{
        [friendView removeFromSuperview];
        [alert removeView];
    }];
    [alert.topView addSubview:friendView];
    
    [friendView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.topView.top).offset(10);
        make.left.equalTo(alert.topView.left).offset(10);
        make.right.equalTo(alert.topView.right).offset(-10);
        make.bottom.equalTo(alert.topView.bottom).offset(-10);
    }];
}

#pragma mark 准备与取消准备
- (void)prepareButtonClick:(UIButton*)button {
    NSLog(@"button=%@", button);
    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =YES;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.8];
    [alert showView];
    alert.centerView_height.constant =200;

    UILabel * titleName =[[UILabel alloc]init];
    titleName.text =@"你的身份是: 狼人 (5s)";
    titleName.textAlignment =NSTextAlignmentCenter;
    titleName.font =[UIFont boldSystemFontOfSize:20];
    titleName.textColor =[UIColor whiteColor];
    [alert.topView addSubview:titleName];
    
    [titleName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.topView.bottom).offset(-40);
        make.left.equalTo(alert.topView.left);
        make.right.equalTo(alert.topView.right);
    }];
    
    UIImageView * imageView =[[UIImageView alloc]init];
    imageView.image =[UIImage imageNamed:@"langren"];
    imageView.contentMode =UIViewContentModeScaleAspectFit;
    [alert.centerView addSubview:imageView];
    
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.centerView.top);
        make.left.equalTo(alert.centerView.left);
        make.right.equalTo(alert.centerView.right);
        make.bottom.equalTo(alert.centerView.bottom);
    }];
    
    UILabel * commentLabel =[[UILabel alloc]init];
    commentLabel.text =@"你的身份是: 狼人 (5s)";
    commentLabel.textAlignment =NSTextAlignmentCenter;
    commentLabel.font =[UIFont boldSystemFontOfSize:15];
    commentLabel.numberOfLines =0;
    commentLabel.textColor =[UIColor whiteColor];
    [alert.btmView addSubview:commentLabel];
    
    [commentLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(alert.btmView.top);
        make.left.equalTo(alert.btmView.left).offset(14);
        make.right.equalTo(alert.btmView.right).offset(-20);
    }];
}


@end
