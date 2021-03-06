//
//  MSUHeader.h
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/28.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#ifndef MSUHeader_h
#define MSUHeader_h

//masonry
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

//字体
#define GAMEFONT @"FashionFont052,by-www.6763.net"

//自定义屏幕宽高
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define BOUNDS [UIScreen mainScreen].bounds

//定义尺寸相关
#define statusHeight 20
#define characHeight (HEIGHT - 64 - 44 - 60 - 6 * 10)/6
#define characWidth 30
#define bottomSpace ((WIDTH - 40) - (5 * characWidth))/4
#define leftSpace 20
#define rightSpace 20
#define topSpace 20
#define identiWidth 20

//定义颜色
#define WHITECOLOR [UIColor whiteColor]
#define CAOGREENCOLOR [UIColor colorWithRed:105/255.0 green:184/255.0 blue:59/255.0 alpha:1.0]
#define LINECOLOR [UIColor colorWithRed:215/255.0 green:216/255.0 blue:221/255.0 alpha:1.0]
#define REDCOLOR [UIColor colorWithRed:236/255.0 green:58/255.0 blue:52/255.0 alpha:1.0]
#define TEXTCOLOR [UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0]
#define MIMABGCOLOR [UIColor colorWithRed:63/255.0 green:94/255.0 blue:153/255.0 alpha:1.0]
#define TIMECOLOR [UIColor colorWithRed:80/255.0 green:80/255.0 blue:80/255.0 alpha:1.0]
#define BGCOLOR [UIColor colorWithRed:12/255.0 green:77/255.0 blue:146/255.0 alpha:1.0]
#define SLIVERYCOLOR [UIColor colorWithRed:240/255.0 green:240/255.0 blue:241/255.0 alpha:1.0]
#define BLUECOLOR [UIColor colorWithRed:97/255.0 green:177/255.0 blue:238/255.0 alpha:1.0]
#define YELLOWCOLOR [UIColor colorWithRed:221/255.0 green:215/255.0 blue:185/255.0 alpha:1.0]
#define DEEPREDCOLOR [UIColor colorWithRed:85/255.0 green:27/255.0 blue:29/255.0 alpha:1.0]

///分割线和文字 居左对齐
#define TableViewFileAndLineTypeLeft \
if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {     \
[tableView setSeparatorInset:UIEdgeInsetsZero];                     \
} if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {    \
[tableView setLayoutMargins:UIEdgeInsetsZero];                      \
} if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {         \
[cell setLayoutMargins:UIEdgeInsetsZero];                           \
}
//Debug调试
#ifdef DEBUG
#define NSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define NSLog(format, ...)
#endif

#endif /* MSUHeader_h */
