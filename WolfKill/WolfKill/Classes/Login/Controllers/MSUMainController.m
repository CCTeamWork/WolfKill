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
#import "MainCenterView.h"

@interface MSUMainController ()

//中间所有的视图
@property (nonatomic, strong) MainCenterView *centerView;

@end

@implementation MSUMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = BGCOLOR;
    
    [self createNavi];
    [self createCharactorRoom];
    
    self.centerView =[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([MainCenterView class]) owner:nil options:nil]firstObject];
    _centerView.frame =CGRectMake(50, 64+40, WIDTH-100, HEIGHT-(64-40-100));
    _centerView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:_centerView];
                                  
}

//导航栏
- (void)createNavi{
    MSUNavgitionView *nav = [[MSUNavgitionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    [self.view addSubview:nav];
    [nav.backBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [nav.renBtn addTarget:self action:@selector(renBtnClick:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)btnClick:(UIButton *)sender{
    AlertBgView *alert =[[AlertBgView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    alert.clickRemove =YES;
    alert.bgColor =[UIColor colorWithWhite:0 alpha:0.2];
    [alert showView];
}

- (void)renBtnClick:(UIButton *)sender{
    
}

//人物形象
- (void)createCharactorRoom{
    MSUCharactorView *charac = [[MSUCharactorView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT - 64)];
    [self.view addSubview:charac];
    [charac.wordBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [charac.videoBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [charac.passBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

}


@end
