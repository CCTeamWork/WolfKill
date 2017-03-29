//
//  NSString+ChangeString.h
//  WolfKill
//
//  Created by Zhuge_Su on 2017/3/29.
//  Copyright © 2017年 Zhuge_Su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ChangeString)

+ (NSMutableAttributedString *)changeLabelWithText:(NSString*)needText FontFormatName:(NSString *)name FontSize:(NSInteger)size ReplaceOtherSize:(NSInteger)replaceSize RangeLocation:(NSInteger)location WithRangeLenth:(NSInteger)lenth;
@end
