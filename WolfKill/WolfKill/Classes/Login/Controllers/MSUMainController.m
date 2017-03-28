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

@interface MSUMainController ()

@end

@implementation MSUMainController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = WHITECOLOR;
    
    [self createNavi];
    [self createCharactorRoom];
}

//导航栏
- (void)createNavi{
    MSUNavgitionView *nav = [[MSUNavgitionView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    [self.view addSubview:nav];
    [nav.backBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [nav.renBtn addTarget:self action:@selector(renBtnClick:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)btnClick:(UIButton *)sender{

}

- (void)renBtnClick:(UIButton *)sender{
    
}

//人物形象
- (void)createCharactorRoom{
    MSUCharactorView *charac = [[MSUCharactorView alloc] initWithFrame:CGRectMake(0, 62, WIDTH, HEIGHT - 64 - 44)];
    [self.view addSubview:charac];
}


@end
