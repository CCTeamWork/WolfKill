//
//  MSUMainController.m
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyri/System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearchght © 2017年 Zhuge_Su. All rights reserved.
//

#import "MSUMainController.h"
#import "MSUHeader.h"
#import "MSUNavgitionView.h"
#import "MSUCharactorView.h"

#import "AlertBgView.h"
#import "MSUAlertDetailView.h"
#import "MainCenterView.h"

@interface MSUMainController ()<UITextFieldDelegate>

//两边人物视图
@property (nonatomic, strong) MSUCharactorView *characView;
//中间所有的视图
@property (nonatomic, strong) MainCenterView *centerView;
//设置密码视图
@property (nonatomic , strong) MSUAlertDetailView *msuAlertView;

@end

@implementation MSUMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = BGCOLOR;
    
    [self createNavi];
    [self createCharactorRoom];
    // 中间视图
    self.centerView =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([MainCenterView class]) owner:nil options:nil]firstObject];
    _centerView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:_centerView];
    [_centerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(64+15);
        make.left.equalTo(_characView.charactBtn.right).offset(10);
        make.right.equalTo(_characView.charactBtn.left).offset(-10);
        make.bottom.equalTo(_characView.charactBtn.top).offset(10);
    }];
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
}

- (void)gouBtnClick:(UIButton *)sender{
    
}

- (void)sureOrCancelBtnClick:(UIButton *)sender{
    
}

- (void)renBtnClick:(UIButton *)sender{
    _centerView.topText =@"sqz宋清正sqz\n测试文字\n(15s)";
}

//人物形象
- (void)createCharactorRoom {
    self.characView = [[MSUCharactorView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    [self.view addSubview:_characView];
    
    [_characView.wordBtn addTarget:self action:@selector(characBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_characView.videoBtn addTarget:self action:@selector(characBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_characView.passBtn addTarget:self action:@selector(characBtnClick:) forControlEvents:UIControlEventTouchUpInside];
 

}

- (void)characBtnClick:(UIButton *)sender{

}




@end
